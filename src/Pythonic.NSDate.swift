// Python docs: https://docs.python.org/2/library/datetime.html
//
// >>> filter(lambda s: not s.startswith("_"), dir(datetime.datetime))
//   astimezone
//   combine
//   ctime
//   date
//   day
//   dst
//   fromordinal
//   fromtimestamp
//   hour
//   isocalendar
//   isoformat
//   isoweekday
//   max
//   microsecond
//   min
//   minute
//   month
//   now
//   replace
//   resolution
//   second
//   strftime
//   strptime
//   time
//   timetuple
//   timetz
//   today
//   toordinal
//   tzinfo
//   tzname
//   utcfromtimestamp
//   utcnow
//   utcoffset
//   utctimetuple
//   weekday
//   year

extension NSDate {
    class func utcnow() -> NSDate {
        return NSDate()
    }
}

typealias datetime = NSDate
