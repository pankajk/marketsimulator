# generated with class generator.python.intrinsic_function$Import
from marketsim import registry
from marketsim.gen._out._imultiassetstrategy import IMultiAssetStrategy
from marketsim.gen._intrinsic.strategy.arbitrage import Arbitrage_Impl
@registry.expose(["Strategy", "Arbitrage"])
class Arbitrage_(IMultiAssetStrategy,Arbitrage_Impl):
    """ **Strategy for a multi asset trader.**
    
     It believes that these assets represent a single asset traded on different venues
     Once an ask at one venue becomes lower than a bid at another venue
     it sends market sell and buy orders in order to exploit this arbitrage possibility
    
    Parameters are:
    """ 
    def __init__(self):
        from marketsim import rtti
        
        rtti.check_fields(self)
        Arbitrage_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        
    }
    
    def __repr__(self):
        return "Arbitrage" % dict([ (name, getattr(self, name)) for name in self._properties.iterkeys() ])
    
    def bind_ex(self, ctx):
        if hasattr(self, '_bound_ex'): return
        self._bound_ex = True
        if hasattr(self, '_processing_ex'):
            raise Exception('cycle detected')
        self._processing_ex = True
        self._ctx_ex = ctx.updatedFrom(self)
        if hasattr(self, '_internals'):
            for t in self._internals:
                v = getattr(self, t)
                if type(v) in [list, set]:
                    for w in v: w.bind_ex(self._ctx_ex)
                else:
                    v.bind_ex(self._ctx_ex)
        
        if hasattr(self, 'bind_impl'): self.bind_impl(self._ctx_ex)
        if hasattr(self, '_subscriptions'):
            for s in self._subscriptions: s.bind_ex(self._ctx_ex)
        delattr(self, '_processing_ex')
    
def Arbitrage(): 
    from marketsim import rtti
    return Arbitrage_()
    raise Exception('Cannot find suitable overload for Arbitrage('++')')