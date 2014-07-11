class time {
    class func time() -> Double {
        let now = NSDate()
        return now.timeIntervalSince1970
    }
}
