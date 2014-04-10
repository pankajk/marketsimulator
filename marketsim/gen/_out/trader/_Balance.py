from marketsim import registry
from marketsim.gen._out._observable._observablefloat import Observablefloat
from marketsim.gen._intrinsic.trader.props import Balance_Impl
from marketsim.gen._out._iaccount import IAccount
@registry.expose(["Trader", "Balance"])
class Balance_IAccount(Observablefloat,Balance_Impl):
    """ **Number of money owned by trader**
    
    
    Parameters are:
    
    **trader**
    """ 
    def __init__(self, trader = None):
        from marketsim.gen._out._observable._observablefloat import Observablefloat
        from marketsim.gen._out.trader._singleproxy import SingleProxy_ as _trader_SingleProxy_
        from marketsim import deref_opt
        from marketsim import rtti
        Observablefloat.__init__(self)
        self.trader = trader if trader is not None else deref_opt(_trader_SingleProxy_())
        rtti.check_fields(self)
        Balance_Impl.__init__(self)
    
    @property
    def label(self):
        return repr(self)
    
    _properties = {
        'trader' : IAccount
    }
    
    
    
    def __repr__(self):
        return "Balance(%(trader)s)" % dict([ (name, getattr(self, name)) for name in self._properties.iterkeys() ])
    
    def bind_ex(self, ctx):
        if hasattr(self, '_processing_ex'):
            raise Exception('cycle detected')
        setattr(self, '_processing_ex', True)
        self._ctx_ex = self.updateContext_ex(ctx) if hasattr(self, 'updateContext_ex') else ctx
        if hasattr(self, 'bind_impl'): self.bind_impl(self._ctx_ex)
        self.trader.bindEx(self._ctx_ex)
        delattr(self, '_processing_ex')
    
def Balance(trader = None): 
    from marketsim.gen._out._iaccount import IAccount
    from marketsim import rtti
    if trader is None or rtti.can_be_casted(trader, IAccount):
        return Balance_IAccount(trader)
    raise Exception('Cannot find suitable overload for Balance('+str(trader) +':'+ str(type(trader))+')')
