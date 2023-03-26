
import 'package:intl/intl.dart';

class TimeUtils {
  static String formatToWeekMonthDay(DateTime dateTime) {
    final format = DateFormat.MMMEd().format(dateTime);
    return format;
  }

  static String formatToWeek(DateTime dateTime) {
    final format = DateFormat.E().format(dateTime);
    return format;
  }

  static String formatDate(DateTime dateTime) {
    final format = DateFormat.yMMMMd().format(dateTime).toString();
    return format;
  }
}