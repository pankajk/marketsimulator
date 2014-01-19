@category = "Side"

package side() {
    @python.intrinsic("side._Sell_Impl")
    def Sell() : () => .Side
        
    
    @python.intrinsic("side._Buy_Impl")
    def Buy() : () => .Side
        
    
    @python.intrinsic("side._Buy_Impl")
    def Nothing() : () => .Side
        
}

package mathops() {
    /** Arc tangent of x, in radians.
     *
     */
    @category = "Trigonometric"
    @python.mathops("atan")
    def Atan(x = .constant(0.0)) : () => .Float
        
    
    /** Square root of x
     *
     */
    @category = "Log/Pow"
    @python.mathops("sqrt")
    @label = "\\sqrt{%(x)s}"
    def Sqrt(x = .constant(1.0)) : () => .Float
        
    
    /** Exponent of x
     *
     */
    @category = "Log/Pow"
    @python.mathops("exp")
    @label = "e^{%(x)s}"
    def Exp(x = .constant(1.0)) : () => .Float
        
    
    /** Natural logarithm of x (to base e)
     *
     */
    @category = "Log/Pow"
    @python.mathops("log")
    @label = "log(%(x)s)"
    def Log(x = .constant(1.0)) : () => .Float
        
    
    /** Return *x* raised to the power *y*.
     *
     * Exceptional cases follow Annex F of the C99 standard as far as possible.
     * In particular, ``pow(1.0, x)`` and ``pow(x, 0.0)`` always return 1.0,
     * even when *x* is a zero or a NaN.
     * If both *x* and *y* are finite, *x* is negative, and *y* is not an integer then
     * ``pow(x, y)`` is undefined, and raises ``ValueError``.
     */
    @category = "Log/Pow"
    @python.mathops("pow")
    @label = "%(base)s^{%(power)s}"
    def Pow(base = .constant(1.0),
            power = .constant(1.0)) : () => .Float
        
}
@category = "Event"

package event() {
    @python.intrinsic("event._Every_Impl")
    def Every(intervalFunc = .mathutils.rnd.expovariate(1.0)) : .IEvent
        
    
    @python.intrinsic("event._After_Impl")
    def After(delay = .constant(10.0)) : .IEvent
        
}
@category = "N/A"

package veusz() {
    @python.intrinsic("veusz._Graph_Impl")
    def Graph(name = "graph") : .IGraph
        
}

package mathutils() {
    package rnd() {
        /** Gamma distribution
         *
         *  Conditions on the parameters are |alpha| > 0 and |beta| > 0.
         *
         *  The probability distribution function is: ::
         *
         *               x ** (alpha - 1) * math.exp(-x / beta)
         *     pdf(x) =  --------------------------------------
         *                  math.gamma(alpha) * beta ** alpha
         */
        @python.random()
        def gammavariate(Alpha = 1.0,
                         Beta = 1.0) : () => .Float
            
        
        /** Normal distribution
         */
        @python.random()
        def normalvariate(/** |mu| is the mean                  */ Mu = 0.0,
                          /** |sigma| is the standard deviation */ Sigma = 1.0) : () => .Float
            
        
        /** Pareto distribution
         */
        @python.random()
        def paretovariate(/** |alpha| is the shape parameter*/ Alpha = 1.0) : () => .Float
            
        
        /** Triangular distribution
         *
         * Return a random floating point number *N* such that *low* <= *N* <= *high* and
         *       with the specified *mode* between those bounds.
         *       The *low* and *high* bounds default to zero and one.
         *       The *mode* argument defaults to the midpoint between the bounds,
         *       giving a symmetric distribution.
         */
        @python.random()
        def triangular(Low = 0.0,
                       High = 1.0,
                       Mode = 0.5) : () => .Float
            
        
        /** Von Mises distribution
         */
        @python.random()
        def vonmisesvariate(/** |mu| is the mean angle, expressed in radians between 0 and 2|pi|*/ Mu = 0.0,
                            /** |kappa| is the concentration parameter, which must be greater than or equal to zero.
                              *      If |kappa| is equal to zero, this distribution reduces
                              *      to a uniform random angle over the range 0 to 2|pi|        */ Kappa = 0.0) : () => .Float
            
        
        /** Uniform distribution
         *
         * Return a random floating point number *N* such that
         * *a* <= *N* <= *b* for *a* <= *b* and *b* <= *N* <= *a* for *b* < *a*.
         * The end-point value *b* may or may not be included in the range depending on
         * floating-point rounding in the equation *a* + (*b*-*a*) * *random()*.
         */
        @python.random()
        def uniform(Low = -10.0,
                    High = 10.0) : () => .Float
            
        
        /** Weibull distribution
         */
        @python.random()
        def weibullvariate(/** |alpha| is the scale parameter */ Alpha = 1.0,
                           /** |beta| is the shape parameter  */ Beta = 1.0) : () => .Float
            
        
        /** Exponential distribution
         *
         *  Returned values range from 0 to positive infinity
         */
        @python.random()
        def expovariate(/** |lambda| is 1.0 divided by the desired mean. It should be greater zero.*/ Lambda = 1.0) : () => .Float
            
        
        /** Log normal distribution
         *
         * If you take the natural logarithm of this distribution,
         *  you'll get a normal distribution with mean |mu| and standard deviation |sigma|.
         *  |mu| can have any value, and |sigma| must be greater than zero.
         */
        @python.random()
        def lognormvariate(Mu = 0.0,
                           Sigma = 1.0) : () => .Float
            
        
        /** Beta distribution
         *
         * Conditions on the parameters are |alpha| > 0 and |beta| > 0.
         * Returned values range between 0 and 1.
         */
        @python.random()
        def betavariate(Alpha = 1.0,
                        Beta = 1.0) : () => .Float
            
    }
}
@category = "Order"

package order() {
    package signed() {
        def Limit = .order.LimitSigned
        
        def Market = .order.MarketSigned
    }
    
    package _() {
        package side() {
            package price() {
                def Limit = .order._curried.side_price_Limit
                
                def ImmediateOrCancel = .order._curried.side_price_ImmediateOrCancel
                
                def StopLoss = .order._curried.side_price_StopLoss
                
                def WithExpiry = .order._curried.side_price_WithExpiry
                
                def FloatingPrice = .order._curried.side_price_FloatingPrice
                
                def Iceberg = .order._curried.side_price_Iceberg
                
                def Peg = .order._curried.side_price_Peg
            }
            
            def Limit = .order._curried.side_Limit
            
            def ImmediateOrCancel = .order._curried.side_ImmediateOrCancel
            
            def Market = .order._curried.side_Market
            
            def StopLoss = .order._curried.side_StopLoss
            
            def WithExpiry = .order._curried.side_WithExpiry
            
            def FloatingPrice = .order._curried.side_FloatingPrice
            
            def Iceberg = .order._curried.side_Iceberg
            
            def FixedBudget = .order._curried.side_FixedBudget
            
            def Peg = .order._curried.side_Peg
        }
        
        package side_price() {
            def Limit = .order._curried.sideprice_Limit
            
            def ImmediateOrCancel = .order._curried.sideprice_ImmediateOrCancel
            
            def StopLoss = .order._curried.sideprice_StopLoss
            
            def WithExpiry = .order._curried.sideprice_WithExpiry
            
            def FloatingPrice = .order._curried.sideprice_FloatingPrice
            
            def Iceberg = .order._curried.sideprice_Iceberg
            
            def Peg = .order._curried.sideprice_Peg
        }
        
        package side_volume() {
            package price() {
                def Limit = .order._curried.sidevolume_price_Limit
                
                def ImmediateOrCancel = .order._curried.sidevolume_price_ImmediateOrCancel
                
                def StopLoss = .order._curried.sidevolume_price_StopLoss
                
                def WithExpiry = .order._curried.sidevolume_price_WithExpiry
                
                def FloatingPrice = .order._curried.sidevolume_price_FloatingPrice
                
                def Iceberg = .order._curried.sidevolume_price_Iceberg
                
                def Peg = .order._curried.sidevolume_price_Peg
            }
            
            def Limit = .order._curried.sidevolume_Limit
            
            def ImmediateOrCancel = .order._curried.sidevolume_ImmediateOrCancel
            
            def Market = .order._curried.sidevolume_Market
            
            def StopLoss = .order._curried.sidevolume_StopLoss
            
            def WithExpiry = .order._curried.sidevolume_WithExpiry
            
            def FloatingPrice = .order._curried.sidevolume_FloatingPrice
            
            def Iceberg = .order._curried.sidevolume_Iceberg
            
            def Peg = .order._curried.sidevolume_Peg
        }
        
        package price() {
            def Limit = .order._curried.price_Limit
            
            def ImmediateOrCancel = .order._curried.price_ImmediateOrCancel
            
            def StopLoss = .order._curried.price_StopLoss
            
            def WithExpiry = .order._curried.price_WithExpiry
            
            def FloatingPrice = .order._curried.price_FloatingPrice
            
            def Iceberg = .order._curried.price_Iceberg
            
            def Peg = .order._curried.price_Peg
        }
        
        package volume_price() {
            def Limit = .order._curried.volumeprice_Limit
            
            def ImmediateOrCancel = .order._curried.volumeprice_ImmediateOrCancel
            
            def StopLoss = .order._curried.volumeprice_StopLoss
            
            def WithExpiry = .order._curried.volumeprice_WithExpiry
            
            def FloatingPrice = .order._curried.volumeprice_FloatingPrice
            
            def Iceberg = .order._curried.volumeprice_Iceberg
            
            def Peg = .order._curried.volumeprice_Peg
        }
        
        package signedVolume() {
            def LimitSigned = .order._curried.signedVolume_LimitSigned
            
            def MarketSigned = .order._curried.signedVolume_MarketSigned
        }
        
        package price_volume() {
            def Limit = .order._curried.pricevolume_Limit
            
            def ImmediateOrCancel = .order._curried.pricevolume_ImmediateOrCancel
            
            def StopLoss = .order._curried.pricevolume_StopLoss
            
            def WithExpiry = .order._curried.pricevolume_WithExpiry
            
            def FloatingPrice = .order._curried.pricevolume_FloatingPrice
            
            def Iceberg = .order._curried.pricevolume_Iceberg
            
            def Peg = .order._curried.pricevolume_Peg
        }
        
        package volume() {
            package price() {
                def Limit = .order._curried.volume_price_Limit
                
                def ImmediateOrCancel = .order._curried.volume_price_ImmediateOrCancel
                
                def StopLoss = .order._curried.volume_price_StopLoss
                
                def WithExpiry = .order._curried.volume_price_WithExpiry
                
                def FloatingPrice = .order._curried.volume_price_FloatingPrice
                
                def Iceberg = .order._curried.volume_price_Iceberg
                
                def Peg = .order._curried.volume_price_Peg
            }
            
            def Limit = .order._curried.volume_Limit
            
            def ImmediateOrCancel = .order._curried.volume_ImmediateOrCancel
            
            def Market = .order._curried.volume_Market
            
            def StopLoss = .order._curried.volume_StopLoss
            
            def WithExpiry = .order._curried.volume_WithExpiry
            
            def FloatingPrice = .order._curried.volume_FloatingPrice
            
            def Iceberg = .order._curried.volume_Iceberg
            
            def Peg = .order._curried.volume_Peg
        }
    }
    
    package _curried() {
        @python.order.factory.on_proto("ImmediateOrCancel")
        def side_ImmediateOrCancel(proto = .order._.side.Limit()) : (() => .Side) => .IOrderGenerator
            
        
        @python.order.factory.curried("price_Limit")
        def volume_price_Limit(side = .side.Sell()) : (() => .Float) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("Iceberg")
        def sidevolume_Iceberg(lotSize = .constant(10.0),
                               proto = .order._.side_volume.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("WithExpiry")
        def sidevolume_WithExpiry(expiry = .constant(10.0),
                                  proto = .order._.side_volume.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_StopLoss")
        def side_price_StopLoss(maxloss = .constant(0.1),
                                proto = .order._.side.price.Limit()) : (() => .Side) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("Iceberg")
        def price_Iceberg(lotSize = .constant(10.0),
                          proto = .order._.price.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("FloatingPrice")
        def sideprice_FloatingPrice(floatingPrice = .const(10.0),
                                    proto = .order._.side.price.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("StopLoss")
        def price_StopLoss(maxloss = .constant(0.1),
                           proto = .order._.price.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("ImmediateOrCancel")
        def price_ImmediateOrCancel(proto = .order._.price.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_WithExpiry")
        def volume_price_WithExpiry(expiry = .constant(10.0),
                                    proto = .order._.volume.price.Limit()) : (() => .Float) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("StopLoss")
        def sideprice_StopLoss(maxloss = .constant(0.1),
                               proto = .order._.side_price.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("FloatingPrice")
        def volumeprice_FloatingPrice(floatingPrice = .const(10.0),
                                      proto = .order._.volume.price.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_Peg")
        def volume_price_Peg(proto = .order._.volume.price.Limit()) : (() => .Float) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("Iceberg")
        def side_Iceberg(lotSize = .constant(10.0),
                         proto = .order._.side.Limit()) : (() => .Side) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_WithExpiry")
        def sidevolume_price_WithExpiry(expiry = .constant(10.0),
                                        proto = .order._.side_volume.price.Limit()) : ((() => .Side),(() => .Float)) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("Peg")
        def volume_Peg(proto = .order._.volume.price.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("ImmediateOrCancel")
        def sidevolume_ImmediateOrCancel(proto = .order._.side_volume.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.curried("FixedBudget")
        def side_FixedBudget(budget = .constant(1000.0)) : (() => .Side) => .IOrderGenerator
            
        
        @python.order.factory.curried("Limit")
        def sideprice_Limit(volume = .constant(1.0)) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("Peg")
        def sideprice_Peg(proto = .order._.side.price.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("Peg")
        def sidevolume_Peg(proto = .order._.side_volume.price.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("Peg")
        def side_Peg(proto = .order._.side.price.Limit()) : (() => .Side) => .IOrderGenerator
            
        
        @python.order.factory.curried("LimitSigned")
        def signedVolume_LimitSigned(price = .constant(100.0)) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_Iceberg")
        def side_price_Iceberg(lotSize = .constant(10.0),
                               proto = .order._.side.price.Limit()) : (() => .Side) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("WithExpiry")
        def volumeprice_WithExpiry(expiry = .constant(10.0),
                                   proto = .order._.volume_price.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_ImmediateOrCancel")
        def side_price_ImmediateOrCancel(proto = .order._.side.price.Limit()) : (() => .Side) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("ImmediateOrCancel")
        def volumeprice_ImmediateOrCancel(proto = .order._.volume_price.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("WithExpiry")
        def side_WithExpiry(expiry = .constant(10.0),
                            proto = .order._.side.Limit()) : (() => .Side) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("StopLoss")
        def side_StopLoss(maxloss = .constant(0.1),
                          proto = .order._.side.Limit()) : (() => .Side) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_StopLoss")
        def sidevolume_price_StopLoss(maxloss = .constant(0.1),
                                      proto = .order._.side_volume.price.Limit()) : ((() => .Side),(() => .Float)) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("StopLoss")
        def pricevolume_StopLoss(maxloss = .constant(0.1),
                                 proto = .order._.price_volume.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("ImmediateOrCancel")
        def pricevolume_ImmediateOrCancel(proto = .order._.price_volume.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("Peg")
        def pricevolume_Peg(proto = .order._.volume.price.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("Peg")
        def price_Peg(proto = .order._.price.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("StopLoss")
        def volume_StopLoss(maxloss = .constant(0.1),
                            proto = .order._.volume.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.curried("Limit")
        def volumeprice_Limit(side = .side.Sell()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.curried("price_Limit")
        def sidevolume_price_Limit() : ((() => .Side),(() => .Float)) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("StopLoss")
        def sidevolume_StopLoss(maxloss = .constant(0.1),
                                proto = .order._.side_volume.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("Iceberg")
        def volumeprice_Iceberg(lotSize = .constant(10.0),
                                proto = .order._.volume_price.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("WithExpiry")
        def volume_WithExpiry(expiry = .constant(10.0),
                              proto = .order._.volume.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("WithExpiry")
        def sideprice_WithExpiry(expiry = .constant(10.0),
                                 proto = .order._.side_price.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("ImmediateOrCancel")
        def volume_ImmediateOrCancel(proto = .order._.volume.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("FloatingPrice")
        def volume_FloatingPrice(floatingPrice = .const(10.0),
                                 proto = .order._.volume.price.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.curried("Market")
        def volume_Market(side = .side.Sell()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_StopLoss")
        def volume_price_StopLoss(maxloss = .constant(0.1),
                                  proto = .order._.volume.price.Limit()) : (() => .Float) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("price_ImmediateOrCancel")
        def volume_price_ImmediateOrCancel(proto = .order._.volume.price.Limit()) : (() => .Float) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.curried("Limit")
        def side_Limit(price = .constant(100.0),
                       volume = .constant(1.0)) : (() => .Side) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_FloatingPrice")
        def side_price_FloatingPrice(floatingPrice = .const(10.0),
                                     proto = .order._.side.price.Limit()) : (() => .Side) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("FloatingPrice")
        def side_FloatingPrice(floatingPrice = .const(10.0),
                               proto = .order._.side.price.Limit()) : (() => .Side) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("Iceberg")
        def pricevolume_Iceberg(lotSize = .constant(10.0),
                                proto = .order._.price_volume.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_WithExpiry")
        def side_price_WithExpiry(expiry = .constant(10.0),
                                  proto = .order._.side.price.Limit()) : (() => .Side) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.curried("price_Limit")
        def side_price_Limit(volume = .constant(1.0)) : (() => .Side) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.curried("Limit")
        def pricevolume_Limit(side = .side.Sell()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("Iceberg")
        def volume_Iceberg(lotSize = .constant(10.0),
                           proto = .order._.volume.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_FloatingPrice")
        def volume_price_FloatingPrice(floatingPrice = .const(10.0),
                                       proto = .order._.volume.price.Limit()) : (() => .Float) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.curried("Market")
        def side_Market(volume = .constant(1.0)) : (() => .Side) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("FloatingPrice")
        def price_FloatingPrice(floatingPrice = .const(10.0),
                                proto = .order._.price.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("FloatingPrice")
        def sidevolume_FloatingPrice(floatingPrice = .const(10.0),
                                     proto = .order._.side_volume.price.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("StopLoss")
        def volumeprice_StopLoss(maxloss = .constant(0.1),
                                 proto = .order._.volume_price.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("WithExpiry")
        def price_WithExpiry(expiry = .constant(10.0),
                             proto = .order._.price.Limit()) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_Iceberg")
        def volume_price_Iceberg(lotSize = .constant(10.0),
                                 proto = .order._.volume.price.Limit()) : (() => .Float) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("price_FloatingPrice")
        def sidevolume_price_FloatingPrice(floatingPrice = .const(10.0),
                                           proto = .order._.side_volume.price.Limit()) : ((() => .Side),(() => .Float)) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("Peg")
        def volumeprice_Peg(proto = .order._.volume.price.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_ImmediateOrCancel")
        def sidevolume_price_ImmediateOrCancel(proto = .order._.side_volume.price.Limit()) : ((() => .Side),(() => .Float)) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.curried("Market")
        def sidevolume_Market() : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.curried("Limit")
        def price_Limit(side = .side.Sell(),
                        volume = .constant(1.0)) : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.curried("Limit")
        def sidevolume_Limit(price = .constant(100.0)) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("Iceberg")
        def sideprice_Iceberg(lotSize = .constant(10.0),
                              proto = .order._.side_price.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_Peg")
        def sidevolume_price_Peg(proto = .order._.side_volume.price.Limit()) : ((() => .Side),(() => .Float)) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.curried("MarketSigned")
        def signedVolume_MarketSigned() : (() => .Float) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("FloatingPrice")
        def pricevolume_FloatingPrice(floatingPrice = .const(10.0),
                                      proto = .order._.volume.price.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("ImmediateOrCancel")
        def sideprice_ImmediateOrCancel(proto = .order._.side_price.Limit()) : ((() => .Side),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("WithExpiry")
        def pricevolume_WithExpiry(expiry = .constant(10.0),
                                   proto = .order._.price_volume.Limit()) : ((() => .Float),(() => .Float)) => .IOrderGenerator
            
        
        @python.order.factory.on_proto("price_Peg")
        def side_price_Peg(proto = .order._.side.price.Limit()) : (() => .Side) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.on_proto("price_Iceberg")
        def sidevolume_price_Iceberg(lotSize = .constant(10.0),
                                     proto = .order._.side_volume.price.Limit()) : ((() => .Side),(() => .Float)) => ((() => .Float) => .IOrderGenerator)
            
        
        @python.order.factory.curried("Limit")
        def volume_Limit(side = .side.Sell(),
                         price = .constant(100.0)) : (() => .Float) => .IOrderGenerator
            
    }
    
    @python.order.factory("order.limit.Order_Impl")
    def Limit(side = .side.Sell(),
              price = .constant(100.0),
              volume = .constant(1.0)) : .IOrderGenerator
        
    
    @python.order.factory("order.market.Order_Impl")
    def MarketSigned(/**signed volume*/ signedVolume : () => .Float = .constant(1.0)) : .IOrderGenerator
        
    
    @python.order.factory("order.meta.ioc.Order_Impl")
    def ImmediateOrCancel(proto = .order.Limit()) : .IOrderGenerator
        
    
    @python.order.factory("order.market.Order_Impl")
    def Market(side = .side.Sell(),
               volume = .constant(1.0)) : .IOrderGenerator
        
    
    @python.order.factory("order.meta.stoploss.Order_Impl")
    def StopLoss(maxloss = .constant(0.1),
                 proto = .order.Limit()) : .IOrderGenerator
        
    
    @python.order.factory("order.meta.with_expiry.Order_Impl")
    def WithExpiry(expiry = .constant(10.0),
                   proto = .order.Limit()) : .IOrderGenerator
        
    
    @python.order.factory("order.meta.floating_price.Factory_Impl")
    def FloatingPrice(floatingPrice = .const(10.0),
                      proto = .order._.price.Limit()) : .IOrderGenerator
        
    
    @python.order.factory("order.meta.iceberg.Order_Impl")
    def Iceberg(lotSize = .constant(10.0),
                proto = .order.Limit()) : .IOrderGenerator
        
    
    @python.order.factory("order.meta.fixed_budget.Order_Impl")
    def FixedBudget(side = .side.Sell(),
                    budget = .constant(1000.0)) : .IOrderGenerator
        
    
    @python.order.factory("order.limit.Order_Impl")
    def LimitSigned(/**signed volume*/ signedVolume : () => .Float = .constant(1.0),
                    price = .constant(100.0)) : .IOrderGenerator
        
    
    @python.order.factory("order.meta.peg.Factory_Impl")
    def Peg(proto = .order._.price.Limit()) : .IOrderGenerator
        
}
@category = "Strategy"

package strategy() {
    package account() {
        package _() {
            package inner() {
                @python.curried("Real")
                def inner_Real() : .Optional[.ISingleAssetStrategy] => .IAccount
                    
                
                @python.curried("VirtualMarket")
                def inner_VirtualMarket() : .Optional[.ISingleAssetStrategy] => .IAccount
                    
            }
        }
        
        @python.intrinsic("strategy.account._Account_Impl")
        @curried("inner")
        def Real(inner : .Optional[.ISingleAssetStrategy] = .strategy.Noise()) : .IAccount
            
        
        @python.intrinsic("strategy.account._VirtualMarket_Impl")
        @curried("inner")
        def VirtualMarket(inner : .Optional[.ISingleAssetStrategy] = .strategy.Noise()) : .IAccount
            
        
        def real = .strategy.account._.inner.inner_Real
        
        def virtualMarket = .strategy.account._.inner.inner_VirtualMarket
    }
    
    package weight() {
        package _() {
            package array() {
                @python.curried("ChooseTheBest")
                def array_ChooseTheBest() : .Optional[.List[.Float]] => .List[.Float]
                    
                
                @python.curried("IdentityL")
                def array_IdentityL() : .Optional[.List[.Float]] => .List[.Float]
                    
            }
            
            package trader() {
                @python.curried("Efficiency")
                def trader_Efficiency() : .IAccount => .IFunction[.Float]
                    
                
                @python.curried("Score")
                def trader_Score() : .IAccount => .IFunction[.Float]
                    
                
                @python.curried("EfficiencyTrend")
                def trader_EfficiencyTrend(alpha = 0.15) : .IAccount => .IFunction[.Float]
                    
                
                @python.curried("Unit")
                def trader_Unit() : .IAccount => .IFunction[.Float]
                    
            }
            
            package f() {
                @python.curried("Clamp0")
                def f_Clamp0() : .Optional[.IFunction[.Float]] => .IFunction[.Float]
                    
                
                @python.curried("AtanPow")
                def f_AtanPow(base = 1.002) : .Optional[.IFunction[.Float]] => .IFunction[.Float]
                    
                
                @python.curried("IdentityF")
                def f_IdentityF() : .Optional[.IFunction[.Float]] => .IFunction[.Float]
                    
            }
        }
        
        def efficiency = .strategy.weight._.trader.trader_Efficiency
        
        @python.intrinsic("strategy.weight._ChooseTheBest_Impl")
        @curried("array")
        def ChooseTheBest(array : .Optional[.List[.Float]] = []) : .List[.Float]
            
        
        def score = .strategy.weight._.trader.trader_Score
        
        def atanpow = .strategy.weight._.f.f_AtanPow
        
        @curried("trader")
        def Efficiency(trader : .IAccount = .trader.SingleProxy()) : .IFunction[.Float]
             = .observable.trader.Efficiency(trader)
        
        def efficiencyTrend = .strategy.weight._.trader.trader_EfficiencyTrend
        
        def clamp0 = .strategy.weight._.f.f_Clamp0
        
        @python.intrinsic("strategy.weight._Score_Impl")
        @curried("trader")
        def Score(trader : .IAccount = .observable.trader.SingleProxy()) : .IFunction[.Float]
            
        
        @curried("f")
        def Clamp0(f : .Optional[.IFunction[.Float]] = .constant()) : .IFunction[.Float]
             = .observable.Max(.constant(0),f)+1
        
        @curried("trader")
        def EfficiencyTrend(trader : .IAccount = .trader.SingleProxy(),
                            alpha = 0.15) : .IFunction[.Float]
             = .Derivative(.observable.EW.Avg(.observable.trader.Efficiency(trader),alpha))
        
        def unit = .strategy.weight._.trader.trader_Unit
        
        @curried("trader")
        def Unit(trader : .IAccount = .observable.trader.SingleProxy()) : .IFunction[.Float]
             = .constant(1.0)
        
        @curried("f")
        def AtanPow(f : .Optional[.IFunction[.Float]] = .constant(),
                    base = 1.002) : .IFunction[.Float]
             = .mathops.Atan(.mathops.Pow(.constant(base),f))
        
        @python.intrinsic("strategy.weight._Identity_Impl")
        @curried("array")
        def IdentityL(array : .Optional[.List[.Float]] = []) : .List[.Float]
            
        
        def identity_f = .strategy.weight._.f.f_IdentityF
        
        @curried("f")
        def IdentityF(f : .Optional[.IFunction[.Float]] = .constant()) : .IFunction[.Float]
             = f
    }
    
    @python.intrinsic("strategy.combine._Combine_Impl")
    def Combine(A = .strategy.Noise(),
                B = .strategy.Noise()) : .ISingleAssetStrategy
        
    
    def RSI_linear(orderFactory = .order._.signedVolume.MarketSigned(),
                   alpha = 1.0/14,
                   k = .const(-0.04),
                   timeframe = 1.0)
         = .strategy.Generic(orderFactory(.observable.volumefunc.RSI_linear(alpha,k,timeframe)))
    
    /** Dependent price strategy believes that the fair price of an asset *A*
     * is completely correlated with price of another asset *B* and the following relation
     * should be held: *PriceA* = *kPriceB*, where *k* is some factor.
     * It may be considered as a variety of a fundamental value strategy
     * with the exception that it is invoked every the time price of another
     * asset *B* changes.
     */
    def PairTrading(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
                    /** order factory function*/ orderFactory = .order._.side.Market(),
                    /** reference to order book for another asset used to evaluate fair price of our asset */ bookToDependOn = .observable.orderbook.OfTrader(),
                    /** multiplier to obtain fair asset price from the reference asset price */ factor = 1.0)
         = .strategy.Generic(orderFactory(.observable.sidefunc.PairTrading(bookToDependOn,factor)),eventGen)
    
    /** A composite strategy initialized with an array of strategies.
     * In some moments of time the most effective strategy
     * is chosen and made running; other strategies are suspended.
     */
    @python.intrinsic("strategy.choose_the_best._ChooseTheBest_Impl")
    def ChooseTheBest(/** original strategies that can be suspended */ strategies = [.strategy.Noise()],
                      /** function creating phantom strategy used for efficiency estimation */ account = .strategy.account._.inner.inner_VirtualMarket(),
                      /** function estimating is the strategy efficient or not */ performance = .strategy.weight._.trader.trader_EfficiencyTrend()) : .ISingleAssetStrategy
        
    
    /** Signal strategy listens to some discrete signal
     * and when the signal becomes more than some threshold the strategy starts to buy.
     * When the signal gets lower than -threshold the strategy starts to sell.
     */
    def Signal(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
               /** order factory function*/ orderFactory = .order._.side.Market(),
               /** signal to be listened to */ signal = .constant(0.0),
               /** threshold when the trader starts to act */ threshold = 0.7)
         = .strategy.Generic(orderFactory(.observable.sidefunc.Signal(signal,threshold)),eventGen)
    
    /** Liquidity provider for two sides
     */
    def LiquidityProvider(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
                          /** order factory function*/ orderFactory = .order._.side_price.Limit(),
                          /** initial price which is taken if orderBook is empty */ initialValue = 100.0,
                          /** defines multipliers for current asset price when price of
                            *                    order to create is calculated*/ priceDistr = .mathutils.rnd.lognormvariate(0.0,0.1))
         = .strategy.Array([.strategy.LiquidityProviderSide(eventGen,orderFactory,.side.Sell(),initialValue,priceDistr),.strategy.LiquidityProviderSide(eventGen,orderFactory,.side.Buy(),initialValue,priceDistr)])
    
    /** Two averages strategy compares two averages of price of the same asset but
     * with different parameters ('slow' and 'fast' averages) and when
     * the first is greater than the second one it buys,
     * when the first is lower than the second one it sells
     */
    def CrossingAverages(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
                         /** order factory function*/ orderFactory = .order._.side.Market(),
                         /** parameter |alpha| for exponentially weighted moving average 1 */ ewma_alpha_1 = 0.15,
                         /** parameter |alpha| for exponentially weighted moving average 2 */ ewma_alpha_2 = 0.015,
                         /** threshold when the trader starts to act */ threshold = 0.0)
         = .strategy.Generic(orderFactory(.observable.sidefunc.CrossingAverages(ewma_alpha_1,ewma_alpha_2,threshold)),eventGen)
    
    @python.intrinsic("strategy.suspendable._Suspendable_Impl")
    def Suspendable(inner = .strategy.Noise(),
                    predicate = .true() : .IFunction[.Boolean]) : .ISingleAssetStrategy
        
    
    /** Trend follower can be considered as a sort of a signal strategy
     * where the *signal* is a trend of the asset.
     * Under trend we understand the first derivative of some moving average of asset prices.
     * If the derivative is positive, the trader buys; if negative - it sells.
     * Since moving average is a continuously changing signal, we check its
     * derivative at moments of time given by *eventGen*.
     */
    def TrendFollower(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
                      /** order factory function*/ orderFactory = .order._.side.Market(),
                      /** parameter |alpha| for exponentially weighted moving average */ ewma_alpha = 0.15,
                      /** threshold when the trader starts to act */ threshold = 0.0)
         = .strategy.Generic(orderFactory(.observable.sidefunc.TrendFollower(ewma_alpha,threshold)),eventGen)
    
    /** Fundamental value strategy believes that an asset should have some specific price
     * (*fundamental value*) and if the current asset price is lower than the fundamental value
     * it starts to buy the asset and if the price is higher it starts to sell the asset.
     */
    def FundamentalValue(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
                         /** order factory function*/ orderFactory = .order._.side.Market(),
                         /** defines fundamental value */ fundamentalValue = .constant(100.0))
         = .strategy.Generic(orderFactory(.observable.sidefunc.FundamentalValue(fundamentalValue)),eventGen)
    
    @python.intrinsic("strategy.arbitrage._Arbitrage_Impl")
    def Arbitrage() : .IMultiAssetStrategy
        
    
    def RSIbis(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
               /** order factory function*/ orderFactory = .order._.side.Market(),
               /** parameter |alpha| for exponentially weighted moving average */ alpha = 1.0/14,
               timeframe = 1.0,
               threshold = 30.0)
         = .strategy.Generic(orderFactory(.observable.sidefunc.Signal(50.0-.observable.RSI(.observable.orderbook.OfTrader(),timeframe,alpha),50.0-threshold)),eventGen)
    
    def TradeIfProfitable(inner = .strategy.Noise(),
                          account = .strategy.account._.inner.inner_VirtualMarket(),
                          performance = .strategy.weight._.trader.trader_EfficiencyTrend())
         = .strategy.Suspendable(inner,performance(account(inner))>=0)
    
    @python.intrinsic("strategy.combine._Array_Impl")
    def Array(strategies = [] : .List[.ISingleAssetStrategy]) : .ISingleAssetStrategy
        
    
    /** Mean reversion strategy believes that asset price should return to its average value.
     * It estimates this average using some functional and
     * if the current asset price is lower than the average
     * it buys the asset and if the price is higher it sells the asset.
     */
    def MeanReversion(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
                      /** order factory function*/ orderFactory = .order._.side.Market(),
                      /** parameter |alpha| for exponentially weighted moving average */ ewma_alpha = 0.15)
         = .strategy.Generic(orderFactory(.observable.sidefunc.MeanReversion(ewma_alpha)),eventGen)
    
    /** A composite strategy initialized with an array of strategies.
     * In some moments of time the most effective strategy
     * is chosen and made running; other strategies are suspended.
     * The choice is made randomly among the strategies that have
     * a positive efficiency trend, weighted by the efficiency value.
     */
    @python.intrinsic("strategy.multiarmed_bandit._MultiarmedBandit2_Impl")
    def MultiArmedBandit(/** original strategies that can be suspended */ strategies = [.strategy.Noise()],
                         /** function creating phantom strategy used for efficiency estimation */ account = .strategy.account._.inner.inner_VirtualMarket(),
                         /** function estimating is the strategy efficient or not */ weight = .strategy.weight._.trader.trader_EfficiencyTrend(),
                         normalizer = .strategy.weight._.f.f_AtanPow(),
                         /** weighting scheme for choosing strategies */ corrector = .strategy.weight._.array.array_IdentityL()) : .ISingleAssetStrategy
        
    
    /** A Strategy that allows to drive the asset price based on historical market data
     *  by creating large volume orders for the given price.
     *
     *  Every time step of 1 in the simulation corresponds to a 1 day in the market data.
     *
     *  At each time step the previous Limit Buy/Sell orders are cancelled and new ones
     *  are created based on the next price of the market data.
     */
    def MarketData(/** Ticker of the asset */ ticker = "^GSPC",
                   /** Start date in DD-MM-YYYY format */ start = "2001-1-1",
                   /** End date in DD-MM-YYYY format */ end = "2010-1-1",
                   /** Price difference between orders placed and underlying quotes */ delta = 1.0,
                   /** Volume of Buy/Sell orders. Should be large compared to the volumes of other traders. */ volume = 1000.0)
         = .strategy.Combine(.strategy.Generic(.order.Iceberg(.constant(volume),.order.FloatingPrice(.observable.BreaksAtChanges(.observable.Quote(ticker,start,end)+delta),.order._.price.Limit(.side.Sell(),.constant(volume*1000)))),.event.After(.constant(0.0))),.strategy.Generic(.order.Iceberg(.constant(volume),.order.FloatingPrice(.observable.BreaksAtChanges(.observable.Quote(ticker,start,end)-delta),.order._.price.Limit(.side.Buy(),.constant(volume*1000)))),.event.After(.constant(0.0))))
    
    @python.intrinsic("strategy.canceller._Canceller_Impl")
    def Canceller(cancellationIntervalDistr = .mathutils.rnd.expovariate(1.0)) : .ISingleAssetStrategy
        
    
    /** Liquidity provider for one side
     */
    def LiquidityProviderSide(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
                              /** order factory function*/ orderFactory = .order._.side_price.Limit(),
                              /** side of orders to create */ side = .side.Sell(),
                              /** initial price which is taken if orderBook is empty */ initialValue = 100.0,
                              /** defines multipliers for current asset price when price of
                                *                    order to create is calculated*/ priceDistr = .mathutils.rnd.lognormvariate(0.0,0.1))
         = .strategy.Generic(orderFactory(side,.observable.pricefunc.LiquidityProvider(side,initialValue,priceDistr)),eventGen)
    
    /** Generic strategy that wakes up on events given by *eventGen*,
     *  creates an order via *orderFactory* and sends the order to the market using its trader
     */
    @python.intrinsic("strategy.generic._Generic_Impl")
    def Generic(/** order factory function*/ orderFactory = .order.Limit(),
                /** Event source making the strategy to wake up*/ eventGen = .observable.OnEveryDt() : .IEvent) : .ISingleAssetStrategy
        
    
    def MarketMaker(delta = 1.0,
                    volume = 20.0)
         = .strategy.Combine(.strategy.Generic(.order.Iceberg(.constant(volume),.order.FloatingPrice(.observable.BreaksAtChanges(.observable.OnEveryDt(0.9,.observable.orderbook.SafeSidePrice(.observable.orderbook.Asks(),.constant(100+delta))/.mathops.Exp(.mathops.Atan(.observable.trader.Position())/1000))),.order._.price.Limit(.side.Sell(),.constant(volume*1000)))),.event.After(.constant(0.0))),.strategy.Generic(.order.Iceberg(.constant(volume),.order.FloatingPrice(.observable.BreaksAtChanges(.observable.OnEveryDt(0.9,.observable.orderbook.SafeSidePrice(.observable.orderbook.Bids(),.constant(100-delta))/.mathops.Exp(.mathops.Atan(.observable.trader.Position())/1000))),.order._.price.Limit(.side.Buy(),.constant(volume*1000)))),.event.After(.constant(0.0))))
    
    /** Noise strategy is a quite dummy strategy that randomly creates an order and sends it to the order book.
     */
    def Noise(/** Event source making the strategy to wake up*/ eventGen = .event.Every(.mathutils.rnd.expovariate(1.0)),
              /** order factory function*/ orderFactory = .order._.side.Market())
         = .strategy.Generic(orderFactory(.observable.sidefunc.Noise()),eventGen)
    
    def Bollinger_linear(orderFactory = .order._.signedVolume.MarketSigned(),
                         alpha = 0.15,
                         k = .const(0.5))
         = .strategy.Generic(orderFactory(.observable.volumefunc.Bollinger_linear(alpha,k)))
}
@category = "Trader"

package trader() {
    /** A trader that trades a single asset on a single market
     */
    @python.intrinsic("trader.classes._SingleAsset_Impl")
    @label = "%(name)s"
    def SingleAsset(/** order book for the asset being traded */ orderBook : .IOrderBook,
                    /** strategy run by the trader */ strategy = .strategy.Noise(),
                    name = "-trader-",
                    /** current position of the trader (number of assets that it owns) */ amount = 0.0,
                    /** current trader balance (number of money units that it owns) */ PnL = 0.0,
                    timeseries = [] : .List[.ITimeSerie]) : .ISingleAssetTrader
        
    
    @python.intrinsic("trader.classes._MultiAsset_Impl")
    @label = "%(name)s"
    def MultiAsset(traders = [] : .List[.ISingleAssetTrader],
                   /** strategy run by the trader */ strategy = .strategy.Arbitrage(),
                   name = "-trader-",
                   /** current trader balance (number of money units that it owns) */ PnL = 0.0,
                   timeseries = [] : .List[.ITimeSerie]) : .ITrader
        
    
    @python.intrinsic("trader.proxy._Single_Impl")
    @label = "N/A"
    def SingleProxy() : .ISingleAssetTrader
        
}
@category = "Asset"

package orderbook() {
    /** Order book for a single asset in a market.
     * Maintains two order queues for orders of different sides
     */
    @python.intrinsic("orderbook.local._Local_Impl")
    @label = "%(name)s"
    def Local(tickSize = 0.01,
              _digitsToShow = 2,
              name = "-orderbook-",
              timeseries = [] : .List[.ITimeSerie]) : .IOrderBook
        
    
    /** Represent an *orderbook* from point of view of a remote trader connected
     * to the market by means of a *link* that introduces some latency in information propagation
     */
    @python.intrinsic("orderbook.remote._Remote_Impl")
    @label = "%(orderbook)s.name^remote"
    def Remote(orderbook = .orderbook.Local(),
               link = .orderbook.TwoWayLink(),
               timeseries = [] : .List[.ITimeSerie]) : .IOrderBook
        
    
    /** Represents latency in information propagation from one agent to another one
     * (normally between a trader and a market).
     * Ensures that sending packets via a link preserves their order.
     */
    @python.intrinsic("orderbook.link._Link_Impl")
    def Link(/** function called for each packet in order to determine
               * when it will appear at the end point*/ latency = .const(0.001)) : .ILink
        
    
    /** Represents latency in information propagation between two agents
     * (normally between a trader and a market).
     * Ensures that sending packets via links preserves their order.
     * Holds two one-way links in opposite directions.
     */
    @python.intrinsic("orderbook.link._TwoWayLink_Impl")
    def TwoWayLink(/** Forward link (normally from a trader to a market)*/ up = .orderbook.Link(),
                   /** Backward link (normally from a market to a trader)*/ down = .orderbook.Link()) : .ITwoWayLink
        
}
@category = "Basic"

package observable() {@category = "Price function"
    
    package pricefunc() {
        def LiquidityProvider(side = .side.Sell(),
                              initialValue = 100.0,
                              priceDistr = .mathutils.rnd.lognormvariate(0.0,0.1),
                              book = .observable.orderbook.OfTrader())
             = .observable.orderbook.SafeSidePrice(.observable.orderbook.Queue(book,side),.constant(initialValue))*priceDistr
    }
    @category = "Side function"
    
    package sidefunc() {
        def PairTrading(dependee = .observable.orderbook.OfTrader(),
                        factor = 1.0,
                        book = .observable.orderbook.OfTrader())
             = .observable.ObservableSide(.observable.sidefunc.FundamentalValue(.observable.orderbook.MidPrice(dependee)*factor,book))
        
        @python.observable()
        def Signal(signal = .constant(),
                   threshold = 0.7)
             = if signal>threshold then .side.Buy() else if signal<0-threshold then .side.Sell() else .side.Nothing()
        
        def CrossingAverages(alpha_1 = 0.015,
                             alpha_2 = 0.15,
                             threshold = 0.0,
                             book = .observable.orderbook.OfTrader())
             = .observable.sidefunc.Signal(.observable.EW.Avg(.observable.orderbook.MidPrice(book),alpha_1)-.observable.EW.Avg(.observable.orderbook.MidPrice(book),alpha_2),threshold)
        
        def TrendFollower(alpha = 0.015,
                          threshold = 0.0,
                          book = .observable.orderbook.OfTrader())
             = .observable.sidefunc.Signal(.Derivative(.observable.EW.Avg(.observable.orderbook.MidPrice(book),alpha)),threshold)
        
        @python.observable()
        def FundamentalValue(fv = .constant(200.0),
                             book = .observable.orderbook.OfTrader())
             = if .observable.orderbook.bid.Price(book)>fv then .side.Sell() else if .observable.orderbook.ask.Price(book)<fv then .side.Buy() else .side.Nothing()
        
        def MeanReversion(alpha = 0.015,
                          book = .observable.orderbook.OfTrader())
             = .observable.sidefunc.FundamentalValue(.observable.EW.Avg(.observable.orderbook.MidPrice(book),alpha),book)
        
        def Noise(side_distribution = .mathutils.rnd.uniform(0.0,1.0) : .IFunction[.Float])
             = if side_distribution>0.5 then .side.Sell() else .side.Buy()
    }
    @category = "Statistics"
    @suffix = "_{cumul}(%(source)s)"
    
    package Cumulative() {
        @label = "RSD{{suffix}}"
        def RelStdDev(source = .const())
             = (source-.observable.Cumulative.Avg(source))/.observable.Cumulative.StdDev(source)
        
        @python.intrinsic("moments.cmv.Variance_Impl")
        @label = "\\sigma^2{{suffix}}"
        def Var(source = .const()) : () => .Float
            
        
        @python.intrinsic("moments.cma.CMA_Impl")
        @label = "Avg{{suffix}}"
        def Avg(source = .const()) : () => .Float
            
        
        @python.intrinsic("observable.minmax_eps.MinEpsilon_Impl")
        @label = "Min_{\\epsilon}(%(source)s)"
        def MinEpsilon(source = .constant(),
                       epsilon = .constant(0.01)) : .IObservable[.Float]
            
        
        @python.intrinsic("observable.minmax_eps.MaxEpsilon_Impl")
        @label = "Max_{\\epsilon}(%(source)s)"
        def MaxEpsilon(source = .constant(),
                       epsilon = .constant(0.01)) : .IObservable[.Float]
            
        
        @label = "\\sqrt{\\sigma^2{{suffix}}}"
        def StdDev(source = .const())
             = .mathops.Sqrt(.observable.Cumulative.Var(source))
    }
    @category = "RSI"
    
    package rsi() {
        @label = "RSIRaw_{%(timeframe)s}^{%(alpha)s}(%(source)s)"
        def Raw(source = .const(),
                timeframe = 10.0,
                alpha = 0.015)
             = .observable.EW.Avg(.observable.UpMovements(source,timeframe),alpha)/.observable.EW.Avg(.observable.DownMovements(source,timeframe),alpha)
    }
    @category = "MACD"
    
    package macd() {
        @label = "MACD_{%(fast)s}^{%(slow)s}(%(x)s)"
        def MACD(x = .const(),
                 slow = 26.0,
                 fast = 12.0)
             = .observable.EW.Avg(x,2.0/(fast+1))-.observable.EW.Avg(x,2.0/(slow+1))
        
        @label = "Signal^{%(timeframe)s}_{%(step)s}(MACD_{%(fast)s}^{%(slow)s}(%(x)s))"
        def Signal(x = .const(),
                   slow = 26.0,
                   fast = 12.0,
                   timeframe = 9.0,
                   step = 1.0)
             = .observable.EW.Avg(.observable.OnEveryDt(step,.observable.macd.MACD(x,slow,fast)),2/(timeframe+1))
        
        @label = "Histogram^{%(timeframe)s}_{%(step)s}(MACD_{%(fast)s}^{%(slow)s}(%(x)s))"
        def Histogram(x = .const(),
                      slow = 26.0,
                      fast = 12.0,
                      timeframe = 9.0,
                      step = 1.0)
             = .observable.macd.MACD(x,slow,fast)-.observable.macd.Signal(x,slow,fast,timeframe,step)
    }
    @category = "Trader's"
    
    package trader() {
        @python.intrinsic("trader.props.Balance_Impl")
        def Balance(trader = .observable.trader.SingleProxy() : .IAccount) : .IObservable[.Price]
            
        
        def RoughPnL(trader = .observable.trader.SingleProxy() : .IAccount)
             = .observable.Observable(.observable.trader.Balance(trader)+.observable.orderbook.NaiveCumulativePrice(.observable.orderbook.OfTrader(trader),.observable.trader.Position(trader)))
        
        @python.intrinsic("trader.props.Position_Impl")
        def Position(trader = .observable.trader.SingleProxy() : .IAccount) : .IObservable[.Volume]
            
        
        def Efficiency(trader = .observable.trader.SingleProxy() : .IAccount)
             = .observable.Observable(.observable.trader.Balance(trader)+.observable.orderbook.CumulativePrice(.observable.orderbook.OfTrader(trader),.observable.trader.Position(trader)))
        
        def SingleProxy = .trader.SingleProxy
        
        def EfficiencyTrend(trader = .observable.trader.SingleProxy() : .IAccount,
                            alpha = 0.15)
             = .Derivative(.observable.EW.Avg(.observable.trader.Efficiency(trader),alpha))
        
        @python.intrinsic("trader.props.PendingVolume_Impl")
        def PendingVolume(trader = .observable.trader.SingleProxy() : .IAccount) : .IObservable[.Volume]
            
    }
    @category = "Volume function"
    
    package volumefunc() {
        def DesiredPosition(desiredPosition = .const(),
                            trader = .observable.trader.SingleProxy())
             = .observable.ObservableVolume(desiredPosition-.observable.trader.Position(trader)-.observable.trader.PendingVolume(trader))
        
        def Bollinger_linear(alpha = 0.15,
                             k = .const(0.5),
                             trader = .observable.trader.SingleProxy())
             = .observable.volumefunc.DesiredPosition(.observable.OnEveryDt(1.0,.observable.EW.RelStdDev(.observable.orderbook.MidPrice(.observable.orderbook.OfTrader(trader)),alpha))*k,trader)
        
        def RSI_linear(alpha = 1.0/14.0,
                       k = .const(-0.04),
                       timeframe = 1.0,
                       trader = .observable.trader.SingleProxy())
             = .observable.volumefunc.DesiredPosition(.observable.OnEveryDt(1.0,50.0-.observable.RSI(.observable.orderbook.OfTrader(trader),timeframe,alpha))*k,trader)
    }
    @category = "Statistics"
    @suffix = "_{\\\\alpha=%(alpha)s}(%(source)s)"
    
    package EW(source = const(),alpha = 0.015) {
        @python.intrinsic("moments.ewma.EWMA_Impl")
        @label = "Avg{{suffix}}"
        def Avg(source = const(),
                alpha = 0.015) : .IDifferentiable
            
        
        @python.intrinsic("moments.ewmv.EWMV_Impl")
        @label = "\\sigma^2{{suffix}}"
        def Var(source = const(),
                alpha = 0.015) : () => .Float
            
        
        @label = "\\sqrt{\\sigma^2{{suffix}}}"
        def StdDev(source = const(),
                   alpha = 0.015)
             = .mathops.Sqrt(.observable.EW.Var(source,alpha))
        
        @label = "RSD{{suffix}}"
        def RelStdDev(source = const(),
                      alpha = 0.015)
             = (source-.observable.EW.Avg(source,alpha))/.observable.EW.StdDev(source,alpha)
    }
    @category = "Asset's"
    
    package orderbook() {@queue = "Ask_{%(book)s}"
        
        package ask() {
            @label = "[{{queue}}]_{%(alpha)s}"
            def WeightedPrice(book = .observable.orderbook.OfTrader(),
                              alpha = 0.015)
                 = .observable.orderbook.WeightedPrice(.observable.orderbook.ask._queue(book),alpha)
            
            @label = "LastTradeVolume({{queue}})"
            def LastTradeVolume(book = .observable.orderbook.OfTrader())
                 = .observable.orderbook.LastTradeVolume(.observable.orderbook.ask._queue(book))
            
            @label = "{{queue}}"
            def Price(book = .observable.orderbook.OfTrader())
                 = .observable.orderbook.BestPrice(.observable.orderbook.ask._queue(book))
            
            @label = "Last({{queue}})"
            def LastPrice(book = .observable.orderbook.OfTrader())
                 = .observable.orderbook.LastPrice(.observable.orderbook.ask._queue(book))
            
            def _queue = .observable.orderbook.Asks
            
            @label = "LastTrade({{queue}})"
            def LastTradePrice(book = .observable.orderbook.OfTrader())
                 = .observable.orderbook.LastTradePrice(.observable.orderbook.ask._queue(book))
        }
        @queue = "Bid^{%(book)s}"
        
        package bid() {
            @label = "[{{queue}}]_{%(alpha)s}"
            def WeightedPrice(book = .observable.orderbook.OfTrader(),
                              alpha = 0.015)
                 = .observable.orderbook.WeightedPrice(.observable.orderbook.bid._queue(book),alpha)
            
            @label = "LastTradeVolume({{queue}})"
            def LastTradeVolume(book = .observable.orderbook.OfTrader())
                 = .observable.orderbook.LastTradeVolume(.observable.orderbook.bid._queue(book))
            
            @label = "{{queue}}"
            def Price(book = .observable.orderbook.OfTrader())
                 = .observable.orderbook.BestPrice(.observable.orderbook.bid._queue(book))
            
            @label = "Last({{queue}})"
            def LastPrice(book = .observable.orderbook.OfTrader())
                 = .observable.orderbook.LastPrice(.observable.orderbook.bid._queue(book))
            
            def _queue = .observable.orderbook.Bids
            
            @label = "LastTrade({{queue}})"
            def LastTradePrice(book = .observable.orderbook.OfTrader())
                 = .observable.orderbook.LastTradePrice(.observable.orderbook.bid._queue(book))
        }
        
        @python.observable()
        def SafeSidePrice(queue = .observable.orderbook.Asks(),
                          defaultValue = .constant(100.0))
             = .observable.ObservablePrice(.IfDefined(.observable.orderbook.BestPrice(queue),.IfDefined(.observable.orderbook.LastPrice(queue),defaultValue)))
        
        @label = "Price_{%(alpha)s}^{%(queue)s}"
        def WeightedPrice(queue = .observable.orderbook.Asks(),
                          alpha = 0.015)
             = .observable.EW.Avg(.observable.orderbook.LastTradePrice(queue)*.observable.orderbook.LastTradeVolume(queue),alpha)/.observable.EW.Avg(.observable.orderbook.LastTradeVolume(queue),alpha)
        
        @python.intrinsic("orderbook.props._TickSize_Impl")
        def TickSize(book = .observable.orderbook.OfTrader()) : () => .Price
            
        
        def MidPrice(book = .observable.orderbook.OfTrader())
             = .observable.ObservablePrice((.observable.orderbook.ask.Price(book)+.observable.orderbook.bid.Price(book))/2.0)
        
        @python.intrinsic("orderbook.proxy._Asks_Impl")
        def Asks(book = .observable.orderbook.OfTrader())
             = .observable.orderbook.Queue(book,.side.Sell())
        
        @python.intrinsic("orderbook.last_trade._LastTradeVolume_Impl")
        def LastTradeVolume(queue = .observable.orderbook.Asks()) : .IObservable[.Volume]
            
        
        @python.intrinsic("orderbook.proxy._Bids_Impl")
        def Bids(book = .observable.orderbook.OfTrader())
             = .observable.orderbook.Queue(book,.side.Buy())
        
        @python.intrinsic("orderbook.props._BestPrice_Impl")
        def BestPrice(queue = .observable.orderbook.Asks()) : .IObservable[.Price]
            
        
        @python.intrinsic("orderbook.proxy._Queue_Impl")
        def Queue(book = .observable.orderbook.OfTrader(),
                  side = .side.Sell()) : .IOrderQueue
            
        
        @python.intrinsic("orderbook.of_trader._OfTrader_Impl")
        @label = "N/A"
        def OfTrader(Trader = .observable.trader.SingleProxy() : .IAccount) : .IOrderBook
            
        
        @python.intrinsic("orderbook.cumulative_price.CumulativePrice_Impl")
        def CumulativePrice(book = .observable.orderbook.OfTrader(),
                            depth = .constant()) : .IObservable[.Price]
            
        
        @python.intrinsic("orderbook.volume_levels.VolumeLevels_Impl")
        @label = "VolumeLevels(%(queue)s)"
        def VolumeLevels(queue = .observable.orderbook.Asks(),
                         volumeDelta = 30.0,
                         volumeCount = 10) : .IFunction[.IVolumeLevels]
            
        
        @python.intrinsic("orderbook.last_price._LastPrice_Impl")
        def LastPrice(queue = .observable.orderbook.Asks()) : .IObservable[.Price]
            
        
        def NaiveCumulativePrice(book = .observable.orderbook.OfTrader(),
                                 depth = .constant())
             = .observable.ObservablePrice(if depth<0.0 then depth*.observable.orderbook.ask.Price(book) else if depth>0.0 then depth*.observable.orderbook.bid.Price(book) else 0.0)
        
        def Spread(book = .observable.orderbook.OfTrader())
             = .observable.ObservablePrice(.observable.orderbook.ask.Price(book)-.observable.orderbook.bid.Price(book))
        
        @python.intrinsic("orderbook.last_trade._LastTradePrice_Impl")
        def LastTradePrice(queue = .observable.orderbook.Asks()) : .IObservable[.Price]
            
    }
    @category = "Statistics"
    @suffix = "_{n=%(timeframe)s}(%(source)s)"
    
    package Moving() {
        @python.intrinsic("observable.minmax.Min_Impl")
        @label = "Min_{n=%(timeframe)s}(%(source)s)"
        def Min(source = .constant(),
                timeframe = 100.0) : .IObservable[.Float]
            
        
        @label = "RSD{{suffix}}"
        def RelStdDev(source = .const(),
                      timeframe = 100.0)
             = (source-.observable.Moving.Avg(source,timeframe))/.observable.Moving.StdDev(source,timeframe)
        
        @python.intrinsic("moments.mv.MV_Impl")
        @label = "\\sigma^2{{suffix}}"
        def Var(source = .const(),
                timeframe = 100.0)
             = .observable.Max(.const(0),.observable.Moving.Avg(source*source,timeframe)-.observable.Sqr(.observable.Moving.Avg(source,timeframe)))
        
        @python.intrinsic("observable.minmax.Max_Impl")
        @label = "Max_{n=%(timeframe)s}(%(source)s)"
        def Max(source = .constant(),
                timeframe = 100.0) : .IObservable[.Float]
            
        
        @python.intrinsic("moments.ma.MA_Impl")
        @label = "Avg{{suffix}}"
        def Avg(source = .const(),
                timeframe = 100.0) : () => .Float
            
        
        @label = "\\sqrt{\\sigma^2{{suffix}}}"
        def StdDev(source = .const(),
                   timeframe = 100.0)
             = .mathops.Sqrt(.observable.Moving.Var(source))
    }
    
    @python.intrinsic("observable.on_every_dt._OnEveryDt_Impl")
    @label = "[%(x)s]_dt=%(dt)s"
    @observe_args = "no"
    def OnEveryDt(dt = 1.0,
                  x = .constant()) : .IObservable[.Float]
        
    
    @python.observable()
    @label = "min{%(x)s, %(y)s}"
    def Min(x = .constant(),
            y = .constant())
         = if x<y then x else y
    
    @label = "Downs_{%(timeframe)s}(%(source)s)"
    def DownMovements(source = .const(),
                      timeframe = 10.0)
         = .observable.Observable(.observable.Max(.const(0.0),.observable.Lagged(source,timeframe)-source))
    
    @python.intrinsic("observable.lagged.Lagged_Impl")
    @label = "Lagged_{%(timeframe)s}(%(source)s)"
    def Lagged(source = .const(),
               timeframe = 10.0) : .IObservable[.Float]
        
    
    @python.intrinsic("observable.breaks_at_changes._BreaksAtChanges_Impl")
    def BreaksAtChanges(source = .constant(1.0)) : .IObservable[.Float]
        
    
    @python.observable()
    @label = "max{%(x)s, %(y)s}"
    def Max(x = .constant(),
            y = .constant())
         = if x>y then x else y
    
    @label = "Ups_{%(timeframe)s}(%(source)s)"
    def UpMovements(source = .const(),
                    timeframe = 10.0)
         = .observable.Observable(.observable.Max(.const(0.0),source-.observable.Lagged(source,timeframe)))
    
    @python.observable()
    @category = "Pow/Log"
    @label = "{%(x)s}^2"
    def Sqr(x = .constant())
         = x*x
    
    @label = "RSI_{%(timeframe)s}^{%(alpha)s}(%(book)s)"
    def RSI(book = .observable.orderbook.OfTrader(),
            timeframe = 10.0,
            alpha = 0.015)
         = 100.0-100.0/(1.0+.observable.rsi.Raw(.observable.orderbook.MidPrice(book),timeframe,alpha))
    
    @python.intrinsic("observable.on_every_dt._Observable_Impl")
    @label = "[%(x)s]"
    def ObservableVolume(x = .const() : .IFunction[.Float]) : .IObservable[.Volume]
        
    
    /** A discrete signal with user-defined increments.
     */
    @python.intrinsic("observable.randomwalk._RandomWalk_Impl")
    @label = "%(name)s"
    def RandomWalk(/** initial value of the signal */ initialValue = 0.0,
                   /** increment function */ deltaDistr = .mathutils.rnd.normalvariate(0.0,1.0),
                   /** intervals between signal updates */ intervalDistr = .mathutils.rnd.expovariate(1.0),
                   name = "-random-") : .IObservable[.Float]
        
    
    @python.intrinsic("observable.on_every_dt._ObservableSide_Impl")
    @label = "[%(x)s]"
    def ObservableSide(x = .side.Sell() : .IFunction[.Side]) : .IObservable[.Side]
        
    
    @python.intrinsic("observable.quote.Quote_Impl")
    @label = "%(ticker)s"
    def Quote(ticker = "^GSPC",
              start = "2001-1-1",
              end = "2010-1-1") : .IObservable[.Price]
        
    
    @python.intrinsic("observable.candlestick.CandleSticks_Impl")
    @label = "Candles_{%(source)s}"
    def CandleSticks(source = .const(),
                     timeframe = 10.0) : .IObservable[.CandleStick]
        
    
    @python.intrinsic("observable.on_every_dt._Observable_Impl")
    @label = "[%(x)s]"
    def ObservablePrice(x = .const() : .IFunction[.Float]) : .IObservable[.Price]
        
    
    @python.intrinsic("observable.on_every_dt._Observable_Impl")
    @label = "[%(x)s]"
    def Observable(x = .const() : .IFunction[.Float]) : .IObservable[.Float]
        
}
@python = "no"

package trash() {
    package types() {
        type T1 = T
        
        type T
        
        type R : T
        
        type U : T, R
    }
    
    package in1() {
        package in2() {
            def S1(y = "abc")
                 = y
            
            def F(x = .trash.in1.in2.IntFunc() : .IFunction[.Float])
                 = x
            
            def A(x = .constant(),
                  y = if 3>x+2 then x else x*2) : () => .trash.types.T
                
            
            def IntObs() : .IObservable[.Int]
                
            
            def IntFunc() : .IFunction[.Int]
                
            
            def C(x : .IFunction[.CandleStick],
                  p = [12,23.2,0])
                 = p
            
            def S2() : .Optional[.String]
                 = .trash.in1.in2.S1()
            
            def O(x = .trash.in1.in2.IntObs() : .IObservable[.Float])
                 = x
        }
        
        def A(x : () => .trash.types.T1 = .trash.A()) : () => .trash.types.U
            
        
        def toInject1() : () => .Int
            
        
        def toInject2() : () => .Int
            
    }
    
    def A(x = .trash.in1.in2.A()) : () => .trash.types.R
        
}

@category = "Basic"
@label = "C=%(x)s"
def constant(x = 1.0) : .IFunction[.Float]
     = .const(x)

@category = "Basic"
@python.intrinsic.function("_constant._False_Impl")
@label = "False"
def false() : .IObservable[.Boolean]
    

type ITrader

type IGraph

type CandleStick

type Volume : Int

type Optional[T]

type IAccount

type Side

type Boolean

type Price : Float

@category = "Basic"
@python.intrinsic("_constant._Null_Impl")
def null() : () => .Float
    

type IOrderQueue

@category = "Basic"
@python.intrinsic("timeserie._ToRecord_Impl")
@label = "%(source)s"
def TimeSerie(source = .const(0.0) : .IObservable[.Any],
              graph = .veusz.Graph(),
              _digitsToShow = 4,
              _smooth = 1) : .ITimeSerie
    

type Float

type Int : Float

type ILink

type IOrderBook

type IEvent

type IMultiAssetStrategy

@category = "Basic"
@python.intrinsic.function("_constant._Constant_Impl")
@label = "C=%(x)s"
def const(x = 1.0) : .IObservable[.Float]
    

type ITwoWayLink

type IObservable[U] : IFunction[U], IEvent

type IFunction[T] = () => T

type ISingleAssetStrategy

type ISingleAssetTrader : IAccount, ITrader

@category = "Basic"
@python.intrinsic.function("_constant._True_Impl")
@label = "True"
def true() : .IObservable[.Boolean]
    

type IVolumeLevels

type Order

@category = "Basic"
@python.intrinsic("observable.derivative._Derivative_Impl")
@label = "\\frac{d%(x)s}{dt}"
def Derivative(x = .observable.EW.Avg() : .IDifferentiable) : () => .Float
    

type List[T]

type IDifferentiable : IFunction[Float]

@category = "Basic"
@python.observable()
@label = "If def(%(x)s) else %(elsePart)s"
def IfDefined(x = .constant(),
              elsePart = .constant())
     = if x<>.null() then x else elsePart

type ITimeSerie

type Any

@category = "Basic"
@python.intrinsic("timeserie._VolumeLevels_Impl")
@label = "%(source)s"
def volumeLevels(source : .IFunction[.IVolumeLevels],
                 graph = .veusz.Graph(),
                 _digitsToShow = 4,
                 _smooth = 1,
                 _volumes = [30.0],
                 _isBuy = 1) : .ITimeSerie
    

type IOrderGenerator = IObservable[Order]

type String
