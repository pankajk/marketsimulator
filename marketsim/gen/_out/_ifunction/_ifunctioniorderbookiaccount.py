from marketsim.gen._out._iaccount import IAccount
from marketsim.gen._out._iorderbook import IOrderBook
from marketsim import meta
class IFunctionIOrderBookIAccount(object):
    _types = [meta.function((IAccount,),IOrderBook)]
    pass



