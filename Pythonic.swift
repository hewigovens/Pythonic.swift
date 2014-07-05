@exported import Darwin
import Foundation

func len<T>(x: Array<T>) -> Int {
    return Swift.countElements(x)
}

func len<T1, T2>(x: Dictionary<T1, T2>) -> Int {
    return Swift.countElements(x)
}

func len(x: String) -> Int {
    return Swift.countElements(x)
}

extension Array : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }

    func index<T where T : Equatable>(element: T) -> Int? {
        for (idx, object) in Swift.enumerate(self) {
            if let castedObject = object as? T {
                if castedObject == element {
                    return idx
                }
            }
        }
        return nil
    }
}

extension Character : LogicValue {
    func getLogicValue() -> Bool {
        return true
    }
}

extension Dictionary : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }
}

extension Double : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }
}

extension Float : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }
}

extension Int : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }
}

extension NilType : LogicValue {
    func getLogicValue() -> Bool {
        return false
    }
}

extension String : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }
}

extension String {
    func capitalize() -> String {
        if len(self) == 0 {
            return self
        }
        return self[0].upper() + self[1..len(self)].lower()
    }

    func endsWith(suffix: String) -> Bool {
        return self.hasSuffix(suffix)
    }

    func endswith(suffix: String) -> Bool {
        return self.endsWith(suffix)
    }

    func lower() -> String {
        return self.lowercaseString
    }

    func replace(replaceOldString: String, _ withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(replaceOldString, withString: withString)
    }

    func split(sep: String) -> String[] {
        return self.componentsSeparatedByString(sep)
    }

    func startsWith(prefix: String) -> Bool {
        return self.hasPrefix(prefix)
    }

    func startswith(prefix: String) -> Bool {
        return self.startsWith(prefix)
    }

    // TODO: Handle character set to trim.
    // TODO: lstrip(...), rstrip(...)
    func strip() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }

    // NOTE: Not equivalent to Python, but better.
    func title() -> String {
        return self.capitalizedString
    }

    func upper() -> String {
        return self.uppercaseString
    }

    subscript (index: Int) -> String {
        return String(Array(self)[index])
    }

    subscript (range: Range<Int>) -> String {
        let start = Swift.advance(self.startIndex, range.startIndex)
        let end = Swift.advance(self.startIndex, range.endIndex)
        return self.substringWithRange(Range(start: start, end: end))
    }
}

func all<R : Sequence where R.GeneratorType.Element : LogicValue>(iterable: R) -> Bool {
    for element in iterable {
        if !element {
            return false
        }
    }
    return true
}

func any<R : Sequence where R.GeneratorType.Element : LogicValue>(iterable: R) -> Bool {
    for element in iterable {
        if element {
            return true
        }
    }
    return false
}

func chr(i: Int) -> String {
    return NSString(format: "%c", i)
}

func max<R : Sequence where R.GeneratorType.Element : Comparable>(range: R) -> R.GeneratorType.Element {
    return Swift.maxElement(range)
}

func min<R : Sequence where R.GeneratorType.Element : Comparable>(range: R) -> R.GeneratorType.Element {
    return Swift.minElement(range)
}

func open(name: String, _ mode: String = "") -> NSFileHandle {
    // TODO: Not all modes are implemented.
    switch mode {
        case "r":
            return NSFileHandle(forReadingAtPath: name)
        case "w":
            return NSFileHandle(forWritingAtPath: name)
        case "a":
            return NSFileHandle(forUpdatingAtPath: name)
        default:
            return NSFileHandle(forReadingAtPath: name)
    }
}

func ord(s: String) -> Int {
    return Int((s as NSString).characterAtIndex(0))
}

func ord(c: Character) -> Int {
    return ord(String(c))
}

func range(start: Int, stop: Int, _ step: Int = 1) -> Array<Int> {
    var intArray = Array<Int>()
    if step <= 0 {
        return intArray
    }
    if start > stop {
        return intArray
    }
    for i in (start..stop).by(step) {
        intArray += i
    }
    return intArray
}

func range(stop: Int) -> Array<Int> {
    return range(0, stop)
}

func rawInput(prompt: String) -> String {
    if (prompt != "") {
        // NOTE: Workaround for print(...) which appears not to flush properly.
        let nsPromptString = prompt as NSString
        let nsPromptData = nsPromptString.dataUsingEncoding(NSUTF8StringEncoding)
        let stdout = NSFileHandle.fileHandleWithStandardOutput()
        stdout.writeData(nsPromptData)
        stdout.synchronizeFile()
    }
    let stdin = NSFileHandle.fileHandleWithStandardInput()
    if let data = stdin.availableData {
        let inputString = NSString(data: data, encoding: NSUTF8StringEncoding) as String
        if len(inputString) == 0 {
            return ""
        }
        // TODO: Should use .rstrip("\n") here instead.
        let lastChar = inputString[len(inputString) - 1]
        if lastChar == "\n" {
            return inputString[0..len(inputString) - 1]
        } else {
            return inputString
        }
    }
    return ""
}

func raw_input(prompt: String) -> String {
    return rawInput(prompt)
}

func rawInput() -> String {
    return rawInput("")
}

func raw_input() -> String {
    return rawInput()
}

func sum(iterable: Array<Int>, _ start: Int = 0) -> Int {
    return Swift.reduce(iterable, start, { $0 + $1 })
}

func zip<S1 : Sequence, S2 : Sequence>(s1: S1, s2: S2) -> Array<(S1.GeneratorType.Element, S2.GeneratorType.Element)> {
    var retArray = Array<(S1.GeneratorType.Element, S2.GeneratorType.Element)>()
    for tuple in Swift.Zip2<S1, S2>(s1, s2) {
        retArray += tuple
    }
    return retArray
}

// TODO: Python functions to implement
// ===================================

// Candidates for extensions:
//
// SWIFT        FOUNDATION     PYTHON
// =====        ==========     ======
// -            NSDate         datetime/datetime.datetime
// -            NSFileHandle   open
// Array        NSArray        list
// Bool         -              bool
// Character    -              -
// Dictionary   NSDictionary   dict
// Double       -              -
// Float        -              float
// Int          NSInteger      int
// NilType      -              None
// Range        NSRange        range/xrange
// String       NSString       str

// TODO: Move to one file per extended class.

// cmp(x, y)¶
// Compare the two objects x and y and return an integer according to the outcome. The return value is negative if x < y, zero if x == y and strictly positive if x > y.

// dict(**kwarg)
// dict(mapping, **kwarg)
// dict(iterable, **kwarg)
// Create a new dictionary. The dict object is the dictionary class.

// enumerate(sequence, start=0)¶
// NOTE: Already in Swift.
// Return an enumerate object. sequence must be a sequence, an iterator, or some other object which supports iteration.

// filter(function, iterable)¶
// NOTE: Already in Swift.
// Construct a list from those elements of iterable for which function returns true. iterable may be either a sequence, a container which supports iteration, or an iterator.

// hasattr(object, name)¶
// The arguments are an object and a string.

// hex(x)¶
// Convert an integer number (of any size) to a lowercase hexadecimal string prefixed with “0x”, for example

// list([iterable])¶
// Return a list whose items are the same and in the same order as iterable‘s items.

// map(function, iterable, ...)¶
// NOTE: Already in Swift.
// Apply function to every item of iterable and return a list of the results.

// next(iterator[, default])¶
// Retrieve the next item from the iterator by calling its next() method.

// oct(x)¶
// Convert an integer number (of any size) to an octal string. The result is a valid Python expression.

// reduce(function, iterable[, initializer])¶
// NOTE: Already in Swift.
// Apply function of two arguments cumulatively to the items of iterable, from left to right, so as to reduce the iterable to a single value.

// reversed(seq)¶
// NOTE: Compare to reverse(...).
// Return a reverse iterator. seq must be an object which has a __reversed__() method or supports the sequence protocol (the __len__() method and the __getitem__() method with integer arguments starting at 0).

// set([iterable])
// Return a new set object, optionally with elements taken from iterable. set is a built-in class.

// slice(stop)¶
// slice(start, stop[, step])
// Return a slice object representing the set of indices specified by range(start, stop, step). The start and step arguments default to None.

// sorted(iterable[, cmp[, key[, reverse]]])¶
// NOTE: Compare to sort(...).
// Return a new sorted list from the items in iterable.

// tuple([iterable])¶
// Return a tuple whose items are the same and in the same order as iterable‘s items. iterable may be a sequence, a container that supports iteration, or an iterator object.
// If iterable is already a tuple, it is returned unchanged. For instance, tuple('abc') returns ('a', 'b', 'c') and tuple([1, 2, 3]) returns (1, 2, 3). If no argument is given, returns a new empty tuple, ().

// xrange(stop)¶
// xrange(start, stop[, step])
// NOTE: Compare to range(...).
// This function is very similar to range(), but returns an xrange object instead of a list.

// NOTE: These aliases below should not be used in the implementation above. They may be used in the tests however.
let False: Bool = Swift.false
let None: NilType = Swift.nil
let True: Bool = Swift.true

typealias bool = Swift.Bool
typealias dict = Swift.Dictionary
typealias float = Swift.Float
typealias int = Swift.Int
typealias list = Swift.Array
typealias str = Swift.String
