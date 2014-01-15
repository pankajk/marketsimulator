from marketsim.gen._out._TimeSerie import TimeSerie
from marketsim import event, _, Side, types, meta, timeserie, context

class _Holder_Impl(object):

    def __init__(self):
        if type(self.timeseries) is dict:
            self.timeseries = [TimeSerie(k,v) for k,v in self.timeseries.iteritems()]

    def addTimeSerie(self, source, graph):
        ts = TimeSerie(source, graph)
        self.timeseries.append(ts)

class _Base_Impl(_Holder_Impl):
    """ Base class for traders.
    Responsible for bookkeeping P&L of the trader and
    maintaining on_order_sent and on_traded events
    """

    def __init__(self):
        _Holder_Impl.__init__(self)
        # event to be fired when an order has been sent
        self.on_order_sent = event.Event()
        # event to be fired when an order issued by the trader has been matched
        self.on_order_matched = event.Event()
        # event to be fired when an order issued by the trader has been cancelled
        self.on_order_disposed = event.Event()
        # event to be fired when a trader's is traded; to be removed
        self.on_traded = event.Event()
        self.reset()

    def updateContext(self, context):
        context.trader = self
        context.orderProcessor = self

    def bind(self, ctx):
        self._ctx = ctx.context.copy()

    def reset(self):
        self._PnL = 0

    def _charge(self, price):
        self._PnL -= price

    def onOrderMatched(self, order, price, volume):
        """ Called when a trader's 'order' is traded against 'other' order
        at given 'price' and 'volume'
        Trader's P&L is updated and listeners are notified about the trade
        """
        pv = price * volume
        self.PnL += pv if order.side == Side.Sell else -pv

        self.on_order_matched.fire(self, order, price, volume)
        self.on_traded.fire(self)

    def onOrderDisposed(self, order):
        self.on_order_disposed.fire(self, order)

    def _makeSubscribedTo(self, order):
        """ Makes trader subscribed to 'order' on_matched event
        before sending it to the order book
        Returns the order itself
        """
        order.owner = self
        return order

    def send(self, book, order):
        """ Sends 'order' to 'book'
        After having the order sent notifies listeners about it
        """
        context.bind(order, self._ctx)
        if isinstance(order, types.IOrder):
            order = self._makeSubscribedTo(order)
        book.process(order)
        if isinstance(order, types.IOrder):
            self.on_order_sent.fire(order)

class _SingleAsset_Impl(_Base_Impl, types.ISingleAssetTrader):
    """ A trader that trades a single asset on a single market.

        Parameters:

        **orderBook**
            order book for the asset being traded

        **strategies**
            array of strategies run by the trader

        **amount**
            current position of the trader (number of assets that it owns)

        **PnL**
            current trader balance (number of money units that it owns)
    """

    def __init__(self):
        _Base_Impl.__init__(self)
        self._subscription = event.subscribe(self.strategy.on_order_created, _(self).send, self)
        self._alias = [self.label]

    def reset(self):
        self._amount = 0

    _internals = ['orderBook'] # hack in order to make it processed first

    def onOrderMatched(self, order, price, volume):
        """ Called when a trader's 'order' is traded against 'other' order
        at given 'price' and 'volume'
        Trader's amount and P&L is updated and listeners are notified about the trade
        """
        dVolume = volume if order.side == Side.Buy else -volume
        self._amount += dVolume
        _Base_Impl.onOrderMatched(self, order, price, volume)


    @property
    def orderBooks(self):
        return [self.orderBook]

    @property
    def _digitsToShow(self):
        return self.orderBook._digitsToShow

    def send(self, order, unused = None):
        _Base_Impl.send(self, self.orderBook, order)