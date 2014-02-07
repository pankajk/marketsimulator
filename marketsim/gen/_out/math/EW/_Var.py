from marketsim import IObservable
from marketsim.gen._intrinsic.moments.ewmv import EWMV_Impl
from marketsim import registry
from marketsim.ops._function import Function
from marketsim import float
@registry.expose(["Statistics", "Var"])
class Var_Optional__IObservable__Float____Optional__Float_(Function[float],EWMV_Impl):
    """ 
    """ 
    def __init__(self, source = None, alpha = None):
        from marketsim.gen._out._const import const as _const
        from marketsim import rtti
        self.source = source if source is not None else _const()
        self.alpha = alpha if alpha is not None else 0.015
        rtti.check_fields(self)
        EWMV_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'source' : IObservable[float],
        'alpha' : float
    }
    def __repr__(self):
        return "\\sigma^2_{\\alpha=%(alpha)s}(%(source)s)" % self.__dict__
    
def Var(source = None,alpha = None): 
    from marketsim import IObservable
    from marketsim import float
    from marketsim import rtti
    if source is None or rtti.can_be_casted(source, IObservable[float]):
        if alpha is None or rtti.can_be_casted(alpha, float):
            return Var_Optional__IObservable__Float____Optional__Float_(source,alpha)
    raise Exception("Cannot find suitable overload")
