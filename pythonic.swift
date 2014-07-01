#!/usr/bin/env xcrun swift -i

@exported import Darwin
import Foundation

func len<T>(x: Array<T>) -> Int {
    return countElements(x)
}

assert(len(["foo", "bar"]) == 2)

func len<T1, T2>(x: Dictionary<T1, T2>) -> Int {
    return countElements(x)
}

assert(len(["foo": "bar"]) == 1)

func len(x: String) -> Int {
    return countElements(x)
}

assert(len("") == 0)
assert(len("foo") == 3)

let True: Bool = true

assert(True)

let False: Bool = false

assert(!False)

extension Array : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }
}

assert([1, 2, 3])
assert([1, 2])
assert([1])

extension Dictionary : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }
}

assert(["foo": "bar"])
assert(!Dictionary<String, String>())

extension Double : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }
}

assert(!0.0)
assert(0.00000001)
assert(1.0)

extension Float : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }
}

assert(!(0.0 as Float))
assert(0.00000001 as Float)
assert(1.0 as Float)

extension Int : LogicValue {
    func getLogicValue() -> Bool {
        return self != 0
    }
}

assert(!0)
assert(1)

extension NilType : LogicValue {
    func getLogicValue() -> Bool {
        return False
    }
}

assert(!nil)

extension String : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }
}

assert(!"")
assert(" ")

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

    func replace(old: String, _ `new`: String) -> String {
        return self.stringByReplacingOccurrencesOfString(old, withString: `new`)
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

    /// NOTE: Not equivalent to Python, but better.
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
        let start = advance(startIndex, range.startIndex)
        let end = advance(startIndex, range.endIndex)
        return self.substringWithRange(Range(start: start, end: end))
    }
}

assert("".strip() == "")
assert(" foobar ".strip() == "foobar")
assert("foobar".strip() == "foobar")
assert("  \n   foobar       \n   ".strip() == "foobar")
assert(equal(("foobar").split(""), ["foobar"]))
assert(equal(("foo bar").split(" "), ["foo", "bar"]))
assert("FooBar".upper() == "FOOBAR")
assert("FooBar".lower() == "foobar")
assert("fzzbar".replace("z", "o") == "foobar")
assert("foobar"[0] == "f")
assert("foobar".startswith("foo"))
assert("foobar".startsWith("foo"))
assert("foobar".endswith("bar"))
assert("foobar".endsWith("bar"))
assert("foobar"[0..2] == "fo")
assert("foo baR".capitalize() == "Foo bar")
assert("foo".capitalize() == "Foo")
assert("fo".capitalize() == "Fo")
assert("f".capitalize() == "F")
assert("".capitalize() == "")
assert("foo bar".title() == "Foo Bar")
assert("they're bill's friends from the UK".title() == "They're Bill's Friends From The Uk")

func all<R : Sequence where R.GeneratorType.Element : LogicValue>(iterable: R) -> Bool {
    for element in iterable {
        if !element {
            return False
        }
    }
    return True
}

assert(!all(["", "bar", "zonk"]))
assert(all(["foo", "bar", "zonk"]))
assert(!all([False, False, False]))
assert(!all([False, False, True]))
assert(all([True, True, True]))

func any<R : Sequence where R.GeneratorType.Element : LogicValue>(iterable: R) -> Bool {
    for element in iterable {
        if element {
            return True
        }
    }
    return False
}

assert(any(["foo", "bar", "zonk"]))
assert(!any([False, False, False]))
assert(any([False, False, True]))

func max<R : Sequence where R.GeneratorType.Element : Comparable>(range: R) -> R.GeneratorType.Element {
    return maxElement(range)
}

assert(max([1, 2, 3]) == 3)
assert(max([1, 2]) == 2)
assert(max(1, 2) == 2)
assert(max(1, 2, 3) == 3)

func min<R : Sequence where R.GeneratorType.Element : Comparable>(range: R) -> R.GeneratorType.Element {
    return minElement(range)
}

assert(min([1, 2]) == 1)
assert(min([1, 2, 3]) == 1)
assert(min(1, 2) == 1)
assert(min(1, 2, 3) == 1)

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

// TODO: Handle third argument (step), with .by(...)?
func range(start: Int, stop: Int) -> Array<Int> {
    var intArray = Array<Int>()
    if start > stop {
        return intArray
    }
    for i in start..stop {
        intArray += i
    }
    return intArray
}

func range(stop: Int) -> Array<Int> {
    return range(0, stop)
}

assert(equal(range(10), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))
assert(equal(range(1, 11), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
assert(equal(range(0), []))
assert(equal(range(1, 0), []))

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
    var total = start
    for i in iterable {
        total += i
    }
    return total
}

assert(sum([1, 2, 3]) == 6)
assert(sum([1, 2, 3], 1) == 7)

func zip<S1: Sequence, S2: Sequence>(s1: S1, s2: S2) -> Array<(S1.GeneratorType.Element, S2.GeneratorType.Element)> {
    var retArray = Array<(S1.GeneratorType.Element, S2.GeneratorType.Element)>()
    for tuple in Zip2<S1, S2>(s1, s2) {
        retArray += tuple
    }
    return retArray
}

// TODO: Python functions to implement
// ===================================

// chr(i)¶
// Return a string of one character whose ASCII code is the integer i. For example, chr(97) returns the string 'a'.

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

// ord(c)¶
// Given a string of length one, return an integer representing the Unicode code point of the character when the argument is a unicode object, or the value of the byte when the argument is an 8-bit string.

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
