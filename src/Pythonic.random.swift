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
        return randRange(start, stop)
    }

    class func choice<R : Sequence where R.GeneratorType.Element : Comparable>(sequence: R) -> R.GeneratorType.Element {
        var tmpArr: [R.GeneratorType.Element] = []
        for element in sequence {
            tmpArr.append(element)
        }
        return tmpArr[Pythonic.random.randRange(0, len(tmpArr))]
    }
}
