class Set<T: Hashable> : ArrayLiteralConvertible, Collection, Comparable, Equatable, ExtensibleCollection, Hashable, LogicValue, Printable, Sequence {
    var _internalDict = Dictionary<T, T>()

    init() {
    }

    init(_ initialArray: [T]) {
        self.extend(initialArray)
    }

    init(_ initialSet: Set<T>) {
        self.extend(initialSet)
    }

    func contains(element: T) -> Bool {
        return self._internalDict[element] != nil
    }

    func add(element: T) {
        self._internalDict[element] = element
    }

    func remove(element: T) {
        self._internalDict[element] = nil
    }

    func discard(element: T) {
        self.remove(element)
    }

    func clear() {
        self._internalDict = Dictionary<T, T>()
    }

    func isDisjoint(other: Set<T>) -> Bool {
        return (self & other) == Set([])
    }

    func isdisjoint(other: Set<T>) -> Bool {
        return isDisjoint(other)
    }

    // Implement Collection (allows for "countElements(set)", etc.)
    var startIndex: Int {
        return 0
    }

    // Implement Collection (allows for "countElements(set)", etc.)
    var endIndex: Int {
        return countElements(self._internalDict)
    }

    // Implement Collection (allows for "countElements(set)", etc.)
    subscript (i: Int) -> T {
        return Array(self._internalDict.values)[i]
    }

    // Implement Sequence (allows for "for x in set")
    func generate() -> IndexingGenerator<[T]> {
        return Array(self._internalDict.values).generate()
    }

    // Implement Printable (allows for "println(set)")
    var description: String {
        var s = "Set(["
        for (i, value) in enumerate(self) {
            s += "\(value)"
            if i != countElements(self) - 1 {
                s += ", "
            }
        }
        s += "])"
        return s
    }

    // Implement ArrayLiteralConvertible (allows for "var set: Set<Int> = [2, 4, 8]")
    class func convertFromArrayLiteral(elements: T...) -> Set<T> {
        return Set(elements)
    }

    // Implement LogicValue (allows for "if set { … }")
    func getLogicValue() -> Bool {
        return countElements(self) != 0
    }

    // Implement ExtensibleCollection
    func reserveCapacity(n: Int) {
        // NOOP.
    }

    // Implement ExtensibleCollection
    func extend<R : Sequence where R.GeneratorType.Element == T>(sequence: R) {
        var elements = Array<T>(sequence)
        for element in elements {
            self.add(element)
        }
    }

    // Implement Hashable
    var hashValue: Int {
        var totalHash = 0
        for entry in self {
            totalHash += entry != nil ? entry.hashValue : 0
        }
        return totalHash
    }
}

class set<T: Hashable> : Set<T> {
    init() {
        super.init()
    }

    init(_ initialArray: [T]) {
        super.init(initialArray)
    }

    init(_ initialSet: Set<T>) {
        super.init(initialSet)
    }

    init(_ initialSet: set<T>) {
        super.init(initialSet)
    }
}

func <<T: Hashable>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    if lhs == rhs {
        return false
    }
    for element in lhs {
        if !rhs.contains(element) {
            return false
        }
    }
    return true
}

func ==<T: Hashable>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

func +<T: Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    var newSet = Set<T>(lhs)
    newSet.extend(rhs)
    return newSet
}

func -<T: Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    var newSet = Set<T>(lhs)
    for entry in rhs {
        newSet.remove(entry)
    }
    return newSet
}

func &<T: Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    var newSet = Set<T>()
    for entry in lhs {
        if rhs.contains(entry) {
            newSet.add(entry)
        }
    }
    return newSet
}

func |<T: Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs + rhs
}

@assignment func +=<T: Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    lhs.extend(rhs)
}

@assignment func |=<T: Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    lhs.extend(rhs)
}

@assignment func &=<T: Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    for entry in lhs {
        if rhs.contains(entry) {
            lhs.add(entry)
        } else {
            lhs.remove(entry)
        }
    }
}

@assignment func +=<T: Hashable>(inout lhs: Set<T>, rhs: T) {
    lhs.add(rhs)
}

@assignment func -=<T: Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    for entry in rhs {
        lhs.remove(entry)
    }
}

@assignment func -=<T: Hashable>(inout lhs: Set<T>, rhs: T) {
    lhs.remove(rhs)
}
