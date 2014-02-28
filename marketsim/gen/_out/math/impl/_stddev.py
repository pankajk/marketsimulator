from marketsim import registry
from marketsim.gen._out._ifunction._ifunctionfloat import IFunctionfloat
from marketsim.gen._out.math.impl._imoving import IMoving
from marketsim import context
@registry.expose(["Statistics", "StdDev"])
class StdDev_mathimplIMoving(IFunctionfloat):
    """ 
    """ 
    def __init__(self, x = None):
        from marketsim.gen._out.math.impl._moving import Moving_IObservableFloatFloat as _math_impl_Moving_IObservableFloatFloat
        from marketsim import deref_opt
        from marketsim import rtti
        self.x = x if x is not None else deref_opt(_math_impl_Moving_IObservableFloatFloat())
        rtti.check_fields(self)
        self.impl = self.getImpl()
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : IMoving
    }
    def __repr__(self):
        return "StdDev(%(x)s)" % self.__dict__
    
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
        from marketsim.gen._out.math.moving._stddev import StdDev_IObservableFloatFloat as _math_Moving_StdDev_IObservableFloatFloat
        from marketsim.gen._out.math.impl._source import Source_mathimplIStatDomain as _math_impl_Source_mathimplIStatDomain
        from marketsim import deref_opt
        from marketsim.gen._out.math.impl._timeframe import Timeframe_mathimplIMoving as _math_impl_Timeframe_mathimplIMoving
        return deref_opt(_math_Moving_StdDev_IObservableFloatFloat(deref_opt(_math_impl_Source_mathimplIStatDomain(self.x)),deref_opt(_math_impl_Timeframe_mathimplIMoving(self.x))))
    
from marketsim import registry
from marketsim.gen._out._ifunction._ifunctionfloat import IFunctionfloat
from marketsim.gen._out.math.impl._icumulative import ICumulative
from marketsim import context
@registry.expose(["Statistics", "StdDev"])
class StdDev_mathimplICumulative(IFunctionfloat):
    """ 
    """ 
    def __init__(self, x = None):
        from marketsim.gen._out.math.impl._cumulative import Cumulative_IObservableFloat as _math_impl_Cumulative_IObservableFloat
        from marketsim import deref_opt
        from marketsim import rtti
        self.x = x if x is not None else deref_opt(_math_impl_Cumulative_IObservableFloat())
        rtti.check_fields(self)
        self.impl = self.getImpl()
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : ICumulative
    }
    def __repr__(self):
        return "StdDev(%(x)s)" % self.__dict__
    
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
        from marketsim.gen._out.math.cumulative._stddev import StdDev_IObservableFloat as _math_Cumulative_StdDev_IObservableFloat
        from marketsim.gen._out.math.impl._source import Source_mathimplIStatDomain as _math_impl_Source_mathimplIStatDomain
        from marketsim import deref_opt
        return deref_opt(_math_Cumulative_StdDev_IObservableFloat(deref_opt(_math_impl_Source_mathimplIStatDomain(self.x))))
    
from marketsim import registry
from marketsim.gen._out._ifunction._ifunctionfloat import IFunctionfloat
from marketsim.gen._out.math.impl._iew import IEW
from marketsim import context
@registry.expose(["Statistics", "StdDev"])
class StdDev_mathimplIEW(IFunctionfloat):
    """ 
    """ 
    def __init__(self, x = None):
        from marketsim.gen._out.math.impl._ew import EW_IObservableFloatFloat as _math_impl_EW_IObservableFloatFloat
        from marketsim import deref_opt
        from marketsim import rtti
        self.x = x if x is not None else deref_opt(_math_impl_EW_IObservableFloatFloat())
        rtti.check_fields(self)
        self.impl = self.getImpl()
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : IEW
    }
    def __repr__(self):
        return "StdDev(%(x)s)" % self.__dict__
    
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
        from marketsim.gen._out.math.ew._stddev import StdDev_IObservableFloatFloat as _math_EW_StdDev_IObservableFloatFloat
        from marketsim.gen._out.math.impl._source import Source_mathimplIStatDomain as _math_impl_Source_mathimplIStatDomain
        from marketsim import deref_opt
        from marketsim.gen._out.math.impl._alpha import Alpha_mathimplIEW as _math_impl_Alpha_mathimplIEW
        return deref_opt(_math_EW_StdDev_IObservableFloatFloat(deref_opt(_math_impl_Source_mathimplIStatDomain(self.x)),deref_opt(_math_impl_Alpha_mathimplIEW(self.x))))
    
def StdDev(x = None): 
    from marketsim.gen._out.math.impl._imoving import IMoving
    from marketsim.gen._out.math.impl._icumulative import ICumulative
    from marketsim.gen._out.math.impl._iew import IEW
    from marketsim import rtti
    if x is None or rtti.can_be_casted(x, IMoving):
        return StdDev_mathimplIMoving(x)
    if x is None or rtti.can_be_casted(x, ICumulative):
        return StdDev_mathimplICumulative(x)
    if x is None or rtti.can_be_casted(x, IEW):
        return StdDev_mathimplIEW(x)
    raise Exception('Cannot find suitable overload for StdDev('+str(x) +':'+ str(type(x))+')')