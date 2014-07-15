class Set<T: Hashable> : Collection, Printable, Sequence {
    var _internalDict = Dictionary<T, T>()

    init() {
    }

    init(_ initialArray: [T]) {
        for entry in initialArray {
            self.add(entry)
        }
    }

    init(_ initialSet: Set<T>) {
        for entry in initialSet {
            self.add(entry)
        }
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

    // Implement Collection (enables "countElements(set)")
    var startIndex: Int {
        return 0
    }

    // Implement Collection (enables "countElements(set)")
    var endIndex: Int {
        return countElements(self._internalDict)
    }

    // Implement Collection (enables "countElements(set)")
    subscript (i: Int) -> T {
        return Array(_internalDict.values)[i]
    }

    // Implement Sequence (enables "for x in set")
    func generate() -> IndexingGenerator<[T]> {
        return Array(_internalDict.values).generate()
    }

    // Implement Printable (enables "println(set)")
    var description: String {
        var s = "Set(["
        for (i, value) in enumerate(_internalDict.values) {
            s += "\(value)"
            if i != countElements(_internalDict.values) - 1 {
                s += ", "
            }
        }
        s += "])"
        return s
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

func ==<T: Hashable>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    if countElements(lhs) != countElements(rhs) {
        return false
    }
    for element in lhs {
        if !rhs.contains(element) {
            return false
        }
    }
    return true
}

func +<T: Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    var newSet = Set<T>()
    for entry in lhs {
        newSet.add(entry)
    }
    for entry in rhs {
        newSet.add(entry)
    }
    return newSet
}

func -<T: Hashable>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    var newSet = Set<T>()
    for entry in lhs {
        newSet.add(entry)
    }
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
    var newSet = Set<T>()
    for entry in lhs {
        newSet.add(entry)
    }
    for entry in rhs {
        newSet.add(entry)
    }
    return newSet
}

@assignment func +=<T: Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    for entry in rhs {
        lhs.add(entry)
    }
}

@assignment func |=<T: Hashable>(inout lhs: Set<T>, rhs: Set<T>) {
    for entry in rhs {
        lhs.add(entry)
    }
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
