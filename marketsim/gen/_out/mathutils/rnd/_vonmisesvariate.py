from marketsim import registry, types, ops
import random

@registry.expose(['Random', 'Von Mises distribution'])
class vonmisesvariate(ops.Function[float]):

    """ 
    """ 
    def __init__(self, Mu = Some(0.0), Kappa = Some(0.0)):
        self.Mu = Mu
        self.Kappa = Kappa

    @property
    def label(self):
        return repr(self)

    _properties = {
        'Mu' : float,
        'Kappa' : float
    }

    def __repr__(self):
        return "vonmisesvariate(Mu = "+repr(self.Mu)+" , Kappa = "+repr(self.Kappa)+" )" 


    def __call__(self, *args, **kwargs):
        return random.vonmisesvariate(self.Mu, self.Kappa)

    def _casts_to(self, dst):
        return vonmisesvariate._types[0]._casts_to(dst)


