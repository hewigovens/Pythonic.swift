extension Dictionary : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }

    func get(key: KeyType) -> ValueType? {
        return self[key]
    }

    func has_key(key: KeyType) -> Bool {
        return self.get(key).getLogicValue()
    }
}
