package mathops

/** Exponent of x
  *
  */
@python.mathops("Log/Pow", "exp", "e^{%(x)s}")
@category = "Log/Pow"
def Exp(x = constant(1.0)) => Float

/** Natural logarithm of x (to base e)
 *
 */
@python.mathops("Log/Pow", "log", "log(%(x)s)")
@category = "Log/Pow"
def Log(x = constant(1.0)) => Float

/** Square root of x
 *
 */
@python.mathops("Log/Pow", "sqrt", "\\sqrt{%(x)s}")
@category = "Log/Pow"
def Sqrt(x = constant(1.0)) => Float

/** Return *x* raised to the power *y*.
  *
  * Exceptional cases follow Annex F of the C99 standard as far as possible.
  * In particular, ``pow(1.0, x)`` and ``pow(x, 0.0)`` always return 1.0,
  * even when *x* is a zero or a NaN.
  * If both *x* and *y* are finite, *x* is negative, and *y* is not an integer then
  * ``pow(x, y)`` is undefined, and raises ``ValueError``.
  */
@python.mathops("Log/Pow", "pow", "%(base)s^{%(power)s}")
@category = "Log/Pow"
def Pow(base = constant(1.0), power = constant(1.0)) => Float

/** Arc tangent of x, in radians.
 *
 */
@python.mathops("Trigonometric", "atan", "atan(%(x)s)")
@category = "Trigonometric"
def Atan(x = constant(0.0)) => Float
