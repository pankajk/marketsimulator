from marketsim import registry
from marketsim import IFunction
from marketsim import IOrderGenerator
from marketsim import IFunction
from marketsim import IOrderGenerator
from marketsim import IFunction
@registry.expose(["Order", "ImmediateOrCancel"])
class price_ImmediateOrCancel(

IFunction[IOrderGenerator,IFunction[float]]):
    """ 
    """ 
    def __init__(self, proto = None):
        from marketsim.gen._out.order._curried._price_Limit import price_Limit as _order__curried_price_Limit
        from marketsim import rtti
        self.proto = proto if proto is not None else _order__curried_price_Limit()
        rtti.check_fields(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'proto' : IFunction[IOrderGenerator, IFunction[float]]
    }
    def __repr__(self):
        return "price_ImmediateOrCancel(%(proto)s)" % self.__dict__
    
    def __call__(self, price = None):
        from marketsim.gen._out.order._ImmediateOrCancel import ImmediateOrCancel
        proto = self.proto
        return ImmediateOrCancel(proto(price))
    
