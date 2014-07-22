// Python docs: https://docs.python.org/2/library/stdtypes.html
//
// Most frequently used:
//   15 file.close
//    9 file.name
//    8 file.readline
//    7 file.write
//    2 file.read
//    1 file.writelines
//    1 file.readlines
//    1 file.fileno
//
// >>> filter(lambda s: not s.startswith("_"), dir(open("/tmp/foo")))
//   close: TODO.
//   closed
//   encoding
//   errors
//   fileno
//   flush: TODO.
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
//   write: TODO.
//   writelines
//   xreadlines

import Foundation

typealias file = NSFileHandle

extension NSFileHandle {
    func read() -> String {
        let data: NSData = self.readDataToEndOfFile()
        return NSString(data: data, encoding: NSUTF8StringEncoding) as String
    }

    func readLines() -> [String] {
        return self.read().strip().split("\n")
    }

    func readlines() -> [String] {
        return self.readLines()
    }

    func close() {
        self.closeFile()
    }
}

extension NSFileHandle : Sequence {

    func availableText () -> String? {
        let data: NSData = self.availableData
        if data.length == 0 {
            return nil
        } else {
            return NSString(data: data, encoding: NSUTF8StringEncoding) as String
        }
    }

    func generate() -> _FileHandle_Generator {
        return _FileHandle_Generator(filehandle: self)
    }
}

// The Swift compiler (Beta 3) crashes when this is contained in the extension,
// but this should definitely be moved to the "generate" function when that is fixed.
class _FileHandle_Generator : Generator {
    let filehandle : NSFileHandle
    var cache = ""

    init (filehandle : NSFileHandle) {
        self.filehandle = filehandle
    }

    func next () -> String? {
        let (nextline, returnedseparator, remainder) = cache.partition("\n")
        let newlinewasfound = returnedseparator != ""
        cache = remainder

        if newlinewasfound {
            return nextline
        } else {
            if let newcache = filehandle.availableText() {
                cache = nextline + newcache
                return next()
            } else {
                return nextline == "" ? nil : nextline
            }
        }
    }
}
