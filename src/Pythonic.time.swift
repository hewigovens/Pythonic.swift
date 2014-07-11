// >>> filter(lambda s: not s.startswith("_"), dir(time))
//   accept2dyear
//   altzone
//   asctime
//   clock
//   ctime
//   daylight
//   gmtime
//   localtime
//   mktime
//   sleep
//   strftime
//   strptime
//   struct_time
//   time
//   timezone
//   tzname
//   tzset

class time {
    class func time() -> Double {
        let now = NSDate()
        return now.timeIntervalSince1970
    }
}
