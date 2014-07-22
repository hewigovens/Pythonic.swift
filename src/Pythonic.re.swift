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

class RegularExpressionMatch: LogicValue {
    var matchedGroups: [String] = []

    init(_ matchedGroups: [String]) {
        if matchedGroups {
            self.matchedGroups.extend(matchedGroups)
        }
    }

    func group(i: Int) -> String? {
        return self.matchedGroups[0]
    }

    func getLogicValue() -> Bool {
        return self.matchedGroups.count != 0
    }

    func __conversion() -> [String] {
        return self.matchedGroups
    }

    subscript (index: Int) -> String? {
        return self.group(index)
    }
}

class re {
    class func search(pattern: String, _ string: String) -> RegularExpressionMatch {
        var returnedMatches: [String] = []
        if pattern == "" {
            return RegularExpressionMatch(returnedMatches)
        }
        if let regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: nil) {
            let range = NSRange(location: 0, length: countElements(string))
            if let matches = regex.matchesInString(string, options: nil, range: range) as? [NSTextCheckingResult] {
                returnedMatches = matches.map { string[$0.range] }
            }
        }
        return RegularExpressionMatch(returnedMatches)
    }
}
