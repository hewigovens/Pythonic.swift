@exported import Foundation

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

extension NSObject : LogicValue {
    func getLogicValue() -> Bool {
        return true
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

class math {
    var e = 2.718281828459045
    var pi = 3.141592653589793

    class func acos(arg1: Double) -> Double {
        return Darwin.acos(arg1)
    }

    class func acosh(arg1: Double) -> Double {
        return Darwin.acosh(arg1)
    }

    class func asin(arg1: Double) -> Double {
        return Darwin.asin(arg1)
    }

    class func asinh(arg1: Double) -> Double {
        return Darwin.asinh(arg1)
    }

    class func atan2(arg1: Double, arg2: Double) -> Double {
        return Darwin.atan2(arg1, arg2)
    }

    class func atanh(arg1: Double) -> Double {
        return Darwin.atanh(arg1)
    }

    class func ceil(arg1: Double) -> Double {
        return Darwin.ceil(arg1)
    }

    class func copysign(arg1: Double, arg2: Double) -> Double {
        return Darwin.copysign(arg1, arg2)
    }

    class func cos(arg1: Double) -> Double {
        return Darwin.cos(arg1)
    }

    class func cosh(arg1: Double) -> Double {
        return Darwin.cosh(arg1)
    }

    class func erf(arg1: Double) -> Double {
        return Darwin.erf(arg1)
    }

    class func erfc(arg1: Double) -> Double {
        return Darwin.erfc(arg1)
    }

    class func exp(arg1: Double) -> Double {
        return Darwin.exp(arg1)
    }

    class func expm1(arg1: Double) -> Double {
        return Darwin.expm1(arg1)
    }

    class func fabs(arg1: Double) -> Double {
        return Darwin.fabs(arg1)
    }

    class func floor(arg1: Double) -> Double {
        return Darwin.floor(arg1)
    }

    class func fmod(arg1: Double, arg2: Double) -> Double {
        return Darwin.fmod(arg1, arg2)
    }

    class func frexp(arg1: Double, arg2: CMutablePointer<CInt>) -> Double {
        return Darwin.frexp(arg1, arg2)
    }

    class func hypot(arg1: Double, arg2: Double) -> Double {
        return Darwin.hypot(arg1, arg2)
    }

    class func gamma(arg1: Double) -> Double {
        return Darwin.gamma(arg1)
    }

    class func ldexp(arg1: Double, arg2: CInt) -> Double {
        return Darwin.ldexp(arg1, arg2)
    }

    class func lgamma(arg1: Double) -> Double {
        return Darwin.lgamma(arg1)
    }

    class func log(arg1: Double) -> Double {
        return Darwin.log(arg1)
    }

    class func log10(arg1: Double) -> Double {
        return Darwin.log10(arg1)
    }

    class func log1p(arg1: Double) -> Double {
        return Darwin.log1p(arg1)
    }

    class func modf(arg1: Double, arg2: CMutablePointer<CDouble>) -> Double {
        return Darwin.modf(arg1, arg2)
    }

    class func sin(arg1: Double) -> Double {
        return Darwin.sin(arg1)
    }

    class func sinh(arg1: Double) -> Double {
        return Darwin.sinh(arg1)
    }

    class func sqrt(arg1: Double) -> Double {
        return Darwin.sqrt(arg1)
    }

    class func tan(arg1: Double) -> Double {
        return Darwin.tan(arg1)
    }

    class func tanh(arg1: Double) -> Double {
        return Darwin.tanh(arg1)
    }

    class func trunc(arg1: Double) -> Double {
        return Darwin.trunc(arg1)
    }
}

class re {
    class func search(pattern: String, _ string: String) -> String[] {
        var returnedMatches: String[] = []
        if pattern == "" {
            return returnedMatches
        }
        if let regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: nil) {
            if let matches: AnyObject[] = regex.matchesInString(string, options: nil, range: NSMakeRange(0, countElements(string))) {
                let regexpMatches = Swift.reinterpretCast(matches) as NSTextCheckingResult[]
                for match: NSTextCheckingResult in regexpMatches {
                    returnedMatches += string[match.range]
                }
            }
        }
        return returnedMatches
    }
}

typealias datetime = NSDate
extension datetime {
    class func utcnow() -> NSDate {
        return NSDate()
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

func cmp<T : Comparable>(x: T, y: T) -> Int {
    if x < y {
        return -1
    }
    if x > y {
        return 1
    }
    return 0
}

func hex(i: Int) -> String {
    var o = NSString(format: "%x", i)
    return "0x" + o
}

func max<R : Sequence where R.GeneratorType.Element : Comparable>(range: R) -> R.GeneratorType.Element {
    return Swift.maxElement(range)
}

func min<R : Sequence where R.GeneratorType.Element : Comparable>(range: R) -> R.GeneratorType.Element {
    return Swift.minElement(range)
}

func oct(i: Int) -> String {
    var o = NSString(format: "%o", i)
    if o == "0" {
        return o
    }
    return "0" + o
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

// NOTE: These aliases below should not be used in the implementation above. They may be used in the tests however.
let False: Bool = Swift.false
let None: NilType = Swift.nil
let True: Bool = Swift.true

typealias bool = Swift.Bool
typealias dict = Swift.Dictionary
typealias float = Swift.Float
typealias int = Swift.Int
typealias list = Swift.Array
typealias long = Swift.Int
typealias str = Swift.String

typealias file = NSFileHandle
typealias object = NSObject
typealias set = NSMutableSet

extension NSFileHandle {
    func read() -> String {
        var data: NSData = self.readDataToEndOfFile()
        return NSString(data: data, encoding: NSUTF8StringEncoding) as String
    }

    func readLines() -> String[] {
        return read().strip().split("\n")
    }

    func readlines() -> String[] {
        return readLines()
    }
}

// TODO: Python functions to implement
// ===================================

// Candidates for extensions:
//
// SWIFT              FOUNDATION/OBJC       PYTHON
// =====              ===============       ======
// -                  NSDate                datetime/datetime.datetime
// -                  NSFileHandle          open
// -                  NSMutableSet          set
// -                  NSRegularExpression   re
// Any                -                     -
// AnyClass           Class                 -
// AnyObject          id                    -
// Array              NSArray               list
// Bool               BOOL                  bool
// Character          -                     -
// Dictionary         NSMutableDictionary   dict
// Double             -                     -
// Float              -                     float
// Int                NSInteger             int
// NilType/Optional   nil                   None
// Range              NSRange               range/xrange
// String             NSString              str

// TODO: Move to one file per extended class.

// Functions listed on https://docs.python.org/2/library/functions.html not yet implemented:
// basestring()¶                            This abstract type is the superclass for str and unicode.
// bin(x)¶                                  Convert an integer number to a binary string.
// bytearray([source[, encoding[, err]]])¶  Return a new array of bytes. The bytearray type is a mutable sequence of integers in the range 0 <= x < 256.
// callable(object)¶                        Return True if the object argument appears callable, False if not.
// classmethod(function)¶                   Return a class method for function.
// compile(source, filename, …)¶            Compile the source into a code or AST object.
// complex([real[, imag]])¶                 Create a complex number with the value real + imag*j or convert a string or number to a complex number.
// delattr(object, name)¶                   This is a relative of setattr(). The arguments are an object and a string.
// dir([object])¶                           Without arguments, return the list of names in the current local scope. With an argument, attempt to return a list of valid attributes for that object.
// divmod(a, b)¶                            Take two (non complex) numbers as arguments and return a pair of numbers consisting of their quotient and remainder when using long division.
// enumerate(sequence, start=0)¶            Return an enumerate object. sequence must be a sequence, an iterator, or some other object which supports iteration.
// eval(expression[, globals[, locals]])¶   The arguments are a Unicode or Latin-1 encoded string and optional globals and locals.
// execfile(filename[, globals[, locals]])¶ This function is similar to the exec statement, but parses a file instead of a string.
// file(name[, mode[, buffering]])¶         Constructor function for the file type, described further in section File Objects. The constructor’s arguments are the same as those of the open() built-in function described below.
// filter(function, iterable)¶              Construct a list from those elements of iterable for which function returns true. iterable may be either a sequence, a container which supports iteration, or an iterator.
// format(value[, format_spec])¶            Convert a value to a “formatted” representation, as controlled by format_spec.
// frozenset([iterable])¶                   Return a new frozenset object, optionally with elements taken from iterable.
// getattr(object, name[, default])¶        Return the value of the named attribute of object. name must be a string.
// globals()¶                               Return a dictionary representing the current global symbol table.
// hash(object)¶                            Return the hash value of the object (if it has one). Hash values are integers.
// help([object])¶                          Invoke the built-in help system. (This function is intended for interactive use.)
// id(object)¶                              Return the “identity” of an object. This is an integer (or long integer) which is guaranteed to be unique and constant for this object during its lifetime.
// input([prompt])¶                         Equivalent to eval(raw_input(prompt)).
// isinstance(object, classinfo)¶           Return true if the object argument is an instance of the classinfo argument, or of a (direct, indirect or virtual) subclass thereof.
// issubclass(class, classinfo)¶            Return true if class is a subclass (direct, indirect or virtual) of classinfo.
// iter(o[, sentinel])¶                     Return an iterator object. The first argument is interpreted very differently depending on the presence of the second argument.
// map(function, iterable, ...)¶            Apply function to every item of iterable and return a list of the results.
// memoryview(obj)¶                         Return a “memory view” object created from the given argument.
// next(iterator[, default])¶               Retrieve the next item from the iterator by calling its next() method.
// object()¶                                Return a new featureless object. object is a base for all new style classes.
// property([fget[, fset[, fdel[, doc]]]])¶ Return a property attribute for new-style classes (classes that derive from object).
// reduce(function, iterable[, init])¶      Apply function of two arguments cumulatively to the items of iterable, from left to right, so as to reduce the iterable to a single value.
// reload(module)¶                          Reload a previously imported module. The argument must be a module object, so it must have been successfully imported before.
// repr(object)¶                            Return a string containing a printable representation of an object.
// reversed(seq)¶                           Return a reverse iterator. seq must be an object which has a __reversed__() method or supports the sequence protocol (the __len__() method and the __getitem__() method with integer arguments starting at 0).
// set([iterable])¶                         Return a new set object, optionally with elements taken from iterable. set is a built-in class.
// setattr(object, name, value)¶            This is the counterpart of getattr(). The arguments are an object, a string and an arbitrary value.
// slice(stop)/slice(start, stop[, step])¶  Return a slice object representing the set of indices specified by range(start, stop, step). The start and step arguments default to None.
// sorted(iterable[, cmp[, key[, rev]]])¶   Return a new sorted list from the items in iterable.
// staticmethod(function)¶                  Return a static method for function.
// super(type[, object-or-type])¶           Return a proxy object that delegates method calls to a parent or sibling class of type.
// tuple([iterable])¶                       Return a tuple whose items are the same and in the same order as iterable‘s items. iterable may be a sequence, a container that supports iteration, or an iterator object.
// type(object)/type(name, bases, dict)¶    With one argument, return the type of an object. The return value is a type object.
// unichr(i)¶                               Return the Unicode string of one character whose Unicode code is the integer i.
// unicode(o='')/unicode(o[, enc[, err]])¶  Return the Unicode string version of object using one of the following modes …
// vars([object])¶                          Return the __dict__ attribute for a module, class, instance, or any other object with a __dict__ attribute.
// xrange(stop)/xrange(start, stop[, st])¶  This function is very similar to range(), but returns an xrange object instead of a list.

// Functions listed on https://docs.python.org/2/library/string.html not yet implemented:
// ...

// Functions listed on https://docs.python.org/2/library/math.html not yet implemented:
// ...

// Functions listed on https://docs.python.org/2/library/re.html not yet implemented:
// ...

// Functions listed on https://docs.python.org/2/library/datetime.html not yet implemented:
// ...

// Functions listed on https://docs.python.org/2/library/random.html not yet implemented:
// ...

// Functions listed on https://docs.python.org/2/library/os.html not yet implemented:
// ...

// Functions listed on https://docs.python.org/2/library/sys.html not yet implemented:
// ...
