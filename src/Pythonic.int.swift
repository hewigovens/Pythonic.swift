// >>> filter(lambda s: not s.startswith("_"), dir(1))
//   bit_length
//   conjugate
//   denominator
//   imag
//   numerator
//   real

import Foundation

public typealias int = Swift.Int

extension Int : LogicValue {
    public func getLogicValue() -> Bool {
        return self != 0
    }
}
