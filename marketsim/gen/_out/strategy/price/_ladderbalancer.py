# generated with class generator.python.intrinsic_function$Import
from marketsim import registry
from marketsim.gen._out._iladderstrategy import ILadderStrategy
from marketsim.gen._intrinsic.strategy.ladder import Balancer_Impl
@registry.expose(["Price function", "LadderBalancer"])
class LadderBalancer_ILadderStrategyInt(ILadderStrategy,Balancer_Impl):
    """ 
    """ 
    def __init__(self, inner = None, maximalSize = None):
        from marketsim.gen._out.strategy.price._laddermm import LadderMM_SideFloatIObservableIOrderInt as _strategy_price_LadderMM_SideFloatIObservableIOrderInt
        from marketsim import deref_opt
        self.inner = inner if inner is not None else deref_opt(_strategy_price_LadderMM_SideFloatIObservableIOrderInt())
        self.maximalSize = maximalSize if maximalSize is not None else 20
        Balancer_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'inner' : ILadderStrategy,
        'maximalSize' : int
    }
    
    
    
    
    def __repr__(self):
        return "LadderBalancer(%(inner)s, %(maximalSize)s)" % dict([ (name, getattr(self, name)) for name in self._properties.iterkeys() ])
    
    def bind_ex(self, ctx):
        if self.__dict__.get('_bound_ex', False): return
        self.__dict__['_bound_ex'] = True
        if self.__dict__.get('_processing_ex', False):
            raise Exception('cycle detected')
        self.__dict__['_processing_ex'] = True
        self.__dict__['_ctx_ex'] = ctx.updatedFrom(self)
        if hasattr(self, '_internals'):
            for t in self._internals:
                v = getattr(self, t)
                if type(v) in [list, set]:
                    for w in v: w.bind_ex(self.__dict__['_ctx_ex'])
                else:
                    v.bind_ex(self.__dict__['_ctx_ex'])
        self.inner.bind_ex(self._ctx_ex)
        self.bind_impl(self.__dict__['_ctx_ex'])
        if hasattr(self, '_subscriptions'):
            for s in self._subscriptions: s.bind_ex(self.__dict__['_ctx_ex'])
        self.__dict__['_processing_ex'] = False
    
    def reset_ex(self, generation):
        if self.__dict__.get('_reset_generation_ex', -1) == generation: return
        self.__dict__['_reset_generation_ex'] = generation
        if self.__dict__.get('_processing_ex', False):
            raise Exception('cycle detected')
        self.__dict__['_processing_ex'] = True
        if hasattr(self, '_internals'):
            for t in self._internals:
                v = getattr(self, t)
                if type(v) in [list, set]:
                    for w in v: w.reset_ex(generation)
                else:
                    v.reset_ex(generation)
        self.inner.reset_ex(generation)
        self.reset()
        if hasattr(self, '_subscriptions'):
            for s in self._subscriptions: s.reset_ex(generation)
        self.__dict__['_processing_ex'] = False
    
    def typecheck(self):
        from marketsim import rtti
        from marketsim.gen._out._iladderstrategy import ILadderStrategy
        rtti.typecheck(ILadderStrategy, self.inner)
        rtti.typecheck(int, self.maximalSize)
    
    def registerIn(self, registry):
        if self.__dict__.get('_id', False): return
        self.__dict__['_id'] = True
        if self.__dict__.get('_processing_ex', False):
            raise Exception('cycle detected')
        self.__dict__['_processing_ex'] = True
        registry.insert(self)
        self.inner.registerIn(registry)
        if hasattr(self, '_subscriptions'):
            for s in self._subscriptions: s.registerIn(registry)
        if hasattr(self, '_internals'):
            for t in self._internals:
                v = getattr(self, t)
                if type(v) in [list, set]:
                    for w in v: w.registerIn(registry)
                else:
                    v.registerIn(registry)
        self.__dict__['_processing_ex'] = False
    
    def bind_impl(self, ctx):
        Balancer_Impl.bind_impl(self, ctx)
    
    def reset(self):
        Balancer_Impl.reset(self)
    
def LadderBalancer(inner = None,maximalSize = None): 
    from marketsim.gen._out._iladderstrategy import ILadderStrategy
    from marketsim import rtti
    if inner is None or rtti.can_be_casted(inner, ILadderStrategy):
        if maximalSize is None or rtti.can_be_casted(maximalSize, int):
            return LadderBalancer_ILadderStrategyInt(inner,maximalSize)
    raise Exception('Cannot find suitable overload for LadderBalancer('+str(inner) +':'+ str(type(inner))+','+str(maximalSize) +':'+ str(type(maximalSize))+')')
