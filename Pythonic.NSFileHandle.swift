extension NSFileHandle {
    func read() -> String {
        var data: NSData = self.readDataToEndOfFile()
        return NSString(data: data, encoding: NSUTF8StringEncoding) as String
    }

    func readLines() -> String[] {
        return read().strip().split("\n")
    }

    func readlines() -> String[] {
        return readLines()
    }
}
