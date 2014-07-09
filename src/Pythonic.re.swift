class re {
    class func search(pattern: String, _ string: String) -> [String] {
        var returnedMatches: [String] = []
        if pattern == "" {
            return returnedMatches
        }
        if let regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: nil) {
            let range = NSRange(location: 0, length: countElements(string))
            if let matches = regex.matchesInString(string, options: nil, range: range) as? [NSTextCheckingResult] {
                returnedMatches = matches.map {string[$0.range]}
            }
        }
        return returnedMatches
    }
}
