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
//   center: Added.
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
//   ljust: Added.
//   lower: TODO.
//   lstrip: Added.
//   partition: Added.
//   replace: Added.
//   rfind: TODO.
//   rindex: TODO.
//   rjust: Added.
//   rpartition: TODO.
//   rsplit: Added.
//   rstrip: Added.
//   split: Added.
//   splitlines: Added.
//   startswith: Added.
//   strip: Added.
//   swapcase: TODO.
//   title: Added.
//   translate: TODO.
//   upper: Added.
//   zfill: TODO.

import Foundation

public typealias str = Swift.String

extension String : LogicValue {
    public func getLogicValue() -> Bool {
        return len(self) != 0
    }

    public func count(c: Character) -> Int {
        var counter = 0
        for ch in self {
            if ch == c {
                counter += 1
            }
        }
        return counter
    }

    public func capitalize() -> String {
        if len(self) == 0 {
            return self
        }
        return self[0].upper() + self[1..<len(self)].lower()
    }

    public func endsWith(suffix: String) -> Bool {
        return self.hasSuffix(suffix)
    }

    public func endswith(suffix: String) -> Bool {
        return self.endsWith(suffix)
    }

    public func lower() -> String {
        return self.lowercaseString
    }

    public func replace(replaceOldString: String, _ withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(replaceOldString, withString: withString)
    }

    // TODO: More arguments. string.split(s[, sep[, maxsplit]])¶
    public func split(sep: String) -> [String] {
        return self.componentsSeparatedByString(sep)
    }

    public func splitlines() -> [String] {
        var normalized = self.replace("\r\n", "\n").replace("\r", "\n")
        normalized = re.sub("\n$", "", normalized)
        return re.split("\n", normalized)
    }

    public func startsWith(prefix: String) -> Bool {
        return self.hasPrefix(prefix)
    }

    public func startswith(prefix: String) -> Bool {
        return self.startsWith(prefix)
    }

    private var ASCII_UPPERCASE_SET: Set<String> {
        return Set(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"])
    }

    private var ASCII_LOWERCASE_SET: Set<String> {
        return Set(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"])
    }

    private var DIGITS_SET: Set<String> {
        return Set(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
    }

    private var ASCII_SET: Set<String> {
        return ASCII_UPPERCASE_SET + ASCII_LOWERCASE_SET
    }

    private var HEX_SET: Set<String> {
        return DIGITS_SET + Set(["a", "A", "b", "B", "c", "C", "d", "D", "e", "E", "f", "F"])
    }

    private var WHITESPACE_SET: Set<String> {
        return Set(["\t", "\n", "\r", "\u{11}", "\u{12}", " "])
    }

    public func isSpace() -> Bool {
        if self == "" {
            return false
        }
        for ch in self {
            if !WHITESPACE_SET.contains(String(ch)) {
                return false
            }
        }
        return true
    }

    public func isspace() -> Bool {
        return self.isSpace()
    }

    private var WHITESPACE_REGEXP: String {
        return "[\t\n\r\u{11}\u{12} ]"
    }

    public func lstrip() -> String {
        return re.sub("^" + self.WHITESPACE_REGEXP + "+", "", self)
    }

    public func rstrip() -> String {
        return re.sub(self.WHITESPACE_REGEXP + "+$", "", self)
    }

    public func strip() -> String {
        return self.lstrip().rstrip()
    }

    // NOTE: Not equivalent to Python, but better.
    public func title() -> String {
        return self.capitalizedString
    }

    public func upper() -> String {
        return self.uppercaseString
    }

    public subscript (index: Int) -> String {
        return String(Array(self)[index])
    }

    public subscript (range: Range<Int>) -> String {
        let start = Swift.advance(self.startIndex, range.startIndex)
        let end = Swift.advance(self.startIndex, range.endIndex)
        return self.substringWithRange(Range(start: start, end: end))
    }

    public subscript (range: NSRange) -> String {
        return self[range.location..<(range.location + range.length)]
    }

    /// Split the string at the first occurrence of sep, and return a 3-tuple containing the part before the separator, the separator itself, and the part after the separator. If the separator is not found, return a 3-tuple containing the string itself, followed by two empty strings.
    public func partition(separator: String) -> (String, String, String) {
        if let separatorRange = self.rangeOfString(separator) {
            if !separatorRange.isEmpty {
                let firstpart = self[self.startIndex ..< separatorRange.startIndex]
                let secondpart = self[separatorRange.endIndex ..< self.endIndex]
                return (firstpart, separator, secondpart)
            }
        }
        return (self,"","")
    }

    // justification
    public func ljust(width: Int, _ fillchar: Character = " ") -> String {
        let length = len(self)
        if length >= width { return self }
        return self + String(count: width - length, repeatedValue: fillchar)
    }

    public func rjust(width: Int, _ fillchar: Character = " ") -> String {
        let length = len(self)
        if length >= width { return self }
        return String(count: width - length, repeatedValue: fillchar) + self
    }

    public func center(width: Int, _ fillchar: Character = " ") -> String {
        let length = len(self)
        let oddShift = length % 2 == 1 ? 0.5 : 0.0 // Python is weird about string centering
        let left = Int((Double(width) + Double(length)) / 2.0 + oddShift)
        return self.ljust(left, fillchar).rjust(width, fillchar)
    }
}
