from marketsim.ops._all import Observable
from marketsim import IOrderQueue
from marketsim import IObservable
from marketsim import registry
from marketsim import Price
from marketsim import context
from marketsim import float
@registry.expose(["Asset", "SafeSidePrice"])
class SafeSidePrice_IOrderQueueIObservableFloat(Observable[Price]):
    """   and *defaultValue* if there haven't been any trades
    """ 
    def __init__(self, queue = None, defaultValue = None):
        from marketsim import Price
        from marketsim.ops._all import Observable
        from marketsim import _
        from marketsim import rtti
        from marketsim.gen._out._const import const_Float as _const_Float
        from marketsim import event
        from marketsim.gen._out.orderbook._asks import Asks_IOrderBook as _orderbook_Asks_IOrderBook
        Observable[Price].__init__(self)
        self.queue = queue if queue is not None else _orderbook_Asks_IOrderBook()
        self.defaultValue = defaultValue if defaultValue is not None else _const_Float(100.0)
        rtti.check_fields(self)
        self.impl = self.getImpl()
        event.subscribe(self.impl, _(self).fire, self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'queue' : IOrderQueue,
        'defaultValue' : IObservable[float]
    }
    def __repr__(self):
        return "SafeSidePrice(%(queue)s, %(defaultValue)s)" % self.__dict__
    
    def bind(self, ctx):
        self._ctx = ctx.clone()
    
    _internals = ['impl']
    def __call__(self, *args, **kwargs):
        return self.impl()
    
    def reset(self):
        self.impl = self.getImpl()
        ctx = getattr(self, '_ctx', None)
        if ctx: context.bind(self.impl, ctx)
    
    def getImpl(self):
        from marketsim.gen._out.observable._price import Price_IFunctionFloat as _observable_Price_IFunctionFloat
        from marketsim.gen._out._ifdefined import IfDefined_IObservableFloatIObservableFloat as _IfDefined_IObservableFloatIObservableFloat
        from marketsim.gen._out.orderbook._bestprice import BestPrice_IOrderQueue as _orderbook_BestPrice_IOrderQueue
        from marketsim.gen._out.orderbook._lastprice import LastPrice_IOrderQueue as _orderbook_LastPrice_IOrderQueue
        return _observable_Price_IFunctionFloat(_IfDefined_IObservableFloatIObservableFloat(_orderbook_BestPrice_IOrderQueue(self.queue),_IfDefined_IObservableFloatIObservableFloat(_orderbook_LastPrice_IOrderQueue(self.queue),self.defaultValue)))
    
from marketsim.ops._all import Observable
from marketsim import IFunction
from marketsim import IOrderQueue
from marketsim import registry
from marketsim import Price
from marketsim import context
from marketsim import float
@registry.expose(["Asset", "SafeSidePrice"])
class SafeSidePrice_IOrderQueueIFunctionFloat(Observable[Price]):
    """   and *defaultValue* if there haven't been any trades
    """ 
    def __init__(self, queue = None, defaultValue = None):
        from marketsim import Price
        from marketsim.ops._all import Observable
        from marketsim import _
        from marketsim import rtti
        from marketsim.gen._out._constant import constant_Float as _constant_Float
        from marketsim import event
        from marketsim.gen._out.orderbook._asks import Asks_IOrderBook as _orderbook_Asks_IOrderBook
        Observable[Price].__init__(self)
        self.queue = queue if queue is not None else _orderbook_Asks_IOrderBook()
        self.defaultValue = defaultValue if defaultValue is not None else _constant_Float(100.0)
        rtti.check_fields(self)
        self.impl = self.getImpl()
        event.subscribe(self.impl, _(self).fire, self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'queue' : IOrderQueue,
        'defaultValue' : IFunction[float]
    }
    def __repr__(self):
        return "SafeSidePrice(%(queue)s, %(defaultValue)s)" % self.__dict__
    
    def bind(self, ctx):
        self._ctx = ctx.clone()
    
    _internals = ['impl']
    def __call__(self, *args, **kwargs):
        return self.impl()
    
    def reset(self):
        self.impl = self.getImpl()
        ctx = getattr(self, '_ctx', None)
        if ctx: context.bind(self.impl, ctx)
    
    def getImpl(self):
        from marketsim.gen._out.observable._price import Price_IFunctionFloat as _observable_Price_IFunctionFloat
        from marketsim.gen._out.orderbook._bestprice import BestPrice_IOrderQueue as _orderbook_BestPrice_IOrderQueue
        from marketsim.gen._out._ifdefined import IfDefined_IObservableFloatIFunctionFloat as _IfDefined_IObservableFloatIFunctionFloat
        from marketsim.gen._out.orderbook._lastprice import LastPrice_IOrderQueue as _orderbook_LastPrice_IOrderQueue
        from marketsim.gen._out._ifdefined import IfDefined_IObservableFloatIObservableFloat as _IfDefined_IObservableFloatIObservableFloat
        return _observable_Price_IFunctionFloat(_IfDefined_IObservableFloatIObservableFloat(_orderbook_BestPrice_IOrderQueue(self.queue),_IfDefined_IObservableFloatIFunctionFloat(_orderbook_LastPrice_IOrderQueue(self.queue),self.defaultValue)))
    
def SafeSidePrice(queue = None,defaultValue = None): 
    from marketsim import IFunction
    from marketsim import rtti
    from marketsim import IOrderQueue
    from marketsim import IObservable
    from marketsim import float
    if queue is None or rtti.can_be_casted(queue, IOrderQueue):
        if defaultValue is None or rtti.can_be_casted(defaultValue, IObservable[float]):
            return SafeSidePrice_IOrderQueueIObservableFloat(queue,defaultValue)
    if queue is None or rtti.can_be_casted(queue, IOrderQueue):
        if defaultValue is None or rtti.can_be_casted(defaultValue, IFunction[float]):
            return SafeSidePrice_IOrderQueueIFunctionFloat(queue,defaultValue)
    raise Exception('Cannot find suitable overload for SafeSidePrice('+str(queue)+','+str(defaultValue)+')')
