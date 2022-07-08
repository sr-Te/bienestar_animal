import 'package:intl/intl.dart';

const myMonths = [
  'Ene',
  'Feb',
  'Mar',
  'Abr',
  'May',
  'Jun',
  'Jul',
  'Ago',
  'Sep',
  'Oct',
  'Nov',
  'Dic'
];

class StringUtils {
  // static String formatDateTime(DateTime dateTime) =>
  //     DateFormat('MM/dd').format(dateTime);

  static String getTimeAgo(Duration duration) {
    if (duration.inDays != 0) {
      return "${duration.inDays} ${duration.inDays > 1 ? "Días" : "Día"}";
    } else if (duration.inHours != 0) {
      return "${duration.inHours} Horas";
    } else if (duration.inMinutes != 0) {
      return "${duration.inMinutes.remainder(60)} Minutos";
    } else {
      return "${(duration.inSeconds.remainder(60))} Segundos";
    }
  }

  static String formatDateTime(DateTime dateTime) {
    return '${DateFormat('dd').format(dateTime)} ${myMonths[dateTime.month - 1]}';
  }
}
