from marketsim.ops._all import Observable
from marketsim import IObservable
from marketsim import Side
from marketsim import registry
from marketsim import context
from marketsim import float
@registry.expose(["Side function", "Signal"])
class Signal_IObservableFloatFloat(Observable[Side]):
    """ 
    """ 
    def __init__(self, signal = None, threshold = None):
        from marketsim import Side
        from marketsim.ops._all import Observable
        from marketsim import _
        from marketsim.gen._out._const import const_Float as _const
        from marketsim import rtti
        from marketsim import event
        Observable[Side].__init__(self)
        self.signal = signal if signal is not None else _const(0.0)
        self.threshold = threshold if threshold is not None else 0.7
        rtti.check_fields(self)
        self.impl = self.getImpl()
        event.subscribe(self.impl, _(self).fire, self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'signal' : IObservable[float],
        'threshold' : float
    }
    def __repr__(self):
        return "Signal(%(signal)s, %(threshold)s)" % self.__dict__
    
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
        from marketsim.gen._out.side._buy import Buy_ as _side_Buy
        from marketsim.gen._out.ops._greater import Greater_IFunctionFloatIFunctionFloat as _ops_Greater
        from marketsim.gen._out.side._nothing import Nothing_ as _side_Nothing
        from marketsim.gen._out.ops._less import Less_IFunctionFloatIFunctionFloat as _ops_Less
        from marketsim.gen._out.ops._condition_side import Condition_Side_IFunctionBooleanSideSide as _ops_Condition_Side
        from marketsim.gen._out.side._sell import Sell_ as _side_Sell
        from marketsim.gen._out._constant import constant_Float as _constant
        return _ops_Condition_Side(_ops_Greater(self.signal,_constant(self.threshold)),_side_Buy(),_ops_Condition_Side(_ops_Less(self.signal,_constant((0-self.threshold))),_side_Sell(),_side_Nothing()))
    
from marketsim.ops._all import Observable
from marketsim import IFunction
from marketsim import Side
from marketsim import registry
from marketsim import context
from marketsim import float
@registry.expose(["Side function", "Signal"])
class Signal_IFunctionFloatFloat(Observable[Side]):
    """ 
    """ 
    def __init__(self, signal = None, threshold = None):
        from marketsim import Side
        from marketsim.ops._all import Observable
        from marketsim import _
        from marketsim import rtti
        from marketsim import event
        from marketsim.gen._out._constant import constant_Float as _constant
        Observable[Side].__init__(self)
        self.signal = signal if signal is not None else _constant(0.0)
        self.threshold = threshold if threshold is not None else 0.7
        rtti.check_fields(self)
        self.impl = self.getImpl()
        event.subscribe(self.impl, _(self).fire, self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'signal' : IFunction[float],
        'threshold' : float
    }
    def __repr__(self):
        return "Signal(%(signal)s, %(threshold)s)" % self.__dict__
    
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
        from marketsim.gen._out.side._buy import Buy_ as _side_Buy
        from marketsim.gen._out.ops._greater import Greater_IFunctionFloatIFunctionFloat as _ops_Greater
        from marketsim.gen._out.side._nothing import Nothing_ as _side_Nothing
        from marketsim.gen._out.ops._less import Less_IFunctionFloatIFunctionFloat as _ops_Less
        from marketsim.gen._out.ops._condition_side import Condition_Side_IFunctionBooleanSideSide as _ops_Condition_Side
        from marketsim.gen._out.side._sell import Sell_ as _side_Sell
        from marketsim.gen._out._constant import constant_Float as _constant
        return _ops_Condition_Side(_ops_Greater(self.signal,_constant(self.threshold)),_side_Buy(),_ops_Condition_Side(_ops_Less(self.signal,_constant((0-self.threshold))),_side_Sell(),_side_Nothing()))
    
def Signal(signal = None,threshold = None): 
    from marketsim import IObservable
    from marketsim import float
    from marketsim import IFunction
    from marketsim import rtti
    if signal is None or rtti.can_be_casted(signal, IObservable[float]):
        if threshold is None or rtti.can_be_casted(threshold, float):
            return Signal_IObservableFloatFloat(signal,threshold)
    if signal is None or rtti.can_be_casted(signal, IFunction[float]):
        if threshold is None or rtti.can_be_casted(threshold, float):
            return Signal_IFunctionFloatFloat(signal,threshold)
    raise Exception('Cannot find suitable overload for Signal('+str(signal)+','+str(threshold)+')')
