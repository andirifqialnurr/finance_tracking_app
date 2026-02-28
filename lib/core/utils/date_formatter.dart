import 'package:intl/intl.dart';

/// Format tanggal sesuai konvensi Indonesia
class DateFormatter {
  static final DateFormat _dateShort = DateFormat('dd MMM yyyy', 'id_ID');
  static final DateFormat _dateLong = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
  static final DateFormat _monthYear = DateFormat('MMMM yyyy', 'id_ID');
  static final DateFormat _timeOnly = DateFormat('HH:mm', 'id_ID');
  static final DateFormat _dateTime = DateFormat('dd MMM yyyy, HH:mm', 'id_ID');

  /// "28 Feb 2026"
  static String shortDate(DateTime date) => _dateShort.format(date);

  /// "Sabtu, 28 Februari 2026"
  static String longDate(DateTime date) => _dateLong.format(date);

  /// "Februari 2026"
  static String monthYear(DateTime date) => _monthYear.format(date);

  /// "Februari 2026" dari month int dan year int
  static String monthYearFromInts(int month, int year) =>
      _monthYear.format(DateTime(year, month));

  /// "14:30"
  static String time(DateTime date) => _timeOnly.format(date);

  /// "28 Feb 2026, 14:30"
  static String dateTime(DateTime date) => _dateTime.format(date);

  /// Relative time: "Baru saja", "2 jam lalu", "kemarin", "28 Feb 2026"
  static String relative(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) return 'Baru saja';
    if (diff.inMinutes < 60) return '${diff.inMinutes} menit lalu';
    if (diff.inHours < 24) return '${diff.inHours} jam lalu';
    if (diff.inDays == 1) return 'Kemarin';
    if (diff.inDays < 7) return '${diff.inDays} hari lalu';
    return shortDate(date);
  }

  /// Nama bulan pendek dari index (1-12) → "Jan", "Feb", …
  static String shortMonthName(int month) {
    const names = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    if (month < 1 || month > 12) return '';
    return names[month - 1];
  }
}
