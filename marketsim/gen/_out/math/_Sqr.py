from marketsim.ops._all import Observable
from marketsim import IObservable
from marketsim import registry
from marketsim import context
from marketsim import float
@registry.expose(["Log/Pow", "Sqr"])
class Sqr_IObservableFloat(Observable[float]):
    """ 
    """ 
    def __init__(self, x = None):
        from marketsim.ops._all import Observable
        from marketsim import _
        from marketsim.gen._out._const import const_Float as _const
        from marketsim import rtti
        from marketsim import event
        from marketsim import float
        Observable[float].__init__(self)
        self.x = x if x is not None else _const(1.0)
        rtti.check_fields(self)
        self.impl = self.getImpl()
        event.subscribe(self.impl, _(self).fire, self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : IObservable[float]
    }
    def __repr__(self):
        return "{%(x)s}^2" % self.__dict__
    
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
        from marketsim.gen._out.ops._mul import Mul_IObservableFloatIObservableFloat as _ops_Mul
        return _ops_Mul(self.x,self.x)
    
from marketsim.ops._all import Observable
from marketsim import IFunction
from marketsim import registry
from marketsim import context
from marketsim import float
@registry.expose(["Log/Pow", "Sqr"])
class Sqr_IFunctionFloat(Observable[float]):
    """ 
    """ 
    def __init__(self, x = None):
        from marketsim.ops._all import Observable
        from marketsim import _
        from marketsim import rtti
        from marketsim import event
        from marketsim.gen._out._constant import constant_Float as _constant
        from marketsim import float
        Observable[float].__init__(self)
        self.x = x if x is not None else _constant(1.0)
        rtti.check_fields(self)
        self.impl = self.getImpl()
        event.subscribe(self.impl, _(self).fire, self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : IFunction[float]
    }
    def __repr__(self):
        return "{%(x)s}^2" % self.__dict__
    
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
        from marketsim.gen._out.ops._mul import Mul_IFunctionFloatIFunctionFloat as _ops_Mul
        return _ops_Mul(self.x,self.x)
    
def Sqr(x = None): 
    from marketsim import IObservable
    from marketsim import float
    from marketsim import IFunction
    from marketsim import rtti
    if x is None or rtti.can_be_casted(x, IObservable[float]):
        return Sqr_IObservableFloat(x)
    if x is None or rtti.can_be_casted(x, IFunction[float]):
        return Sqr_IFunctionFloat(x)
    raise Exception('Cannot find suitable overload for Sqr('+str(x)+')')
