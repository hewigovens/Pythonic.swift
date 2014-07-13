// Python docs: https://docs.python.org/2/library/stdtypes.html
//
// >>> filter(lambda s: not s.startswith("_"), dir(open("/tmp/foo")))
//   close
//   closed
//   encoding
//   errors
//   fileno
//   flush
//   isatty
//   mode
//   name
//   newlines
//   next
//   read
//   readinto
//   readline
//   readlines
//   seek
//   softspace
//   tell
//   truncate
//   write
//   writelines
//   xreadlines

extension NSFileHandle : Sequence {
    func read() -> String {
        let data: NSData = self.readDataToEndOfFile()
        return NSString(data: data, encoding: NSUTF8StringEncoding) as String
    }

    // TODO: Make this function read line-by-line instead of reading entire file at once.
    func generate() -> GeneratorOf<String> {
        var i = 0
        var lines = self.readLines().map { $0 + "\n" }
        return GeneratorOf<String> {
            if i >= len(lines) {
                return .None
            } else {
                return lines[i++]
            }
        }
    }

    func readLines() -> [String] {
        return self.read().strip().split("\n")
    }

    func readlines() -> [String] {
        return self.readLines()
    }
}
