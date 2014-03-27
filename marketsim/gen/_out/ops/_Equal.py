from marketsim import registry
from marketsim.gen._out._observable._observablebool import Observablebool
from marketsim.gen._intrinsic.ops import Equal_Impl
from marketsim.gen._out._iobservable._iobservablefloat import IObservablefloat
@registry.expose(["Ops", "Equal"])
class Equal_IObservableFloatIObservableFloat(Observablebool,Equal_Impl):
    """ 
    """ 
    def __init__(self, x = None, y = None):
        from marketsim import deref_opt
        from marketsim import rtti
        from marketsim.gen._out._const import const_Float as _const_Float
        from marketsim import event
        from marketsim.gen._out._observable._observablebool import Observablebool
        Observablebool.__init__(self)
        self.x = x if x is not None else deref_opt(_const_Float(1.0))
        event.subscribe(self.x, self.fire, self)
        self.y = y if y is not None else deref_opt(_const_Float(1.0))
        event.subscribe(self.y, self.fire, self)
        rtti.check_fields(self)
        Equal_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : IObservablefloat,
        'y' : IObservablefloat
    }
    
    
    
    
    def __repr__(self):
        return "({%(x)s}=={%(y)s})" % { name : getattr(self, name) for name in self._properties.iterkeys() }
    
from marketsim.gen._out._ifunction._ifunctionfloat import IFunctionfloat
from marketsim.gen._out._observable._observablebool import Observablebool
from marketsim.gen._intrinsic.ops import Equal_Impl
from marketsim.gen._out._iobservable._iobservablefloat import IObservablefloat
from marketsim import registry
@registry.expose(["Ops", "Equal"])
class Equal_FloatIObservableFloat(Observablebool,Equal_Impl):
    """ 
    """ 
    def __init__(self, x = None, y = None):
        from marketsim import deref_opt
        from marketsim import rtti
        from marketsim.gen._out._constant import constant_Float as _constant_Float
        from marketsim.gen._out._const import const_Float as _const_Float
        from marketsim import event
        from marketsim.gen._out._observable._observablebool import Observablebool
        Observablebool.__init__(self)
        self.x = x if x is not None else deref_opt(_constant_Float(1.0))
        
        self.y = y if y is not None else deref_opt(_const_Float(1.0))
        event.subscribe(self.y, self.fire, self)
        rtti.check_fields(self)
        Equal_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : IFunctionfloat,
        'y' : IObservablefloat
    }
    
    
    
    
    def __repr__(self):
        return "({%(x)s}=={%(y)s})" % { name : getattr(self, name) for name in self._properties.iterkeys() }
    
from marketsim.gen._out._ifunction._ifunctionfloat import IFunctionfloat
from marketsim.gen._out._observable._observablebool import Observablebool
from marketsim.gen._intrinsic.ops import Equal_Impl
from marketsim.gen._out._iobservable._iobservablefloat import IObservablefloat
from marketsim import registry
@registry.expose(["Ops", "Equal"])
class Equal_IObservableFloatFloat(Observablebool,Equal_Impl):
    """ 
    """ 
    def __init__(self, x = None, y = None):
        from marketsim import deref_opt
        from marketsim import rtti
        from marketsim.gen._out._constant import constant_Float as _constant_Float
        from marketsim.gen._out._const import const_Float as _const_Float
        from marketsim import event
        from marketsim.gen._out._observable._observablebool import Observablebool
        Observablebool.__init__(self)
        self.x = x if x is not None else deref_opt(_const_Float(1.0))
        event.subscribe(self.x, self.fire, self)
        self.y = y if y is not None else deref_opt(_constant_Float(1.0))
        
        rtti.check_fields(self)
        Equal_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : IObservablefloat,
        'y' : IFunctionfloat
    }
    
    
    
    
    def __repr__(self):
        return "({%(x)s}=={%(y)s})" % { name : getattr(self, name) for name in self._properties.iterkeys() }
    
from marketsim import registry
from marketsim.gen._out._observable._observablebool import Observablebool
from marketsim.gen._intrinsic.ops import Equal_Impl
from marketsim.gen._out._ifunction._ifunctionfloat import IFunctionfloat
@registry.expose(["Ops", "Equal"])
class Equal_FloatFloat(Observablebool,Equal_Impl):
    """ 
    """ 
    def __init__(self, x = None, y = None):
        from marketsim.gen._out._observable._observablebool import Observablebool
        from marketsim.gen._out._constant import constant_Float as _constant_Float
        from marketsim import deref_opt
        from marketsim import rtti
        Observablebool.__init__(self)
        self.x = x if x is not None else deref_opt(_constant_Float(1.0))
        
        self.y = y if y is not None else deref_opt(_constant_Float(1.0))
        
        rtti.check_fields(self)
        Equal_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'x' : IFunctionfloat,
        'y' : IFunctionfloat
    }
    
    
    
    
    def __repr__(self):
        return "({%(x)s}=={%(y)s})" % { name : getattr(self, name) for name in self._properties.iterkeys() }
    
def Equal(x = None,y = None): 
    from marketsim.gen._out._iobservable._iobservablefloat import IObservablefloat
    from marketsim.gen._out._ifunction._ifunctionfloat import IFunctionfloat
    from marketsim import rtti
    if x is None or rtti.can_be_casted(x, IObservablefloat):
        if y is None or rtti.can_be_casted(y, IObservablefloat):
            return Equal_IObservableFloatIObservableFloat(x,y)
    if x is None or rtti.can_be_casted(x, IFunctionfloat):
        if y is None or rtti.can_be_casted(y, IObservablefloat):
            return Equal_FloatIObservableFloat(x,y)
    if x is None or rtti.can_be_casted(x, IObservablefloat):
        if y is None or rtti.can_be_casted(y, IFunctionfloat):
            return Equal_IObservableFloatFloat(x,y)
    if x is None or rtti.can_be_casted(x, IFunctionfloat):
        if y is None or rtti.can_be_casted(y, IFunctionfloat):
            return Equal_FloatFloat(x,y)
    raise Exception('Cannot find suitable overload for Equal('+str(x) +':'+ str(type(x))+','+str(y) +':'+ str(type(y))+')')
