from marketsim import registry
from marketsim import Side
from marketsim.ops._function import Function
from marketsim.gen._intrinsic.side import _Buy_Impl
@registry.expose(["Side", "Buy"])
class Buy_(Function[Side],_Buy_Impl):
    """ 
    """ 
    def __init__(self):
        from marketsim import rtti
        
        rtti.check_fields(self)
        _Buy_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        
    }
    def __repr__(self):
        return "Buy" % self.__dict__
    
def Buy(): 
    from marketsim import rtti
    return Buy_()
    raise Exception("Cannot find suitable overload")
