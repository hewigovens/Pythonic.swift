// Python docs: https://docs.python.org/2/library/sys.html
//
// >>> filter(lambda s: not s.startswith("_"), dir(sys))
//   api_version
//   argv
//   builtin_module_names
//   byteorder
//   call_tracing
//   callstats
//   copyright
//   displayhook
//   dont_write_bytecode
//   exc_clear
//   exc_info
//   exc_type
//   excepthook
//   exec_prefix
//   executable
//   exit
//   exitfunc
//   flags
//   float_info
//   float_repr_style
//   getcheckinterval
//   getdefaultencoding
//   getdlopenflags
//   getfilesystemencoding
//   getprofile
//   getrecursionlimit
//   getrefcount
//   getsizeof
//   gettrace
//   hexversion
//   last_traceback
//   last_type
//   last_value
//   long_info
//   maxint
//   maxsize
//   maxunicode
//   meta_path
//   modules
//   path
//   path_hooks
//   path_importer_cache
//   platform
//   prefix
//   ps1
//   ps2
//   py3kwarning
//   real_prefix
//   setcheckinterval
//   setdlopenflags
//   setprofile
//   setrecursionlimit
//   settrace
//   stderr
//   stdin
//   stdout
//   subversion
//   version
//   version_info
//   warnoptions

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

    class func exit(exitCode: Int) {
        Darwin.exit(Int32(exitCode))
    }
}
