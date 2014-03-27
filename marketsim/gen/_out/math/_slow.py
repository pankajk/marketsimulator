from marketsim import registry
from marketsim.gen._out.math._macd import macd
@registry.expose(["-", "Slow"])
class Slow_mathmacd(object):
    """ 
    """ 
    def __init__(self, x = None):
        from marketsim.gen._out.math._macd import macd_IObservableFloatFloatFloat as _math_macd_IObservableFloatFloatFloat
        from marketsim import deref_opt
        from marketsim import rtti
        self.x = x if x is not None else deref_opt(_math_macd_IObservableFloatFloatFloat())
        rtti.check_fields(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : macd
    }
    
    
    def __repr__(self):
        return "MACD_{%(fast)s}^{%(slow)s}(%(source)s)" % { name : getattr(self, name) for name in self._properties.iterkeys() }
    
    @property
    def dereference(self):
        return self.x.slow
    
def Slow(x = None): 
    from marketsim.gen._out.math._macd import macd
    from marketsim import rtti
    if x is None or rtti.can_be_casted(x, macd):
        return Slow_mathmacd(x)
    raise Exception('Cannot find suitable overload for Slow('+str(x) +':'+ str(type(x))+')')
