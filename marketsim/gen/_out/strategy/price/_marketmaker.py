# generated with class generator.python.constructor$Import
from marketsim import registry
@registry.expose(["-", "MarketMaker"])
class MarketMaker_FloatFloat(object):
    """ 
    """ 
    def __init__(self, delta = None, volume = None):
        from marketsim import rtti
        self.delta = delta if delta is not None else 1.0
        self.volume = volume if volume is not None else 20.0
        rtti.check_fields(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'delta' : float,
        'volume' : float
    }
    
    
    
    
    def __repr__(self):
        return "MarketMaker(%(delta)s, %(volume)s)" % dict([ (name, getattr(self, name)) for name in self._properties.iterkeys() ])
    
    def bind_ex(self, ctx):
        if hasattr(self, '_bound_ex'): return
        self._bound_ex = True
        if getattr(self, '_processing_ex', False):
            raise Exception('cycle detected')
        self._processing_ex = True
        
        
        if hasattr(self, '_subscriptions'):
            for s in self._subscriptions: s.bind_ex(self._ctx_ex)
        self._processing_ex = False
    

    def OneSide(self, side = None,sign = None):
        from marketsim.gen._out.strategy.price._oneside import OneSide
        return OneSide(self,side,sign)
    
    @property
    def Delta(self):
        from marketsim.gen._out.strategy.price._delta import Delta
        return Delta(self)
    
    @property
    def TwoSides(self):
        from marketsim.gen._out.strategy.price._twosides import TwoSides
        return TwoSides(self)
    
    @property
    def Volume(self):
        from marketsim.gen._out.strategy.price._volume import Volume
        return Volume(self)
    
    pass
MarketMaker = MarketMaker_FloatFloat
