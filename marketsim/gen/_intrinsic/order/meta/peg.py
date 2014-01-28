from marketsim import (Side, Order, ops)

from marketsim.gen._intrinsic.order.meta.floating_price import Order_Impl as FloatingPrice

def Peg(order):
    """ Peg is a virtual order that ensures that it has the best price in the order book. 
    It is implemented as a limit order which is cancelled 
    once the best price in the order queue has changed 
    and is sent again to the order book 
    with a price one tick better than the best price in the book.
    """
    from marketsim.gen._out.orderbook._OfTrader import OfTrader
    from marketsim.gen._out.orderbook._TickSize import TickSize
    from marketsim.gen._out.orderbook.ask._Price import Price as AskPrice
    from marketsim.gen._out.orderbook.bid._Price import Price as BidPrice
    from marketsim.gen._out.math.Cumulative._MaxEpsilon import MaxEpsilon
    from marketsim.gen._out.math.Cumulative._MinEpsilon import MinEpsilon

    side = order.side
    book = OfTrader()
    tickSize = TickSize(book)
    askPrice = AskPrice(book)
    bidPrice = BidPrice(book)
    
    price = MinEpsilon(askPrice, tickSize)\
                if side == Side.Sell else\
            MaxEpsilon(bidPrice, tickSize)

    return FloatingPrice(order, price)

# unfortunately we cannot use _floating_price.Factory since price function depends on the order side 
class Factory_Impl(ops.Observable[Order]):
    
    def __call__(self):
        from marketsim.gen._out._constant import constant
        proto = self.proto(constant(0))()
        return Peg(proto) if proto is not None else None
