#!/usr/bin/env xcrun swift -i -I .

import Pythonic

// ** (power operator)
assert(1 + 2**2 + 2 == 7)
assert(1 + 2.0**2.0 + 2 == 7)
assert(1**1 + 2.0**2.0 + 2 == 7)
assert(2 * 2 ** 2 * 3 ** 2 * 3 ** 3 == 1944)
assert(2**2 == 4)
assert(2.0**2.0 == 4)

// abs
assert(abs(-0.1) == 0.1)
assert(abs(-1) == 1)

// all
assert(!all(["", "bar", "zonk"]))
assert(!all([false, false, false]))
assert(!all([false, false, true]))
assert(all(["foo", "bar", "zonk"]))
assert(all([0.0001, 0.0001]))
assert(all([true, true, true]))

// any
assert(!any([0, 0]))
assert(!any([false, false, false]))
assert(any(["", "foo", "bar", "zonk"]))
assert(any([0.1, 0]))
assert(any([false, false, true]))

// bool
assert(!bool(""))
assert(!bool(0))
assert(bool("foo"))
assert(bool(1))
assert(bool([1]))
// assert(!bool(set([]))) // error: could not find an overload for 'assert' that accepts the supplied arguments

// chr
assert(chr(97) == "a")
assert(chr(ord("b")) == "b")
assert(ord(chr(255)) == 255)

// cmp
assert(cmp("bar", "bar") == 0)
assert(cmp("bar", "foo") == -1)
assert(cmp("foo", "bar") == 1)
assert(cmp(0, 0) == 0)
assert(cmp(0, 1) == -1)
assert(cmp(1, 0) == 1)
// assert(cmp([1, 2, 3, 100], [2, 3, 4, 5]) == -1) – assertion fails

// double.is_integer/isInteger
assert(!0.000000000001.is_integer())
assert(!1.1.is_integer())
assert(1.0.is_integer())

// file
// TODO: Missing test.

// float
assert(!float(0.0))
assert(float(0 + 0.0001))
assert(float(0.00000001))
assert(float(1.0))

// float.is_integer
assert(!float(1.1).is_integer())
assert(float(1.0).is_integer())
assert(float(100).is_integer())

// hex
assert(hex(0) == "0x0")
assert(hex(1) == "0x1")
assert(hex(10) == "0xa")
assert(hex(100) == "0x64")
assert(hex(1000) == "0x3e8")
assert(hex(10000000) == "0x989680")

// int
assert(int(1.1) == 1)
assert(int(9.9) == 9)

// len
assert(len("") == 0)
assert(len("\t") == 1)
assert(len("foo") == 3)
assert(len(["foo", "bar", "baz"]) == 3)
assert(len(["foo", "bar"]) == 2)
assert(len(["foo"]) == 1)

// list
assert(list([1, 2, 3]) == [1, 2, 3])
assert(list([1, 2, 3]).count(1) == 1)

// list.count
assert([1, 2, 2, 3, 3, 3].count(1) == 1)
assert([1, 2, 2, 3, 3, 3].count(2) == 2)
assert([1, 2, 2, 3, 3, 3].count(3) == 3)
assert([1, 2, 3].count(4) == 0)

// list.index
assert(["foo", "bar", "zonk"].index("zonk") == 2)
assert([1, 2, 3].index(3) == 2)
assert(list(["a", "b", "c"]).index("b") == 1)

// long
assert(long(1.1) == 1)

// math.acos
assert(math.acos(-1) == math.pi)

// math.asin
assert(math.asin(1) == math.pi / 2)

// math.atan
assert(math.atan(1) == math.pi / 4)

// math.cos
assert(math.cos(math.pi) == -1)

// math.degrees
assert(math.degrees(math.pi) == 180)

// math.factorial
assert(math.factorial(0) == 1)
assert(math.factorial(20) == 2432902008176640000)

// math.pow
assert(math.pow(2, 2) == 4)

// math.radians
assert(math.radians(270) == math.pi * 1.5)

// math.sin
assert(math.sin(math.pi / 2) == 1)

// math.sqrt
assert(math.sqrt(9) == 3)

// math.tan
// Python returns 0.999... for tan(π / 4)
assert(math.tan(math.pi / 4) <= 1)
assert(math.tan(math.pi / 4) > 0.9999999)

// max
assert(max(1, 2) == 2)
assert(max(1, 2, 3) == 3)
assert(max([1, 2, 3]) == 3)
assert(max([1, 2]) == 2)

// min
assert(min(1, 2) == 1)
assert(min(1, 2, 3) == 1)
assert(min([1, 2, 3]) == 1)
assert(min([1, 2]) == 1)

// object
assert(object())

// oct
assert(oct(0) == "0")
assert(oct(1) == "01")
assert(oct(10) == "012")
assert(oct(100) == "0144")
assert(oct(1000) == "01750")
// assert(oct(100000000000) == "01351035564000") – assertion fails

// ord
assert(ord("a") == 97)
assert(ord(chr(98)) == 98)

// os.getcwd()
assert(os.getcwd())

// os.path.exists
assert(!os.path.exists("/tmp.foo/"))
assert(os.path.exists("/tmp/"))

// random.random
assert(random.random() < 1)

// random.randint
assert(random.randint(0, 10) <= 10)

// random.randrange
assert(random.randrange(0, 10) <= 9)

// range
assert(range(0) == [])
assert(range(0, 10, 2) == [0, 2, 4, 6, 8])
assert(range(0, 5, -1) == [])
assert(range(0, 50, 7) == [0, 7, 14, 21, 28, 35, 42, 49])
assert(range(1, 0) == [])
assert(range(1, 11) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
assert(range(10) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

// re.search
assert(re.search("[\r\n]", "foo\rfoo").group(0) == "\r")
assert(!re.search("^bar", "foobarzonk"))
assert(!re.search("hello", "foobarzonk"))
assert(re.search("\r\n", "foo\r\nfoo").group(0) == "\r\n")
assert(re.search("^foo", "foobarzonk"))
assert(re.search("^foo", "foobarzonk").group(0) == "foo")
assert(re.search("^foo.*zonk$", "foobarzonk"))
assert(re.search("foo", "foobarzonk"))
assert(re.search("o", "foobarzonk"))

// re.match
assert(list(re.match("(Hello (foo) (bar) (zonk))", "Hello foo bar zonk").groups()) == ["Hello foo bar zonk", "foo", "bar", "zonk"])
assert(re.match("(Hello (foo) (bar) (zonk))", "Hello foo bar zonk").group(0) == "Hello foo bar zonk")
assert(re.match("(Hello (foo) (bar) (zonk))", "Hello foo bar zonk").group(1) == "Hello foo bar zonk")
assert(re.match("(Hello (foo) (bar) (zonk))", "Hello foo bar zonk").group(2) == "foo")
assert(re.match("(Hello (foo) (bar) (zonk))", "Hello foo bar zonk").group(3) == "bar")
assert(re.match("(Hello (foo) (bar) (zonk))", "Hello foo bar zonk").group(4) == "zonk")
assert(list(re.match("Hello[ \t]*(.*)world", "Hello     Python world").groups())[0] == "Python ")
assert(re.match("Hello[ \t]*(.*)world", "Hello     Python world").group(0) == "Hello     Python world")
assert(!re.match("o", "foobarzonk"))
assert(re.match("^foo", "foobarzonk"))
assert(re.match("foo", "foobarzonk"))
// assert(re.match("/(.*)/(.*)/(.*)", "/var/tmp/foo").groups() == ("var", "tmp", "foo")) // error: '[String]' is not convertible to 'MirrorDisposition'
assert(re.match("Hello[ \t]*(.*)world", "Hello     Python world").group(1) == "Python ")
assert(re.search("foo", "barfoobar"))
assert(!re.search("zoo", "barfoobar"))
assert(list(re.search("/(.*)/(.*)/(.*)", "/var/tmp/foo").groups()) == ["var", "tmp", "foo"])
assert(re.match("/(.*)/(.*)/(.*)", "/var/tmp/foo").groups()[0] == "var")
assert(re.match("/(.*)/(.*)/(.*)", "/var/tmp/foo").groups()[1] == "tmp")
assert(re.match("/(.*)/(.*)/(.*)", "/var/tmp/foo").groups()[2] == "foo")
assert(len(re.search("foo", "barfoobar").groups()) == 0)

// re.split
assert(re.split("/", "") == [""])
assert(re.split("/", "/") == ["", ""])
assert(re.split("/", "foo/") == ["foo", ""])
assert(re.split("/", "foo/bar") == ["foo", "bar"])
assert(re.split("/", "foo/bar/") == ["foo", "bar", ""])
assert(re.split("/", "foo/bar/zonk") == ["foo", "bar", "zonk"])
assert(re.split("/", "foo/bar/zonk/") == ["foo", "bar", "zonk", ""])
assert(re.split("[0-9]", "e8f8z888ee88ch838h23fhh3h2ui388sh3") == ["e", "f", "z", "", "", "ee", "", "ch", "", "", "h", "", "fhh", "h", "ui", "", "", "sh", ""])
assert(re.split("[0-9]", "foo/bar/zonk") == ["foo/bar/zonk"])
assert(re.split("[0-9]", "foo/bar/zonk/") == ["foo/bar/zonk/"])
assert(re.split("[XY]+", "aXYbXYc") == ["a", "b", "c"])
assert(re.split("[\r\n]", "\r\n\t\t\r\n\r\t\n\r\r\n\n\t\t") == ["", "", "\t\t", "", "", "\t", "", "", "", "", "\t\t"])
assert(re.split("[\r\n]+", "foo\naw\tef\roa\r\nwef") == ["foo", "aw\tef", "oa", "wef"])
assert(re.split("[^a-z]", "e8f8z888ee88ch838h23fhh3h2ui388sh3") == ["e", "f", "z", "", "", "ee", "", "ch", "", "", "h", "", "fhh", "h", "ui", "", "", "sh", ""])
assert(re.split("[a-z]", "e8f8z888ee88ch838h23fhh3h2ui388sh3") == ["", "8", "8", "888", "", "88", "", "838", "23", "", "", "3", "2", "", "388", "", "3"])
assert(re.split("a-z", "e8f8z888ee88ch838h23fhh3h2ui388sh3") == ["e8f8z888ee88ch838h23fhh3h2ui388sh3"])

// re.sub
assert(re.sub("^foo", "bar", "foofoo") == "barfoo")
assert(re.sub("^zfoo", "bar", "foofoo") == "foofoo")

// round
assert(round(1.1) == 1)

// set
assert(!(set([1, 2, 3]) < set([1, 2, 3])))
assert(!(set([4]) < set([1, 2, 3])))
assert(set([1, 1, 1, 2, 2, 3, 3, 4]) == set([1, 2, 3, 4]))
assert(set([1, 2, 3]) & set([3, 4, 5]) == set([3]))
assert(set([1, 2, 3]) - set([3, 4, 5]) == set([1, 2]))
assert(set([1, 2, 3]) | set([3, 4, 5]) == set([1, 2, 3, 4, 5]))
assert(set([1, 2, 3]))
assert(set([1, 2]) < set([1, 2, 3]))
assert(set([1, 2]))
assert(set([1]) < set([1, 2, 3]))
assert(set([1]))

// set.isdisjoint
assert(!set([1, 2, 3]).isdisjoint(set([3, 4, 5])))
assert(set([1, 2, 3]).isdisjoint(set([4, 8, 16])))

// str
assert(str(123) == "123")

// str (positive and negative indexing)
assert("foo"[-1] == "o")
assert("foo"[-2] == "o")
assert("foo"[0] == "f")
assert("foo"[len("foo")-1] == "o")

// str * int (repeat string)
assert("foo" * 3 == "foofoofoo")
assert("foo" * 3 == "foofoofoo")
assert(-1 * "foo" == "")
assert(0 * "foo" == "")
assert(1 * "foo" == "foo")
assert(2 * "foo" * 2 == "foofoofoofoo")
assert(2 * "foo" == "foofoo")

// str % tuple
assert("Hello %d! Number %s" % (1, "world") == "Hello 1! Number world")
assert("Hello %d!" % (1) == "Hello 1!")
assert("Hello %s! Number %d" % ("world", 1) == "Hello world! Number 1")
assert("Hello %s!" % ("world") == "Hello world!")
assert("With commit %d, this string building syntax is now %s!" % (197, "supported") == "With commit 197, this string building syntax is now supported!")
assert("foo %% bar %011d zonk %s" % (100, "foobar") == "foo % bar 00000000100 zonk foobar")
assert("foo %d" % (123) == "foo 123")

// str.capitalize
assert("".capitalize() == "")
assert("f".capitalize() == "F")
assert("fo".capitalize() == "Fo")
assert("foo baR".capitalize() == "Foo bar")
assert("foo".capitalize() == "Foo")

// str.center
assert("foo".center(5) == " foo ")
assert("foo".center(6, "-") == "-foo--")
assert("foobar".center(9, "-") == "--foobar-")
assert("foobar".center(4) == "foobar")

// str.count
assert("foo".count("f") == 1)
assert("foo".count("o") == 2)
assert("foo".count("b") == 0)

// str.endswith
assert("foobar".endswith("bar"))

// str.isalnum
assert(!"foo ".isalnum())
assert("foo1".isalnum())

// str.isalpha
assert(!"foo1".isalpha())
assert("fooo".isalpha())

// str.isdigit
assert(!"foo1".isdigit())
assert("123".isdigit())

// str.islower
assert(!"FOO".islower())
assert("foo".islower())

// str.isspace
assert(!"  x ".isspace())
assert(!" a\t".isspace())
assert("   ".isspace())
assert(" \t".isspace())

// str.istitle
assert(!"foo foo".istitle())
assert(!"foo".istitle())
assert("Foo Foo".istitle())
assert("Foo".istitle())

// str.isupper
assert(!"foo".isupper())
assert("FOO".isupper())

// str.join
assert(":".join(["foo", "bar", "baz"]) == "foo:bar:baz")

// str.ljust
assert("foo".ljust(5) == "foo  ")
assert("foo".ljust(10, "-") == "foo-------")
assert("foobar".ljust(4) == "foobar")

// str.lower
assert("FooBar".lower() == "foobar")

// str.lstrip
assert(" \n\t foobar \n\t ".lstrip() == "foobar \n\t ")

// str.partition
assert("the first part\nthe second part".partition("\n") == ("the first part","\n","the second part"))
assert("the first part".partition("\n") == ("the first part", "", ""))
assert("the first part\n".partition("\n") == ("the first part","\n",""))
assert("\nthe second part".partition("\n") == ("","\n","the second part"))

// str.replace
assert("fzzbar".replace("z", "o") == "foobar")

// str.rjust
assert("foo".rjust(5) == "  foo")
assert("foo".rjust(10, "-") == "-------foo")
assert("foobar".rjust(4) == "foobar")

// str.rstrip
assert(" \n\t foobar \n\t ".rstrip() == " \n\t foobar")

// str.split
assert("foo:bar:baz".split(":") == ["foo", "bar", "baz"])
assert("foo bar".split(" ") == ["foo", "bar"])

// str.splitlines
assert("foo\naw\tef\roa\r\nwef".splitlines() == ["foo", "aw\tef", "oa", "wef"])
assert("foo\rfoo\nfoo\r\nfoo\n\rfoo\nfoo".splitlines() == ["foo", "foo", "foo", "foo", "", "foo", "foo"])
assert("\nfoo\rfoo\nfoo\r\nfoo\n\rfoo\nfoo\n".splitlines() == ["", "foo", "foo", "foo", "foo", "", "foo", "foo"])

// str.startswith
assert("foobar".startswith("foo"))

// str.strip
assert("  \n   foobar       \n   ".strip() == "foobar")
assert(" foobar ".strip() == "foobar")
assert("".strip() == "")
assert("foobar".strip() == "foobar")
assert(" \n\t foobar \n\t ".strip() == "foobar")

// str.swapcase
assert("foo".swapcase() == "FOO")
assert("FooBar".swapcase() == "fOObAR")
assert("›ƒé".swapcase() == "›ƒé")

// str.title
assert("foo bar".title() == "Foo Bar")

// str.upper
assert("FooBar".upper() == "FOOBAR")

// sum
assert(sum([1, 2, 3]) == 6)
assert(sum([1, 2, 3], 1) == 7)
assert(sum([1.1, 1.2]) == 2.3)

// sys.argv
if sys.argv && sys.argv[0] == "-i" {
    // Make sure test case passes also when run using shebang line.
    sys.argv = ["./Pythonic-test", "arg1", "arg2"]
}
assert(sys.argv[0].startswith("./Pythonic-test"))
assert(sys.argv[1] == "arg1")
assert(sys.argv[2] == "arg2")
assert(len(sys.argv) == 3)

// sys.platform
assert(sys.platform == "darwin")

// time.time
assert(time.time() > 1405028001.224846)

// uuid
assert(len(uuid.uuid4().hex) == 32)

// Comparison of 2-part tuples
assert((1, 1) == (1, 1))
assert(!((1, 1) == (1, 214)))

// Comparison of 3-part tuples
assert((1, 1, 1) == (1, 1, 1))
assert(!((1, 1, 1) == (1, 1, 214)))

// Others:
assert(" ")
assert("foobar"[0] == "f")
assert(0.00000001)
assert(1)
assert(1.0)
assert([1, 2, 3])
assert([1, 2])
assert([1])
assert(!bool(""))
assert(!bool(0))
assert(!bool(0.0))

// BUG: Due to a strange compiler bug (?) the following cannot be imported. Must be in same source file.
extension Array {
    mutating func pop(index: Int?) -> Array.Element? {
        var i = index ? index! : self.count - 1
        if self.count == 0 || i < 0 || i >= self.count {
            return nil
        }
        var ret = self[i]
        self.removeAtIndex(i)
        return ret
    }

    mutating func pop() -> Array.Element? {
        return self.pop(nil)
    }
}

// BUG: Due to a strange compiler bug (?) the following cannot be imported. Must be in same source file.
extension Dictionary {
    func get(key: KeyType) -> ValueType? {
        return self[key]
    }

    func hasKey(key: KeyType) -> Bool {
        if let _ = self.get(key) {
            return true
        }
        return false
    }

    func has_key(key: KeyType) -> Bool {
        return hasKey(key)
    }

    mutating func pop(key: KeyType) -> ValueType? {
        if let val = self.get(key) {
            self.removeValueForKey(key)
            return val
        }
        return nil
    }

    mutating func popItem() -> (KeyType, ValueType)? {
        if self.count == 0 {
            return nil
        }
        var key = Array(self.keys)[0]
        var value = self.pop(key)!
        return (key, value)
    }

    mutating func popitem() -> (KeyType, ValueType)? {
        return popItem()
    }
}

// BUG: has_attr does not work due to the following compiler bug (?)
// invalid linkage type for global declaration
// %swift.full_heapmetadata* @_TMdC4mainL_3Baz
// LLVM ERROR: Broken module found, compilation aborted!
// func hasattr(object: Any, searchedPropertyName: String) -> Bool {
//     var mirror = reflect(object)
//     for var propertyNumber = 0; propertyNumber < mirror.count; propertyNumber++ {
//         let (propertyName, propertyMirror) = mirror[propertyNumber]
//         // println("\(propertyName) = \(propertyMirror.summary), \(propertyMirror.count) children")
//         if propertyName == searchedPropertyName {
//             return true
//         }
//     }
//     return false
// }

let performPythonIncompatibleTests = true
if performPythonIncompatibleTests {
    // dict
    assert(!dict<str, str>())
    assert(["foo": "bar"])
    assert(len(dict<str, str>()) == 0)

    // double.isInteger
    var d1 = 1.0
    var d2 = 1.1
    assert(d1.isInteger())
    assert(!d2.isInteger())

    // hasattr (commented out due to compiler bug)
    // class Baz {
    //     var foo = "foobar"
    //     var bar = "foobar"
    // }
    // var baz = Baz()
    // assert(hasattr(baz, "foo"))
    // assert(hasattr(baz, "baz") == false)

    // float.isInteger
    assert(float(1.0).isInteger())
    assert(!float(1.1).isInteger())

    // list
    assert(!list<int>())

    var arr: [String] = ["foo", "bar", "zonk", "foo"]
    assert(arr.count("foo") == 2)
    arr.remove("foo")
    assert(arr.count("foo") == 1)
    assert(arr.index("bar") == 0)
    arr.append("hello")
    assert(arr.index("hello") == 3)
    arr.reverseInPlace()
    assert(arr.index("hello") == 0)

    // list.index
    assert(["foo", "bar", "zonk"].index(1) == nil)
    assert([1, 2, 3].index("foo") == nil)
    assert([1, 2, 3].index(4) == nil)

    // list.pop
    var mutableArray = [1, 2, 3]
    assert(mutableArray.pop() == 3)
    assert(mutableArray.pop(0) == 1)
    assert(mutableArray.pop(1) == nil)
    assert(mutableArray.pop(0) == 2)
    assert(mutableArray.pop() == nil)

    // list.remove
    var anotherMutableArray = [3, 2, 1, 3]
    anotherMutableArray.remove(0)
    assert(anotherMutableArray == [3, 2, 1, 3])
    anotherMutableArray.remove(2)
    assert(anotherMutableArray == [3, 1, 3])
    anotherMutableArray.remove(1)
    assert(anotherMutableArray == [3, 3])
    anotherMutableArray.remove(3)
    assert(anotherMutableArray == [3])
    anotherMutableArray.remove(3)
    assert(anotherMutableArray == [])

    // len
    assert(len(list<str>()) == 0)
    assert(len(["foo": "bar"]) == 1)
    assert(len(["foo": "bar", "baz": "foo"]) == 2)

    // map
    var mapObj = ["foo": "foobar"]
    assert(len(mapObj) == 1)
    assert(mapObj["foo"])

    // map.get
    assert(mapObj.get("foo") == "foobar")

    // map.has_key/hasKey
    assert(mapObj.has_key("foo"))
    assert(mapObj.hasKey("foo"))

    // map.pop
    assert(mapObj.pop("foo") == "foobar")
    assert(len(mapObj) == 0)

    // map.popItem
    mapObj["foo"] = "bar"
    let t = mapObj.popItem()
    assert(len(mapObj) == 0)

    // map.clear
    mapObj.clear()
    assert(len(mapObj) == 0)
    assert(!mapObj["foobar"])

    // random.choice
    var array = ["foo", "bar"]
    var randomChoice = random.choice(array)
    assert(randomChoice == "foo" || randomChoice == "bar")

    // re.search
    assert(re.search("", "foobarzonk") == [String]())

    // re.search.group
    assert(re.search("^foo", "foobarzonk")[0] == "foo")

    // set
    var emptyIntSet: Set<Int> = set()
    assert(!emptyIntSet)
    // assert(set([1, 2, 3]) + set([3, 4, 5]) == set([1, 2, 3, 4, 5])) // Swift compiler bug: Enabling this test increases compilation time by roughly 1.5 seconds.
    // assert(set([set([1, 2, 3]), set([1, 2, 3]), set([2, 4, 8])]) != set([set([1, 2, 3]), set([2, 4, 9])])) // Swift compiler bug: Enabling this test increases compilation time by >60 seconds.
    // assert(set([set([1, 2, 3]), set([1, 2, 3]), set([2, 4, 8])]) == set([set([1, 2, 3]), set([2, 4, 8])])) // Swift compiler bug: Enabling this test increases compilation time by >60 seconds.
    assert(set([1, 2, 3]))
    var set1 = Set<Int>()
    assert(countElements(set1) == 0)
    set1 += 1
    assert(countElements(set1) == 1)
    assert(set1 == Set([1]))
    set1.add(2)
    assert(set1 == Set([1, 2]))
    set1.add(3)
    assert(set1 == Set([1, 2, 3]))
    set1.add(1)
    assert(set1 == Set([1, 2, 3]))
    set1.add(2)
    assert(set1 == Set([1, 2, 3]))
    set1.add(3)
    assert(set1 == Set([1, 2, 3]))
    set1.remove(2)
    assert(set1 == Set([1, 3]))
    set1.remove(2)
    assert(set1 == Set([1, 3]))
    set1 -= 2
    assert(set1 == Set([1, 3]))
    var set2 = Set([1, 8, 16, 32, 64, 128])
    assert(set2 == Set([128, 64, 32, 16, 8, 1]))
    var set3 = set1 + set2
    assert(set3 == Set([128, 64, 32, 16, 8, 1, 3]))
    var set4 = set1 - set2
    assert(set4 == Set([3]))
    set4 += set2
    assert(set4 == Set([128, 64, 32, 16, 8, 1, 3]))
    set4 -= set2
    assert(set4 == Set([3]))
    var set5 = Set(set4)
    assert(set5 == Set([3]))
    assert(set5 == set4)
    var set6 = Set([1, 2, 3]) & Set([1, 3])
    assert(set6 == Set([1, 3]))
    set6 &= set6
    assert(set6 == Set([1, 3]))
    var set7 = Set([1, 2, 3]) | Set([1, 3])
    assert(set7 == Set([1, 2, 3]))
    set7 |= set7
    assert(set7 == Set([1, 2, 3]))
    var set8: Set<Int> = [1, 2, 3]
    assert(len(set8) == 3)
    var set9 = Set([0, 1, 2])
    set9.add(3)
    set9.add(3)
    assert(set9 == Set([0, 1, 2, 3]))
    var set10 = Set([2, 4, 8, 16])
    assert(set9 + set10 == Set([0, 1, 2, 3, 4, 8, 16]))
    assert(set9 - set10 == Set([0, 1, 3]))
    assert(set9 & set10 == Set([2]))
    assert(set([1, 2, 3]).contains(1))
    assert(!set([1, 2, 3]).contains(4))

    // str.endsWith
    assert("foobar".endsWith("bar"))

    // str.split
    assert("foobar".split("") == ["foobar"])

    // str.startsWith
    assert("foobar".startsWith("foo"))

    // str.title
    assert("they're bill's friends from the UK".title() == "They're Bill's Friends From The Uk")

    // time.sleep
    time.sleep(0.001)

    // zip
    var zipped = zip([3, 4], [9, 16])
    var (l1, r1) = zipped[0]
    assert(l1 == 3 && r1 == 9)
    var (l2, r2) = zipped[1]
    assert(l2 == 4 && r2 == 16)

    // This could probably be turned into valid Python code if we implemented the StringIO module
    func fileHandleFromString(text: String) -> NSFileHandle {
        let pipe = NSPipe()
        let input = pipe.fileHandleForWriting
        input.writeData(text.dataUsingEncoding(NSUTF8StringEncoding))
        input.closeFile()
        return pipe.fileHandleForReading
    }

    // file.__iter__ , as in "for line in open(filename)"
    var filehandletest = ""
    for line in fileHandleFromString("line 1\nline 2\n") {
        filehandletest += line + "\n"
    }
    assert(filehandletest == "line 1\nline 2\n")
    assert(["line 1","line 2"] == Array(fileHandleFromString("line 1\nline 2\n")))

    assert(["line 1"] == Array(fileHandleFromString("line 1\n")))
    assert(["line 1"] == Array(fileHandleFromString("line 1")))
    assert(["line 1","", "line 3"] == Array(fileHandleFromString("line 1\n\nline 3")))
    assert(["","line 2", "line 3"] == Array(fileHandleFromString("\nline 2\nline 3")))
    assert(["","", "line 3"] == Array(fileHandleFromString("\n\nline 3")))

    // Others:
    assert("foobar"[0..<2] == "fo")
    assert("x" as Character)
}

var performTestsRequiringNetworkConnectivity = false
if performTestsRequiringNetworkConnectivity &&
    performPythonIncompatibleTests {
    var getTest = requests.get("http://httpbin.org/get")
    println("GET:")
    println(getTest.text)
    var postDataString = "…"
    var postTestWithString = requests.post("http://httpbin.org/post", postDataString)
    println("POST(str):")
    println(postTestWithString.text)
    var postDataDict = ["…": "…", "key": "value", "number": "123"]
    var postTestWithDict = requests.post("http://httpbin.org/post", postDataDict)
    println("POST(dict):")
    println(postTestWithDict.text)
}

sys.exit(0)
