from marketsim import registry
from marketsim import Price
from marketsim import Price
from marketsim.ops._all import Observable
from marketsim import IOrderBook
from marketsim import context
@registry.expose(["Asset", "LastPrice"])
class LastPrice_Optional__IOrderBook_(Observable[Price]):
    """ 
    """ 
    def __init__(self, book = None):
        from marketsim import Price
        from marketsim import Price
        from marketsim.ops._all import Observable
        from marketsim.gen._out.orderbook._OfTrader import OfTrader as _orderbook_OfTrader
        from marketsim import rtti
        from marketsim import _
        from marketsim import event
        Observable[Price].__init__(self)
        self.book = book if book is not None else _orderbook_OfTrader()
        rtti.check_fields(self)
        self.impl = self.getImpl()
        event.subscribe(self.impl, _(self).fire, self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'book' : IOrderBook
    }
    def __repr__(self):
        return "Last(Ask_{%(book)s})" % self.__dict__
    
    _internals = ['impl']
    def getImpl(self):
        from marketsim.gen._out.orderbook._LastPrice import LastPrice as _orderbook_LastPrice
        from marketsim.gen._out.orderbook._Asks import Asks as _orderbook_Asks
        return _orderbook_LastPrice(_orderbook_Asks(self.book))
    
    def bind(self, ctx):
        self._ctx = ctx.clone()
    
    def reset(self):
        self.impl = self.getImpl()
        ctx = getattr(self, '_ctx', None)
        if ctx: context.bind(self.impl, ctx)
    
    def __call__(self, *args, **kwargs):
        return self.impl()
    
LastPrice = LastPrice_Optional__IOrderBook_
