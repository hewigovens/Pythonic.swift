extension Dictionary : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }

    func get(key: KeyType) -> ValueType? {
        return self[key]
    }
}
