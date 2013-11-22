from marketsim import registry, types, ops
import random

@registry.expose(['Random', 'Exponential distribution'])
class expovariate(ops.Function[float]):
    """ 
      Returned values range from 0 to positive infinity
    """ 
    def __init__(self, Lambda = Some(1.0)):
        self.Lambda = Lambda

    @property
    def label(self):
        return repr(self)

    _properties = {
        'Lambda' : float
    }

    def __repr__(self):
        return "expovariate(Lambda = "+repr(self.Lambda)+" )" 

    def __call__(self, *args, **kwargs):
        return random.expovariate(self.Lambda)

    def _casts_to(self, dst):
        return expovariate._types[0]._casts_to(dst)