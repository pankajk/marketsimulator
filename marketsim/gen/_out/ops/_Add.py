from marketsim.ops._all import Observable
from marketsim import IFunction
from marketsim.gen._intrinsic.ops import _Add_Impl
from marketsim import registry
from marketsim import float
@registry.expose(["Ops", "Add"])
class Add_IFunctionFloatIFunctionFloat(Observable[float],_Add_Impl):
    """ 
    """ 
    def __init__(self, x = None, y = None):
        from marketsim import types
        from marketsim.ops._all import Observable
        from marketsim import rtti
        from marketsim import event
        from marketsim.gen._out._constant import constant as _constant
        from marketsim import float
        Observable[float].__init__(self)
        self.x = x if x is not None else _constant(1.0)
        if isinstance(x, types.IEvent):
            event.subscribe(self.x, self.fire, self)
        self.y = y if y is not None else _constant(1.0)
        if isinstance(y, types.IEvent):
            event.subscribe(self.y, self.fire, self)
        rtti.check_fields(self)
        _Add_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : IFunction[float],
        'y' : IFunction[float]
    }
    def __repr__(self):
        return "({%(x)s}+{%(y)s})" % self.__dict__
    
def Add(x = None,y = None): 
    from marketsim import IFunction
    from marketsim import float
    from marketsim import rtti
    if x is None or rtti.can_be_casted(x, IFunction[float]):
        if y is None or rtti.can_be_casted(y, IFunction[float]):
            return Add_IFunctionFloatIFunctionFloat(x,y)
    raise Exception("Cannot find suitable overload")