extension Array : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
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
