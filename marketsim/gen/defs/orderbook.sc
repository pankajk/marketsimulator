@category = "Asset"
package orderbook
{
    /**
     * Order book for a single asset in a market.
     * Maintains two order queues for orders of different sides
     */
    @python.intrinsic("orderbook.local._Local_Impl")
    @label = "%(name)s"
    def Local(tickSize      = 0.01,
              _digitsToShow = 2,
              name          = "-orderbook-",
              timeseries    = [] : List[ITimeSerie]) : IOrderBook

    /**
     * Represent an *orderbook* from point of view of a remote trader connected
     * to the market by means of a *link* that introduces some latency in information propagation
     */
    @python.intrinsic("orderbook.remote._Remote_Impl")
    @label = "%(orderbook)s.name^remote"
    def Remote(orderbook     = Local(),
               link          = TwoWayLink(),
               timeseries    = [] : List[ITimeSerie]) : IOrderBook

    /**
     * Represents latency in information propagation from one agent to another one
     * (normally between a trader and a market).
     * Ensures that sending packets via a link preserves their order.
     */
    @python.intrinsic("orderbook.link._Link_Impl")
    def Link(/** function called for each packet in order to determine
               * when it will appear at the end point*/
             latency = const(0.001)) : ILink

    /**
     * Represents latency in information propagation between two agents
     * (normally between a trader and a market).
     * Ensures that sending packets via links preserves their order.
     * Holds two one-way links in opposite directions.
     */
    @python.intrinsic("orderbook.link._TwoWayLink_Impl")
    def TwoWayLink(/** Forward link (normally from a trader to a market)*/
                   up = Link(),
                   /** Backward link (normally from a market to a trader)*/
                   down = Link()) : ITwoWayLink

    @python.intrinsic("orderbook.of_trader._OfTrader_Impl")
    @label = "N/A"
    def OfTrader(Trader = trader.SingleProxy() : IAccount) : IOrderBook

    @python.intrinsic("orderbook.proxy._Queue_Impl")
    def Queue(book = OfTrader(), side = side.Sell()) : IOrderQueue

    @python.intrinsic("orderbook.proxy._Asks_Impl")
    def Asks(book = OfTrader()) = Queue(book, side.Sell())

    @python.intrinsic("orderbook.proxy._Bids_Impl")
    def Bids(book = OfTrader()) = Queue(book, side.Buy())

    @python.intrinsic("orderbook.props._BestPrice_Impl")
    def BestPrice(queue = Asks()) : IObservable[Price]

    @python.intrinsic("orderbook.last_price._LastPrice_Impl")
    def LastPrice(queue = Asks()) : IObservable[Price]

    @python.intrinsic("orderbook.last_trade._LastTradePrice_Impl")
    def LastTradePrice (queue = Asks()) : IObservable[Price]

    @python.intrinsic("orderbook.last_trade._LastTradeVolume_Impl")
    def LastTradeVolume(queue = Asks()) : IObservable[Volume]

    @python.observable
    def SafeSidePrice(queue = Asks(), defaultValue = constant(100.))
        = ObservablePrice(IfDefined(BestPrice(queue), IfDefined(LastPrice(queue), defaultValue)))

    @label = "Price_{%(alpha)s}^{%(queue)s}"
    def WeightedPrice(queue = Asks(), alpha = 0.015) =
        math.EW.Avg(LastTradePrice(queue)*LastTradeVolume(queue), alpha) / math.EW.Avg(LastTradeVolume(queue), alpha)

    @python.intrinsic("orderbook.props._TickSize_Impl")
    def TickSize(book = OfTrader()) => Price

    def Spread(book = OfTrader()) = ObservablePrice(ask.Price(book) - bid.Price(book))

    def MidPrice(book = OfTrader()) = ObservablePrice((ask.Price(book) + bid.Price(book)) / 2.0)

    @python.intrinsic("orderbook.cumulative_price.CumulativePrice_Impl")
    def CumulativePrice(book = OfTrader(), depth = constant()) : IObservable[Price]

    @python.intrinsic("orderbook.volume_levels.VolumeLevels_Impl")
    @label = "VolumeLevels(%(queue)s)"
    def VolumeLevels(queue = Asks(), volumeDelta = 30., volumeCount = 10) : IFunction[IVolumeLevels]

    def NaiveCumulativePrice(book = OfTrader(), depth = constant()) =
        ObservablePrice(if depth < 0.0 then depth*ask.Price(book) else if depth > 0.0 then depth*bid.Price(book) else 0.0)

    abstract package _base_impl
    {
        @label = "{{queue}}"
        def Price(book = OfTrader()) = BestPrice(_queue(book))

        @label = "Last({{queue}})"
        def LastPrice(book = OfTrader()) = orderbook.LastPrice(_queue(book))

        @label = "LastTrade({{queue}})"
        def LastTradePrice(book = OfTrader()) = orderbook.LastTradePrice(_queue(book))

        @label = "LastTradeVolume({{queue}})"
        def LastTradeVolume(book = OfTrader()) = orderbook.LastTradeVolume(_queue(book))

        @label = "[{{queue}}]_{%(alpha)s}"
        def WeightedPrice(book = OfTrader(), alpha = 0.015) = orderbook.WeightedPrice(_queue(book), alpha)
    }

    @queue = "Ask_{%(book)s}"
    package ask extends _base_impl
    {
        def _queue = Asks
    }

    @queue = "Bid^{%(book)s}"
    package bid extends _base_impl
    {
        def _queue = Bids
    }
}

