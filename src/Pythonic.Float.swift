import Darwin

extension Float : LogicValue {
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