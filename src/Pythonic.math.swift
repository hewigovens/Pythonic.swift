// Python docs: https://docs.python.org/2/library/math.html
//
// Most frequently used:
//   24 math.ceil
//   13 math.log
//   11 math.floor
//    9 math.sqrt
//    9 math.cos
//    6 math.sin
//    4 math.pi
//    3 math.radians
//    2 math.exp
//    1 math.pow
//
// >>> filter(lambda s: not s.startswith("_"), dir(math))
//   acos: Added.
//   acosh: Added.
//   asin: Added.
//   asinh: Added.
//   atan: Added.
//   atan2: Added.
//   atanh: Added.
//   ceil: Added.
//   copysign: Added.
//   cos: Added.
//   cosh: Added.
//   degrees: TODO.
//   e: Added.
//   erf: Added.
//   erfc: Added.
//   exp: Added.
//   expm1: Added.
//   fabs: Added.
//   factorial: TODO.
//   floor: Added.
//   fmod: Added.
//   frexp: TODO.
//   fsum: TODO.
//   gamma: TODO.
//   hypot: Added.
//   isinf: TODO.
//   isnan: TODO.
//   ldexp: Added.
//   lgamma: Added.
//   log: Added.
//   log10: Added.
//   log1p: Added.
//   modf: TODO.
//   pi: Added.
//   pow: Added.
//   radians: TODO.
//   sin: Added.
//   sinh: Added.
//   sqrt: Added.
//   tan: Added.
//   tanh: Added.
//   trunc: Added.

import Foundation

public class math {
    let e = 2.718281828459045
    let pi = 3.141592653589793

    public class func acos(arg1: Double) -> Double {
        return Darwin.acos(arg1)
    }

    public class func acosh(arg1: Double) -> Double {
        return Darwin.acosh(arg1)
    }

    public class func asin(arg1: Double) -> Double {
        return Darwin.asin(arg1)
    }

    public class func asinh(arg1: Double) -> Double {
        return Darwin.asinh(arg1)
    }

    public class func atan(arg1: Double) -> Double {
        return Darwin.atan(arg1)
    }

    public class func atan2(arg1: Double, _ arg2: Double) -> Double {
        return Darwin.atan2(arg1, arg2)
    }

    public class func atanh(arg1: Double) -> Double {
        return Darwin.atanh(arg1)
    }

    public class func ceil(arg1: Double) -> Double {
        return Darwin.ceil(arg1)
    }

    public class func copysign(arg1: Double, _ arg2: Double) -> Double {
        return Darwin.copysign(arg1, arg2)
    }

    public class func cos(arg1: Double) -> Double {
        return Darwin.cos(arg1)
    }

    public class func cosh(arg1: Double) -> Double {
        return Darwin.cosh(arg1)
    }

    public class func erf(arg1: Double) -> Double {
        return Darwin.erf(arg1)
    }

    public class func erfc(arg1: Double) -> Double {
        return Darwin.erfc(arg1)
    }

    public class func exp(arg1: Double) -> Double {
        return Darwin.exp(arg1)
    }

    public class func expm1(arg1: Double) -> Double {
        return Darwin.expm1(arg1)
    }

    public class func fabs(arg1: Double) -> Double {
        return Darwin.fabs(arg1)
    }

    public class func floor(arg1: Double) -> Double {
        return Darwin.floor(arg1)
    }

    public class func fmod(arg1: Double, _ arg2: Double) -> Double {
        return Darwin.fmod(arg1, arg2)
    }

    public class func hypot(arg1: Double, _ arg2: Double) -> Double {
        return Darwin.hypot(arg1, arg2)
    }

    public class func ldexp(arg1: Double, arg2: CInt) -> Double {
        return Darwin.ldexp(arg1, arg2)
    }

    public class func lgamma(arg1: Double) -> Double {
        return Darwin.lgamma(arg1)
    }

    public class func log(arg1: Double) -> Double {
        return Darwin.log(arg1)
    }

    public class func log10(arg1: Double) -> Double {
        return Darwin.log10(arg1)
    }

    public class func log1p(arg1: Double) -> Double {
        return Darwin.log1p(arg1)
    }

    public class func pow(arg1: Double, _ arg2: Double) -> Double {
        return arg1 ** arg2
    }

    public class func sin(arg1: Double) -> Double {
        return Darwin.sin(arg1)
    }

    public class func sinh(arg1: Double) -> Double {
        return Darwin.sinh(arg1)
    }

    public class func sqrt(arg1: Double) -> Double {
        return Darwin.sqrt(arg1)
    }

    public class func tan(arg1: Double) -> Double {
        return Darwin.tan(arg1)
    }

    public class func tanh(arg1: Double) -> Double {
        return Darwin.tanh(arg1)
    }

    public class func trunc(arg1: Double) -> Double {
        return Darwin.trunc(arg1)
    }
}
