# generated with class generator.python.constructor$Import
from marketsim import registry
from marketsim.gen._out.strategy.side._signalstrategy import SignalStrategy
from marketsim.gen._out._iorderbook import IOrderBook
@registry.expose(["-", "CrossingAverages"])
class CrossingAverages_FloatFloatFloatIOrderBook(SignalStrategy):
    """ 
    """ 
    def __init__(self, alpha_1 = None, alpha_2 = None, threshold = None, book = None):
        from marketsim.gen._out.orderbook._oftrader import OfTrader_IAccount as _orderbook_OfTrader_IAccount
        from marketsim import deref_opt
        self.alpha_1 = alpha_1 if alpha_1 is not None else 0.15
        self.alpha_2 = alpha_2 if alpha_2 is not None else 0.015
        self.threshold = threshold if threshold is not None else 0.0
        self.book = book if book is not None else deref_opt(_orderbook_OfTrader_IAccount())
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'alpha_1' : float,
        'alpha_2' : float,
        'threshold' : float,
        'book' : IOrderBook
    }
    
    
    
    
    
    
    
    
    def __repr__(self):
        return "CrossingAverages(%(alpha_1)s, %(alpha_2)s, %(threshold)s, %(book)s)" % dict([ (name, getattr(self, name)) for name in self._properties.iterkeys() ])
    
    def bind_ex(self, ctx):
        if self.__dict__.get('_bound_ex', False): return
        self.__dict__['_bound_ex'] = True
        if self.__dict__.get('_processing_ex', False):
            raise Exception('cycle detected')
        self.__dict__['_processing_ex'] = True
        self.__dict__['_ctx_ex'] = ctx.updatedFrom(self)
        self.book.bind_ex(self._ctx_ex)
        if hasattr(self, '_subscriptions'):
            for s in self._subscriptions: s.bind_ex(self.__dict__['_ctx_ex'])
        self.__dict__['_processing_ex'] = False
    
    def reset_ex(self, generation):
        if self.__dict__.get('_reset_generation_ex', -1) == generation: return
        self.__dict__['_reset_generation_ex'] = generation
        if self.__dict__.get('_processing_ex', False):
            raise Exception('cycle detected')
        self.__dict__['_processing_ex'] = True
        
        self.book.reset_ex(generation)
        if hasattr(self, '_subscriptions'):
            for s in self._subscriptions: s.reset_ex(generation)
        self.__dict__['_processing_ex'] = False
    
    def typecheck(self):
        from marketsim import rtti
        from marketsim.gen._out._iorderbook import IOrderBook
        rtti.typecheck(float, self.alpha_1)
        rtti.typecheck(float, self.alpha_2)
        rtti.typecheck(float, self.threshold)
        rtti.typecheck(IOrderBook, self.book)
    
    def registerIn(self, registry):
        if self.__dict__.get('_id', False): return
        self.__dict__['_id'] = True
        if self.__dict__.get('_processing_ex', False):
            raise Exception('cycle detected')
        self.__dict__['_processing_ex'] = True
        registry.insert(self)
        self.book.registerIn(registry)
        if hasattr(self, '_subscriptions'):
            for s in self._subscriptions: s.registerIn(registry)
        self.__dict__['_processing_ex'] = False
    

    @property
    def Threshold(self):
        from marketsim.gen._out.strategy.side._threshold import Threshold
        return Threshold(self)
    
    @property
    def Side(self):
        from marketsim.gen._out.strategy.side._side import Side
        return Side(self)
    
    def Strategy(self, eventGen = None,orderFactory = None):
        from marketsim.gen._out.strategy.side._strategy import Strategy
        return Strategy(self,eventGen,orderFactory)
    
    @property
    def Book(self):
        from marketsim.gen._out.strategy.side._book import Book
        return Book(self)
    
    @property
    def Alpha_2(self):
        from marketsim.gen._out.strategy.side._alpha_2 import Alpha_2
        return Alpha_2(self)
    
    @property
    def Signal_Value(self):
        from marketsim.gen._out.strategy.side._signal_value import Signal_Value
        return Signal_Value(self)
    
    @property
    def Alpha_1(self):
        from marketsim.gen._out.strategy.side._alpha_1 import Alpha_1
        return Alpha_1(self)
    
    pass
CrossingAverages = CrossingAverages_FloatFloatFloatIOrderBook
