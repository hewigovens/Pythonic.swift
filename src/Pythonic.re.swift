// >>> filter(lambda s: not s.startswith("_"), dir(re))
//   DEBUG
//   DOTALL
//   I
//   IGNORECASE
//   L
//   LOCALE
//   M
//   MULTILINE
//   S
//   Scanner
//   T
//   TEMPLATE
//   U
//   UNICODE
//   VERBOSE
//   X
//   compile
//   copy_reg
//   error
//   escape
//   findall
//   finditer
//   match
//   purge
//   search
//   split
//   sre_compile
//   sre_parse
//   sub
//   subn
//   sys
//   template

class re {
    class func search(pattern: String, _ string: String) -> [String] {
        var returnedMatches: [String] = []
        if pattern == "" {
            return returnedMatches
        }
        if let regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: nil) {
            if let matches: [AnyObject] = regex.matchesInString(string, options: nil, range: NSMakeRange(0, countElements(string))) {
                let regexpMatches = Swift.reinterpretCast(matches) as [NSTextCheckingResult]
                for match: NSTextCheckingResult in regexpMatches {
                    returnedMatches += string[match.range]
                }
            }
        }
        return returnedMatches
    }
}
