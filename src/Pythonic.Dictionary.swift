extension Dictionary : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }

    mutating func clear() {
        self.removeAll()
    }

    func get(key: KeyType) -> ValueType? {
        return self[key]
    }
}
