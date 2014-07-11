// >>> filter(lambda s: not s.startswith("_"), dir([]))
//   append: Already in Swift.
//   count: Added.
//   extend: Already in Swift.
//   index: Added.
//   insert: Failed to add. (TODO)
//   pop: Added, but due to a compiler bug it must be defined in test file for tests to pass.
//   remove: Added.
//   reverse: Added as "reverseInPlace" to avoid name collission with built-in Array.reverse.
//   sort: Failed to add. Name collission with built-in Array.sort. (TODO)

extension Array : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }

    mutating func clear() {
        self.removeAll()
    }

    mutating func reverseInPlace() {
        var newArrayElements = Array(self.reverse())
        self.clear()
        for element in newArrayElements {
            self.append(element)
        }
    }

    func count<T where T : Equatable>(element: T) -> Int {
        if element is Array.Element {
            return Swift.countElements(Swift.filter(Swift.reinterpretCast(self) as Array<T>, { $0 == element }))
        }
        return 0
    }

    mutating func remove<T where T : Equatable>(element: T) {
        if let i = index(element) {
            self.removeAtIndex(i)
        }
    }

    func index<T where T : Equatable>(element: T) -> Int? {
        if element is Array.Element {
            if let idx = Swift.find(Swift.reinterpretCast(self) as Array<T>, element) {
                return idx
            }
        }
        return nil
    }
}
