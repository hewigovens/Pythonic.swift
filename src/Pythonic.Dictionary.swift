// >>> filter(lambda s: not s.startswith("_"), dir({}))
//   clear
//   copy
//   fromkeys
//   get
//   has_key
//   items
//   iteritems
//   iterkeys
//   itervalues
//   keys
//   pop
//   popitem
//   setdefault
//   update
//   values
//   viewitems
//   viewkeys
//   viewvalues

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

    func has_key(key: KeyType) -> Bool {
        return self.get(key).getLogicValue()
    }

    mutating func pop(key: KeyType) -> ValueType? {
        if self.has_key(key) {
            var val: ValueType! = self.get(key)
            self.removeValueForKey(key)

            return val
        }
        return nil
    }

    mutating func popitem() -> (KeyType, ValueType)? {
        if self.count == 0 {
            return nil
        }

        var key: KeyType! = Array(self.keys)[0]
        var value: ValueType! = self.get(key)

        self.pop(key)
        return (key, value)
    }
}
