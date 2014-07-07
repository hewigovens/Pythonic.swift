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
