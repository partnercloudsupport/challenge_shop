class TimeUtil {
  static bool isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  static bool isToday(DateTime d1) {
    return isSameDay(d1, DateTime.now());
  }

  static String getFormatTime(DateTime d1) {
    if (isToday(d1)) {
      return "今天 ${d1.hour}:${d1.minute}";
    } else {
      return "${d1.month}/${d1.day} ${d1.hour}:${d1.minute}";
    }
  }

  static String getFormatTime1(DateTime d1) {
    if (isToday(d1)) {
      return "今天 ${d1.hour}:${d1.minute}";
    } else {
      return "${d1.year}-${d1.month}-${d1.day} ${d1.hour}:${d1.minute}:${d1.second}";
    }
  }
}
