from marketsim import Side
from marketsim.order import AlwaysBestOrder, LimitOrderSell, LimitOrderBuy
from marketsim.order_queue import OrderBook

book = OrderBook(tickSize = 1)

book.process(LimitOrderSell(100,10))

ab = AlwaysBestOrder(10, side = Side.Sell)

book.process(ab)

assert book.asks.best.price == 99
assert ab.volume == 10
assert ab.PnL == 0

book.process(LimitOrderSell(98,10))

assert book.asks.best.price == 97
assert ab.volume == 10
assert ab.PnL == 0

book.process(LimitOrderBuy(98,5))

assert book.asks.best.price == 97
assert ab.volume == 5
assert ab.PnL == +97*5

book.process(LimitOrderBuy(98,10))

assert book.asks.best.price == 98
assert ab.volume == 0
assert ab.PnL == +97*10

