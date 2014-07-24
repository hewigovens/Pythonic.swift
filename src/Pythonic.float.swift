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

public typealias float = Swift.Double

extension Double : LogicValue {
    public func getLogicValue() -> Bool {
        return self != 0
    }

    public func isInteger() -> Bool {
        return floor(self) == self
    }

    public func is_integer() -> Bool {
        return self.isInteger()
    }
}

extension Float : LogicValue {
    public func getLogicValue() -> Bool {
        return self != 0
    }

    public func isInteger() -> Bool {
        return Darwin.floor(self) == self
    }

    public func is_integer() -> Bool {
        return self.isInteger()
    }
}
