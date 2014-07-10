class sys {
    class var argv: [String] {
        get {
            return Process.arguments
        }
    }

    class var stdin: NSFileHandle {
        get {
            return NSFileHandle.fileHandleWithStandardInput()
        }
    }
}
