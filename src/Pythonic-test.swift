#!/usr/bin/env xcrun swift -i -I .

import Pythonic

// ** (power operator)
assert(2**2 == 4)
assert(2.0**2.0 == 4)
assert(1 + 2**2 + 2 == 7)
assert(1 + 2.0**2.0 + 2 == 7)
assert(1**1 + 2.0**2.0 + 2 == 7)

// abs
assert(abs(-1) == 1)

// all
assert(all(["foo", "bar", "zonk"]))
assert(all([true, true, true]))
assert(!all(["", "bar", "zonk"]))
assert(!all([false, false, false]))
assert(!all([false, false, true]))

// any
assert(any(["", "foo", "bar", "zonk"]))
assert(any([false, false, true]))
assert(!any([false, false, false]))

// bool
assert(!bool(""))
assert(bool("foo"))
assert(!bool(0))
assert(bool(1))
assert(bool([1]))

// chr
assert(chr(97) == "a")
assert(chr(ord("b")) == "b")

// cmp
assert(cmp("bar", "bar") == 0)
assert(cmp("bar", "foo") == -1)
assert(cmp("foo", "bar") == 1)
assert(cmp(0, 0) == 0)
assert(cmp(0, 1) == -1)
assert(cmp(1, 0) == 1)

// double.is_integer/isInteger
assert(1.0.is_integer())
assert(!1.1.is_integer())

// file
// TODO: Missing test.

// float
assert(!float(0.0))
assert(float(0.00000001))
assert(float(1.0))

// float.is_integer
assert(float(1.0).is_integer())
assert(!float(1.1).is_integer())

// hex
assert(hex(0) == "0x0")
assert(hex(1) == "0x1")
assert(hex(10) == "0xa")
assert(hex(100) == "0x64")
assert(hex(1000) == "0x3e8")

// int
assert(int(1.1) == 1)

// len
assert(len("") == 0)
assert(len("foo") == 3)
assert(len(["foo", "bar", "baz"]) == 3)
assert(len(["foo", "bar"]) == 2)
assert(len(["foo"]) == 1)

// list
assert(list([1, 2, 3]).count(1) == 1)

// list.count
assert([1, 2, 2, 3, 3, 3].count(1) == 1)
assert([1, 2, 2, 3, 3, 3].count(2) == 2)
assert([1, 2, 2, 3, 3, 3].count(3) == 3)

// list.index
assert(["foo", "bar", "zonk"].index("zonk") == 2)
assert([1, 2, 3].index(3) == 2)
assert(list(["a", "b", "c"]).index("b") == 1)

// long
assert(long(1.1) == 1)

// math.sqrt
assert(math.sqrt(9) == 3)
assert(math.pow(2, 2) == 4)

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

// ord
assert(ord("a") == 97)
assert(ord(chr(98)) == 98)

// os.path.exists
assert(os.path.exists("/tmp/"))
assert(!os.path.exists("/tmp.foo/"))

// random.random
assert(random.random() < 1)

// random.randint
assert(random.randint(0, 10) <= 10)

// random.randrange
assert(random.randrange(0, 10) <= 9)

// range
assert(range(10) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
assert(range(1, 11) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
assert(range(0) == [])
assert(range(1, 0) == [])
assert(range(0, 5, -1) == [])
assert(range(0, 10, 2) == [0, 2, 4, 6, 8])
assert(range(0, 50, 7) == [0, 7, 14, 21, 28, 35, 42, 49])

// re.search
assert(!re.search("^bar", "foobarzonk"))
assert(!re.search("hello", "foobarzonk"))
assert(re.search("^foo", "foobarzonk"))
assert(re.search("^foo.*zonk$", "foobarzonk"))
assert(re.search("foo", "foobarzonk"))
assert(re.search("o", "foobarzonk"))

// round
assert(round(1.1) == 1)

// set
assert(set([1, 2, 3]) - set([3, 4, 5]) == set([1, 2]))
assert(set([1, 2, 3]) & set([3, 4, 5]) == set([3]))
assert(set([1, 2, 3]) | set([3, 4, 5]) == set([1, 2, 3, 4, 5]))
assert(set([1, 2, 3]))
assert(set([1, 2]))
assert(set([1]))

// str
assert(str(123) == "123")

// str.lower
assert("FooBar".lower() == "foobar")

// str.replace
assert("fzzbar".replace("z", "o") == "foobar")

// str.strip
assert("  \n   foobar       \n   ".strip() == "foobar")
assert(" foobar ".strip() == "foobar")
assert("".strip() == "")
assert("foobar".strip() == "foobar")

// str.capitalize
assert("".capitalize() == "")
assert("f".capitalize() == "F")
assert("fo".capitalize() == "Fo")
assert("foo baR".capitalize() == "Foo bar")
assert("foo".capitalize() == "Foo")

// str.count
assert("foo".count("f") == 1)
assert("foo".count("o") == 2)
assert("foo".count("b") == 0)

// str.endswith
assert("foobar".endswith("bar"))

// str.join
assert(":".join(["foo", "bar", "baz"]) == "foo:bar:baz")

// str.split
assert("foo:bar:baz".split(":") == ["foo", "bar", "baz"])
assert("foo bar".split(" ") == ["foo", "bar"])

// str.startswith
assert("foobar".startswith("foo"))

// str.title
assert("foo bar".title() == "Foo Bar")

// str.upper
assert("FooBar".upper() == "FOOBAR")

// sum
assert(sum([1, 2, 3]) == 6)
assert(sum([1, 2, 3], 1) == 7)
assert(sum([1.1, 1.2]) == 2.3)

// sys.argv
assert(sys.argv[0].startswith("./Pythonic-test"))
assert(sys.argv[1] == "arg1")
assert(sys.argv[2] == "arg2")
assert(len(sys.argv) == 3)

// time.time
assert(time.time() > 1405028001.224846)

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

    // NOTE: To allow for re.search(…).group(…)
    func group(i: Int) -> Array.Element? {
        if self.count == 0 || i < 0 || i >= self.count {
            return nil
        }
        return self[i]
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

let pythonIncompatibleTests = true
if pythonIncompatibleTests {
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
    assert(re.search("", "foobarzonk") == [])

    // re.search.group
    assert(re.search("^foo", "foobarzonk").group(0) == "foo")

    // set
    assert(!set<int>())
    assert(set([1, 2, 3]) + set([3, 4, 5]) == set([1, 2, 3, 4, 5]))
    assert(set([set([1, 2, 3]), set([1, 2, 3]), set([2, 4, 8])]) != set([set([1, 2, 3]), set([2, 4, 9])]))
    assert(set([set([1, 2, 3]), set([1, 2, 3]), set([2, 4, 8])]) == set([set([1, 2, 3]), set([2, 4, 8])]))
    assert(set<int>([1, 2, 3]))
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

    // Others:
    assert("foobar"[0..<2] == "fo")
    assert("x" as Character)
}

sys.exit(0)
