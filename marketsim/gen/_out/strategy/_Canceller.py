from marketsim import registry
from marketsim.gen._intrinsic.strategy.canceller import _Canceller_Impl
from marketsim import IFunction
@registry.expose(["Strategy", "Canceller"])
class Canceller(_Canceller_Impl):
    """ 
    """ 
    def __init__(self, cancellationIntervalDistr = None):
        from marketsim.gen._out.math.random._expovariate import expovariate as _math_random_expovariate
        from marketsim import rtti
        self.cancellationIntervalDistr = cancellationIntervalDistr if cancellationIntervalDistr is not None else _math_random_expovariate(1.0)
        rtti.check_fields(self)
        _Canceller_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'cancellationIntervalDistr' : IFunction[float]
    }
    def __repr__(self):
        return "Canceller(%(cancellationIntervalDistr)s)" % self.__dict__
    
