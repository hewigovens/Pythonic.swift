extension Float : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }
}
