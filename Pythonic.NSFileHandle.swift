extension NSFileHandle {
    func read() -> String {
        let data: NSData = self.readDataToEndOfFile()
        return NSString(data: data, encoding: NSUTF8StringEncoding) as String
    }

    func readLines() -> String[] {
        return self.read().strip().split("\n")
    }

    func readlines() -> String[] {
        return self.readLines()
    }
}
