// >>> filter(lambda s: not s.startswith("_"), dir(1))
//   bit_length
//   conjugate
//   denominator
//   imag
//   numerator
//   real

extension Int : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }
}
