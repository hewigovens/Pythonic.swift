// >>> filter(lambda s: re.match("^[a-z]", s), dir(random))
//   betavariate: TODO.
//   choice: Added.
//   division: TODO.
//   expovariate: TODO.
//   gammavariate: TODO.
//   gauss: TODO.
//   getrandbits: TODO.
//   getstate: TODO.
//   jumpahead: TODO.
//   lognormvariate: TODO.
//   normalvariate: TODO.
//   paretovariate: TODO.
//   randint: Added.
//   random: Added.
//   randrange: Added.
//   sample: TODO.
//   seed: TODO.
//   setstate: TODO.
//   shuffle: TODO.
//   triangular: TODO.
//   uniform: TODO.
//   vonmisesvariate: TODO.
//   weibullvariate: TODO.

class random {
    class func random() -> Double {
        return Double(arc4random_uniform(UInt32.max)) / Double(UInt32.max)
    }

    class func randInt(min: Int, _ max: Int) -> Int {
        return Int(Pythonic.random.random() * Double(max - min + 1)) + min
    }

    class func randint(min: Int, _ max: Int) -> Int {
        return Pythonic.random.randInt(min, max)
    }

    class func randRange(start: Int, _ stop: Int) -> Int {
        return Pythonic.random.randInt(start, stop - 1)
    }

    class func randrange(start: Int, _ stop: Int) -> Int {
        return Pythonic.random.randRange(start, stop)
    }

    class func choice<R : Sequence where R.GeneratorType.Element : Comparable>(sequence: R) -> R.GeneratorType.Element {
        var tmpArr: [R.GeneratorType.Element] = []
        for element in sequence {
            tmpArr.append(element)
        }
        return tmpArr[Pythonic.random.randRange(0, len(tmpArr))]
    }
}