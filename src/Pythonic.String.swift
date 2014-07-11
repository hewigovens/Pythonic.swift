// >>> filter(lambda s: not s.startswith("_"), dir(""))
//   capitalize
//   center
//   count
//   decode
//   encode
//   endswith
//   expandtabs
//   find
//   format
//   index
//   isalnum
//   isalpha
//   isdigit
//   islower
//   isspace
//   istitle
//   isupper
//   join
//   ljust
//   lower
//   lstrip
//   partition
//   replace
//   rfind
//   rindex
//   rjust
//   rpartition
//   rsplit
//   rstrip
//   split
//   splitlines
//   startswith
//   strip
//   swapcase
//   title
//   translate
//   upper
//   zfill

extension String : LogicValue {
    func getLogicValue() -> Bool {
        return len(self) != 0
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
}
