from marketsim import registry
from marketsim.gen._out._observable._observablefloat import Observablefloat
from marketsim.gen._out._iobservable._iobservablefloat import IObservablefloat
from marketsim import context
@registry.expose(["Basic", "UpMovements"])
class UpMovements_IObservableFloatFloat(Observablefloat):
    """ 
    """ 
    def __init__(self, source = None, timeframe = None):
        from marketsim import deref_opt
        from marketsim.gen._out._observable._observablefloat import Observablefloat
        from marketsim import _
        from marketsim import rtti
        from marketsim.gen._out._const import const_Float as _const_Float
        from marketsim import event
        Observablefloat.__init__(self)
        self.source = source if source is not None else deref_opt(_const_Float(1.0))
        self.timeframe = timeframe if timeframe is not None else 10.0
        rtti.check_fields(self)
        self.impl = self.getImpl()
        event.subscribe(self.impl, _(self).fire, self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'source' : IObservablefloat,
        'timeframe' : float
    }
    
    
    
    
    def __repr__(self):
        return "Ups_{%(timeframe)s}(%(source)s)" % { name : getattr(self, name) for name in self._properties.iterkeys() }
    
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
        from marketsim.gen._out.math._lagged import Lagged_IObservableFloatFloat as _math_Lagged_IObservableFloatFloat
        from marketsim.gen._out.math._max import Max_FloatIObservableFloat as _math_Max_FloatIObservableFloat
        from marketsim import deref_opt
        from marketsim.gen._out._constant import constant_Float as _constant_Float
        from marketsim.gen._out.ops._sub import Sub_IObservableFloatIObservableFloat as _ops_Sub_IObservableFloatIObservableFloat
        return deref_opt(_math_Max_FloatIObservableFloat(deref_opt(_constant_Float(0.0)),deref_opt(_ops_Sub_IObservableFloatIObservableFloat(self.source,deref_opt(_math_Lagged_IObservableFloatFloat(self.source,self.timeframe))))))
    
    def __getattr__(self, name):
        if name[0:2] != '__' and self.impl:
            return getattr(self.impl, name)
        else:
            raise AttributeError
    
def UpMovements(source = None,timeframe = None): 
    from marketsim.gen._out._iobservable._iobservablefloat import IObservablefloat
    from marketsim import rtti
    if source is None or rtti.can_be_casted(source, IObservablefloat):
        if timeframe is None or rtti.can_be_casted(timeframe, float):
            return UpMovements_IObservableFloatFloat(source,timeframe)
    raise Exception('Cannot find suitable overload for UpMovements('+str(source) +':'+ str(type(source))+','+str(timeframe) +':'+ str(type(timeframe))+')')
