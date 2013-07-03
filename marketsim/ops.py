from marketsim import meta, Side, types, registry, getLabel

def convert(other):
    if type(other) in [int, float]:
        other = constant(other)
    return other

class FloatFunction(types.IFunction[float]):
    
    T = float
    
    def __add__(self, other):
        return Sum(self, convert(other))
    
    def __sub__(self, other):
        return Sub(self, convert(other))
    
    def __mul__(self, other):
        return Product(self, convert(other))
    
    def __div__(self, other):
        return Div(self, convert(other))
    
    def __lt__(self, other):
        return less(self, convert(other))
    
    def __gt__(self, other):
        return greater(self, convert(other))
    
    def __eq__(self, other):
        return equal(self, convert(other))
    
    def __ne__(self, other):
        return notequal(self, convert(other))
    
class IntFunction(object):
    T = int
    

class BoolFunction(object):
    T = bool
    

class SideFunction(object):
    T = Side
    
    

IntFunction._types = [types.function((), int)]
BoolFunction._types = [types.function((), bool)]
SideFunction._types = [types.function((), Side)]

Function = { float : FloatFunction, 
             int   : IntFunction, 
             bool  : BoolFunction,
             Side  : SideFunction }

binary_base_tmpl = """
class _BinaryOp_%(T)s(object):

    def __init__(self, lhs, rhs):
        self.lhs = lhs
        self.rhs = rhs

    _properties = [('lhs', meta.function((), %(T)s)), 
                   ('rhs', meta.function((), %(T)s))]
                   
BinaryOp[%(T)s] = _BinaryOp_%(T)s
"""

BinaryOp = {}

for T in ['float']:
    exec binary_base_tmpl % { 'T': T }
    
#---------------------------------------------- Condition 
        
class Condition_Impl(object):
    
    def __init__(self, cond, ifpart, elsepart):
        self.cond = cond
        self.ifpart = ifpart
        self.elsepart = elsepart
        
    def __call__(self):
        c = self.cond()
        return None if c is None else self.ifpart() if c else self.elsepart()

condition_tmpl = """
class Condition%(T)s(Condition_Impl, Function[%(T)s]):

    def __init__(self, cond, ifpart, elsepart):
        Condition_Impl.__init__(self, cond, ifpart, elsepart)
        self._alias = ['Condition[%(T)s]']
        
    _types = [meta.function((), %(T)s)]
        
    _properties = [('cond', meta.function((), bool)), 
                   ('ifpart', meta.function((), %(T)s)), 
                   ('elsepart', meta.function((), %(T)s))]
                   
Condition[%(T)s] = Condition%(T)s
"""  

Condition = {}

for t in ['Side', 'float']:
    exec condition_tmpl % { 'T' : t }   

class _Conditional_Base(Function[bool]):
    
    def __getitem__(self, (ifpart, elsepart)):
        return Condition[self.BranchType](self, ifpart, elsepart)

# ---------------------------------------------------- Equal

class _Equal_Impl(_Conditional_Base):
    
    def __call__(self):
        lhs = self.lhs()
        rhs = self.rhs()
        return self.lhs() == self.rhs()

_equal_tmpl = """        
class Equal_%(T)s(_BinaryOp_%(T)s, _Equal_Impl):

    BranchType = %(T)s

Equal[%(T)s] = Equal_%(T)s
"""

Equal = {}

for T in ["float"]:
    exec _equal_tmpl % { 'T' : T }

def equal(lhs, rhs):
    if 'T' in dir(lhs):
        if 'T' in dir(rhs):
            assert lhs.T == rhs.T
        return Equal[lhs.T](lhs, rhs)
    if 'T' in dir(rhs):
        return Equal[rhs.T](lhs, rhs)
    raise "Cannot inference T for equal(" + repr(lhs) + ',' + repr(rhs) + ')'
        
# ---------------------------------------------------- NotEqual

class _NotEqual_Impl(_Conditional_Base):
    
    def __call__(self):
        return self.lhs() != self.rhs()

_notequal_tmpl = """        
class NotEqual_%(T)s(_BinaryOp_%(T)s, _NotEqual_Impl):

    BranchType = %(T)s

NotEqual[%(T)s] = NotEqual_%(T)s
"""

NotEqual = {}

for T in ["float"]:
    exec _notequal_tmpl % { 'T' : T }

def notequal(lhs, rhs):
    if 'T' in dir(lhs):
        if 'T' in dir(rhs):
            assert lhs.T == rhs.T
        return NotEqual[lhs.T](lhs, rhs)
    if 'T' in dir(rhs):
        return NotEqual[rhs.T](lhs, rhs)
    raise "Cannot inference T for notequal(" + repr(lhs) + ',' + repr(rhs) + ')'
        
# ---------------------------------------------------- Greater

class _Greater_Impl(_Conditional_Base):
    
    def __call__(self):
        return self.lhs() > self.rhs()

_greater_tmpl = """        
class Greater_%(T)s(_BinaryOp_%(T)s, _Greater_Impl):

    BranchType = %(T)s

Greater[%(T)s] = Greater_%(T)s
"""

Greater = {}

for T in ["float"]:
    exec _greater_tmpl % { 'T' : T }

def greater(lhs, rhs):
    if 'T' in dir(lhs):
        if 'T' in dir(rhs):
            assert lhs.T == rhs.T
        return Greater[lhs.T](lhs, rhs)
    if 'T' in dir(rhs):
        return Greater[rhs.T](lhs, rhs)
    raise "Cannot inference T for greater(" + repr(lhs) + ',' + repr(rhs) + ')'
    
# ---------------------------------------------------- Less

class _Less_Impl(_Conditional_Base):
    
    def __call__(self):
        return self.lhs() < self.rhs()

_less_tmpl = """        
class Less_%(T)s(_BinaryOp_%(T)s, _Less_Impl):
    
    BranchType = %(T)s

Less[%(T)s] = Less_%(T)s
"""

Less = {}

for T in ["float"]:
    exec _less_tmpl % { 'T' : T }

def less(lhs, rhs):
    if 'T' in dir(lhs):
        if 'T' in dir(rhs):
            assert lhs.T == rhs.T
        return Less[lhs.T](lhs, rhs)
    if 'T' in dir(rhs):
        return Less[rhs.T](lhs, rhs)
    raise "Cannot inference T for less(" + repr(lhs) + ',' + repr(rhs) + ')'
    
# ---------------------------------------------------- Constant

class _None_Impl(object):
    
    def __call__(self):
        return None

_none_tmpl = """
class _None_%(T)s(_None_Impl, Function[%(T)s]):
    pass
    
_None[%(T)s] = _None_%(T)s
"""

_None = {}

for T in ["Side", "float"]:
    exec _none_tmpl % { 'T' : T }
    
# ---------------------------------------------------- Constant

class _Constant_Impl(object):
    """ Constant function returning **value**.
    """
    
    def _casts_to(self, dst):
        if type(dst) is meta.function:
            rv = dst.rv
            return rv is float or\
                (type(rv) is meta.greater_or_equal and rv._bound <= self.value) or\
                (type(rv) is meta.greater_than and rv._bound < self.value) or\
                (type(rv) is meta.less_or_equal and rv._bound >= self.value) or\
                (type(rv) is meta.less_than and rv._bound > self.value)
        return False 
        
    def __call__(self, *args, **kwargs):
        return self.value
    
    @property
    def label(self):
        return "C=" + str(self.value)
    
    def __repr__(self):
        return "constant("+repr(self.value)+")"

_constant_tmpl = """    
@registry.expose(['Constant[%(T)s]'])
class Constant_%(T)s(_Constant_Impl, Function[%(T)s]):
    \""" Constant function returning **value**.
    \"""
    
    def __init__(self, value=%(defvalue)s):
        self.value = value
        
    _properties = {'value' : %(T)s}
    
Constant[%(T)s] = Constant_%(T)s
"""

Constant = {}
for T,defvalue in {'float'  : '100.', 
                   'int'    : '100', 
                   'Side'   : 'Side.Sell'  
                  }.iteritems():
    exec _constant_tmpl % { 'T' : T, 'defvalue' : defvalue }

def constant(x):
    return Constant_float(x) if type(x) is float\
        else Constant_float(x) if type(x) is int\
        else Constant_Side(x) if x is Side.Sell or x is Side.Buy\
        else None    


@registry.expose(['Arithmetic', 'negate'])
class negate(Function[float]):
    """ Function returning Product of the operands
    """
    
    def __init__(self, arg=constant(1.)):
        self.arg = arg
        
    _properties = { "arg" : types.IFunction[float] }
    
    def __call__(self, *args, **kwargs):
        x = self.arg()
        return -x if x is not None else None
    
    def __repr__(self):
        return "-" + repr(self.arg)

@registry.expose(['Arithmetic', 'identity'])
class identity(Function[float]):
    
    def __init__(self, arg=constant(1.)):
        self.arg = arg
        
    _properties = { "arg" : types.IFunction[float] }
    
    def __call__(self, *args, **kwargs):
        return self.arg()
    
    def __repr__(self):
        return "id(" + repr(self.arg) + ")"

@registry.expose(['Arithmetic', '*'], args = (constant(1.), constant(1.)))
class Product(BinaryOp[float], Function[float]):
    """ Function returning product of the operands
    """
    
    def __call__(self, *args, **kwargs):
        lhs = self.lhs()
        rhs = self.rhs()
        return lhs * rhs if lhs is not None and rhs is not None else None
    
    def __repr__(self):
        return repr(self.lhs)+ "*" + repr(self.rhs)

@registry.expose(['Arithmetic', '+'], args = (constant(1.), constant(1.)))    
class Sum(BinaryOp[float], Function[float]):
    """ Function returning Sum of the operands
    """
    
    def __call__(self, *args, **kwargs):
        lhs = self.lhs()
        rhs = self.rhs()
        return lhs + rhs if lhs is not None and rhs is not None else None
    
    def __repr__(self):
        return repr(self.lhs)+ "+" + repr(self.rhs)

@registry.expose(['Arithmetic', '/'], args = (constant(1.), constant(1.)))
class Div(BinaryOp[float], Function[float]):
    """ Function returning division of the operands
    """
    def __call__(self, *args, **kwargs):
        lhs = self.lhs()
        rhs = self.rhs()
        return lhs / rhs if lhs is not None and rhs is not None and rhs != 0 else None
    
    def __repr__(self):
        return repr(self.lhs)+ "/" + repr(self.rhs)

@registry.expose(['Arithmetic', '-'], args = (constant(1.), constant(1.)))    
class Sub(BinaryOp[float], Function[float]):
    """ Function substructing the right operand from the left one
    """
    
    def __call__(self, *args, **kwargs):
        lhs = self.lhs()
        rhs = self.rhs()
        return lhs - rhs if lhs is not None and rhs is not None else None
    
    def __repr__(self):
        return repr(self.lhs)+ "-" + repr(self.rhs)

class Derivative(Function[float]):
    
    def __init__(self, source):
        self.source = source
        
    _properties = { 'source' : types.IDifferentiable }
    
    @property
    def label(self):
        return '\\frac{' + getLabel(self.source) + '}{dt}'
        
    def __call__(self):
        return self.source.derivative()
   