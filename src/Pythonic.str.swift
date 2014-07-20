// Python docs: https://docs.python.org/2/library/string.html
//
// Most frequently used:
//   19 str.replace
//    9 str.split
//    4 str.join
//    2 str.startswith
//    2 str.lower
//    1 str.upper
//    1 str.strip
//    1 str.decode
//
// >>> filter(lambda s: not s.startswith("_"), dir(""))
//   capitalize: Added.
//   center: TODO.
//   count: Added.
//   decode: TODO.
//   encode: TODO.
//   endswith: Added.
//   expandtabs: TODO.
//   find: TODO.
//   format: TODO.
//   index: TODO.
//   isalnum: TODO.
//   isalpha: TODO.
//   isdigit: TODO.
//   islower: Added.
//   isspace: TODO.
//   istitle: TODO.
//   isupper: TODO.
//   join: Already in Swift.
//   ljust: TODO.
//   lower: TODO.
//   lstrip: TODO.
//   partition: Added.
//   replace: Added.
//   rfind: TODO.
//   rindex: TODO.
//   rjust: TODO.
//   rpartition: TODO.
//   rsplit: TODO.
//   rstrip: TODO.
//   split: Added.
//   splitlines: TODO.
//   startswith: Added.
//   strip: Added.
//   swapcase: TODO.
//   title: Added.
//   translate: TODO.
//   upper: Added.
//   zfill: TODO.

import Foundation

typealias str = Swift.String

extension String : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
    }

    func count(c: Character) -> Int {
        var counter = 0
        for ch in self {
            if ch == c {
                counter += 1
            }
        }
        return counter
    }

    func capitalize() -> String {
        if len(self) == 0 {
            return self
        }
        return self[0].upper() + self[1..<len(self)].lower()
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

    // TODO: More arguments. string.split(s[, sep[, maxsplit]])¶
    func split(sep: String) -> [String] {
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
    
    /// Split the string at the first occurrence of sep, and return a 3-tuple containing the part before the separator, the separator itself, and the part after the separator. If the separator is not found, return a 3-tuple containing the string itself, followed by two empty strings.
    func partition(separator: String) -> (String, String, String) {
        let separatorrange = self.rangeOfString(separator)
        if separatorrange.isEmpty {
            return (self,"","")
        } 
        let firstpart = self[self.startIndex ..< separatorrange.startIndex]
        let secondpart = self[separatorrange.endIndex ..< self.endIndex]
        
        return (firstpart, separator, secondpart)
    }
}
