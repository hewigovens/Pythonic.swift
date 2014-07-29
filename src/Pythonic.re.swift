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

public class RegularExpressionMatch: LogicValue {
    private var matchedStrings: [String] = []

    public init(_ matchedStrings: [String]) {
        self.matchedStrings.extend(matchedStrings)
    }

    public func groups() -> [String] {
        var newArr: [String] = []
        for i in 1..<len(self.matchedStrings) {
            newArr += self.matchedStrings[i]
        }
        return newArr
    }

    public func group(i: Int) -> String? {
        return self.matchedStrings[i]
    }

    public func getLogicValue() -> Bool {
        return self.matchedStrings.count != 0
    }

    public func __conversion() -> [String] {
        return self.matchedStrings
    }

    public subscript (index: Int) -> String? {
        return self.group(index)
    }
}

public class re {
    public class func search(pattern: String, _ string: String) -> RegularExpressionMatch {
        var matchedStrings: [String] = []
        if pattern == "" {
            return RegularExpressionMatch(matchedStrings)
        }
        // NOTE: Must use NSString:s below to avoid off-by-one issues when countElements(swiftString) != nsString.length.
        //       Example case: countElements("\r\n") [1] != ("\r\n" as NSString).length [2]
        if let regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: nil) {
            if let matches = regex.matchesInString(string, options: nil, range: NSMakeRange(0, (string as NSString).length)) as? [NSTextCheckingResult] {
                for match in matches {
                    for i in 0..<match.numberOfRanges {
                        var range = match.rangeAtIndex(i)
                        var matchString = (string as NSString).substringWithRange(range)
                        matchedStrings += matchString
                    }
                }
            }
        }
        return RegularExpressionMatch(matchedStrings)
    }

    public class func match(pattern: String, _ string: String) -> RegularExpressionMatch {
        return re.search(pattern.startsWith("^") ? pattern : "^" + pattern, string)
    }

    public class func split(pattern: String, _ string: String) -> [String] {
        if pattern == "" {
            return [string]
        }
        var returnedMatches: [String] = []
        // NOTE: Must use NSString:s below to avoid off-by-one issues when countElements(swiftString) != nsString.length.
        //       Example case: countElements("\r\n") [1] != ("\r\n" as NSString).length [2]
        if let regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: nil) {
            if let matches = regex.matchesInString(string, options: nil, range: NSMakeRange(0, (string as NSString).length)) as? [NSTextCheckingResult] {
                var lastLocation = 0
                for match in matches {
                    var matchedString = (string as NSString).substringWithRange(NSMakeRange(lastLocation, match.range.location - lastLocation))
                    returnedMatches += matchedString
                    lastLocation = match.range.location + match.range.length
                }
                var matchedString = (string as NSString).substringWithRange(NSMakeRange(lastLocation, (string as NSString).length - lastLocation))
                returnedMatches += matchedString
            }
        }
        return returnedMatches
    }

    public class func sub(pattern: String, _ repl: String, _ string: String) -> String {
        if let regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: nil) {
            return regex.stringByReplacingMatchesInString(string, options: nil, range: NSMakeRange(0, (string as NSString).length), withTemplate: repl)
        }
        return string
    }
}
