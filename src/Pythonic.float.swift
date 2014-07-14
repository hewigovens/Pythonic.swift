// Python docs: https://docs.python.org/2/library/stdtypes.html
//
// >>> filter(lambda s: not s.startswith("_"), dir(1.1))
//   as_integer_ratio
//   conjugate
//   fromhex
//   hex
//   imag
//   is_integer: Implemented.
//   real

import Foundation

typealias float = Swift.Double

extension Double : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }

    func isInteger() -> Bool {
        return floor(self) == self
    }

    func is_integer() -> Bool {
        return self.isInteger()
    }
}

extension Float : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }

    func isInteger() -> Bool {
        return Darwin.floor(self) == self
    }

    func is_integer() -> Bool {
        return self.isInteger()
    }
}
