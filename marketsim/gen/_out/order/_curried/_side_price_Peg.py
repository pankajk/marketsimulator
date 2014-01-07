from marketsim import registry
from marketsim import IOrderGenerator
from marketsim import IFunction
from marketsim import IFunction
from marketsim import types
from marketsim import Side
from marketsim import IFunction
from marketsim import IOrderGenerator
from marketsim import IFunction
from marketsim import types
from marketsim import Side
@registry.expose(["Order", "Peg"])
class side_price_Peg(IFunction[IFunction[IOrderGenerator, IFunction[float]], types.IFunction[Side]
]):
    """ 
    """ 
    def __init__(self, proto = None):
        from marketsim.gen._out.order._curried._side_price_Limit import side_price_Limit
        self.proto = proto if proto is not None else side_price_Limit()
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'proto' : IFunction[IFunction[IOrderGenerator, IFunction[float]], types.IFunction[Side]
        ]
    }
    def __repr__(self):
        return "side_price_Peg(%(proto)s)" % self.__dict__
    
    def __call__(self, side = None):
        from marketsim.gen._out.order._curried._price_Peg import price_Peg
        proto = self.proto
        return price_Peg(proto(side))
    