// Python docs: https://docs.python.org/2/library/datetime.html
//
// Most frequently used:
// 336 datetime.now
// 173 datetime.timedelta
// 102 datetime.date
//  41 datetime.today
//  20 datetime.strptime
//  17 datetime.fromtimestamp
//  14 datetime.time
//  10 datetime.combine
//   6 datetime.utcnow
//   3 datetime.tzinfo
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

import Foundation

typealias datetime = NSDate

extension NSDate {
    class func utcnow() -> NSDate {
        return NSDate()
    }
}
