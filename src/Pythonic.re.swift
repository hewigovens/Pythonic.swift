// Python docs: https://docs.python.org/2/library/re.html
//
// Most frequently used:
//  346 re.search
//  252 re.match
//  218 re.compile
//  217 re.sub
//   28 re.split
//   26 re.findall
//   26 re.IGNORECASE
//   17 re.escape
//   16 re.VERBOSE
//    9 re.finditer
//
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

import Foundation

class re {
    class func search(pattern: String, _ string: String) -> [String] {
        var returnedMatches: [String] = []
        if pattern == "" {
            return returnedMatches
        }
        if let regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: nil) {
            let range = NSRange(location: 0, length: countElements(string))
            if let matches = regex.matchesInString(string, options: nil, range: range) as? [NSTextCheckingResult] {
                returnedMatches = matches.map { string[$0.range] }
            }
        }
        return returnedMatches
    }
}
