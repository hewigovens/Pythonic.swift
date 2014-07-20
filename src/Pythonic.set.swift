// The Swift standard library currently lacks a Set class. This is an
// attempt to fix that :-)
//
//  "A set object is an unordered collection of distinct hashable
//   objects. Common uses include membership testing, removing
//   duplicates from a sequence, and computing mathematical
//   operations such as intersection, union, difference, and symmetric
//   difference."
//
// Usage:
//
//   var set1 = Set([0, 1, 2])
//   set1.add(3)
//   set1.add(3)
//   assert(set1 == Set([0, 1, 2, 3]))
//
//   var set2 = Set([2, 4, 8, 16])
//   assert(set1 + set2 == Set([0, 1, 2, 3, 4, 8, 16]))
//   assert(set1 - set2 == Set([0, 1, 3]))
//   assert(set1 & set2 == Set([2]))
//
//   assert(Set([1, 1, 1, 2, 2, 3, 3, 4]) == Set([1, 2, 3, 4]))

class Set<T: Hashable> : ArrayLiteralConvertible, Swift.Collection,
                         Comparable, Equatable, ExtensibleCollection,
                         Hashable, LogicValue, Printable, Sequence {
    var _internalDict = Dictionary<T, Bool>()

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
        self._internalDict[element] = true
    }

    func remove(element: T) {
        self._internalDict[element] = nil
    }

    func discard(element: T) {
        self.remove(element)
    }

    func clear() {
        self._internalDict = Dictionary<T, Bool>()
    }

    func intersection(other: Set<T>) -> Set<T> {
        var newSet = Set<T>()
        for entry in self {
            if other.contains(entry) {
                newSet.add(entry)
            }
        }
        return newSet
    }

    func isDisjoint(other: Set<T>) -> Bool {
        return self.intersection(other) == Set()
    }

    // Implement ArrayLiteralConvertible (allows for "var set: Set<Int> = [2, 4, 8]")
    class func convertFromArrayLiteral(elements: T...) -> Set<T> {
        return Set(elements)
    }

    // Implement Collection (allows for "countElements(set)", etc.)
    subscript (i: Int) -> T {
        return Array(self._internalDict.keys)[i]
    }

    // Implement Collection (allows for "countElements(set)", etc.)
    var startIndex: Int {
        return 0
    }

    // Implement Collection (allows for "countElements(set)", etc.)
    var endIndex: Int {
        return countElements(self._internalDict)
    }

    // Implement ExtensibleCollection
    func reserveCapacity(n: Int) {
        // NOOP.
    }

    // Implement ExtensibleCollection
    func extend<R : Sequence where R.GeneratorType.Element == T>(sequence: R) {
        let elements = Array<T>(sequence)
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

    // Implement LogicValue (allows for "if set { … }")
    func getLogicValue() -> Bool {
        return countElements(self) != 0
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

    // Implement Sequence (allows for "for x in set")
    func generate() -> IndexingGenerator<[T]> {
        return Array(self._internalDict.keys).generate()
    }

}

// Implement Comparable (allows for "if set1 < set2 { … }")
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

// Implement Equatable (allows for "if set1 == set2 { … }")
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
    return lhs.intersection(rhs)
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

// set(…) for Python compatibility.
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

    func isdisjoint(other: set<T>) -> Bool {
        return self.intersection(other) == set()
    }
}
