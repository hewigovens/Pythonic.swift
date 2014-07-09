class re {
    class func search(pattern: String, _ string: String) -> [String] {
        var returnedMatches: [String] = []
        if pattern == "" {
            return returnedMatches
        }
        if let regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: nil) {
            if let matches = regex.matchesInString(string, options: nil, range: NSMakeRange(0, countElements(string))) as? [NSTextCheckingResult] {
                returnedMatches = matches.map {string[$0.range]}
            }
        }
        return returnedMatches
    }
}
