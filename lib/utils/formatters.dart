import 'package:intl/intl.dart';
import '../core/constants/app_constants.dart';

/// Utility class for formatting values
class Formatters {
  Formatters._();

  // Currency Formatter
  static final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: AppConstants.currencyLocale,
    symbol: AppConstants.currencySymbol,
    decimalDigits: AppConstants.currencyDecimalDigits,
  );

  /// Format amount sebagai currency (Rp 1.000.000)
  static String formatCurrency(double amount) {
    return _currencyFormatter.format(amount);
  }

  /// Format amount sebagai currency compact (Rp 1Jt, Rp 1,5Jt)
  static String formatCurrencyCompact(double amount) {
    if (amount >= 1000000000) {
      // Billions
      return '${AppConstants.currencySymbol}${(amount / 1000000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000000) {
      // Millions
      return '${AppConstants.currencySymbol}${(amount / 1000000).toStringAsFixed(1)}Jt';
    } else if (amount >= 1000) {
      // Thousands
      return '${AppConstants.currencySymbol}${(amount / 1000).toStringAsFixed(1)}Rb';
    }
    return formatCurrency(amount);
  }

  // Date Formatters
  static final DateFormat _dateFormatDisplay = DateFormat(
    AppConstants.dateFormatDisplay,
  );
  static final DateFormat _dateFormatFull = DateFormat(
    AppConstants.dateFormatFull,
  );
  static final DateFormat _dateFormatShort = DateFormat(
    AppConstants.dateFormatShort,
  );
  static final DateFormat _dateFormatAPI = DateFormat(
    AppConstants.dateFormatAPI,
  );
  static final DateFormat _timeFormat = DateFormat(AppConstants.timeFormat);

  /// Format date untuk display (18 Feb 2026)
  static String formatDate(DateTime date) {
    return _dateFormatDisplay.format(date);
  }

  /// Format date full (Tuesday, 18 February 2026)
  static String formatDateFull(DateTime date) {
    return _dateFormatFull.format(date);
  }

  /// Format date short (18/02/2026)
  static String formatDateShort(DateTime date) {
    return _dateFormatShort.format(date);
  }

  /// Format date untuk API (2026-02-18)
  static String formatDateForAPI(DateTime date) {
    return _dateFormatAPI.format(date);
  }

  /// Format time (14:30)
  static String formatTime(DateTime dateTime) {
    return _timeFormat.format(dateTime);
  }

  /// Format date time (18 Feb 2026, 14:30)
  static String formatDateTime(DateTime dateTime) {
    return '${formatDate(dateTime)}, ${formatTime(dateTime)}';
  }

  /// Format relative date (Today, Yesterday, 2 days ago, etc)
  static String formatRelativeDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);
    final difference = today.difference(dateOnly).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '$difference days ago';
    } else if (difference < 30) {
      final weeks = (difference / 7).floor();
      return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
    } else if (difference < 365) {
      final months = (difference / 30).floor();
      return months == 1 ? '1 month ago' : '$months months ago';
    } else {
      final years = (difference / 365).floor();
      return years == 1 ? '1 year ago' : '$years years ago';
    }
  }

  // Number Formatters
  static final NumberFormat _numberFormatter = NumberFormat(
    '#,##0',
    AppConstants.currencyLocale,
  );

  /// Format number with thousand separator (1.000.000)
  static String formatNumber(num number) {
    return _numberFormatter.format(number);
  }

  /// Format percentage (75.5%)
  static String formatPercentage(double percentage, {int decimals = 1}) {
    return '${percentage.toStringAsFixed(decimals)}%';
  }

  /// Format month name from number (1 -> January)
  static String formatMonthName(int month) {
    final date = DateTime(2000, month);
    return DateFormat('MMMM').format(date);
  }

  /// Format month year (February 2026)
  static String formatMonthYear(int month, int year) {
    final date = DateTime(year, month);
    return DateFormat('MMMM yyyy').format(date);
  }

  /// Format month year short (Feb 2026)
  static String formatMonthYearShort(int month, int year) {
    final date = DateTime(year, month);
    return DateFormat('MMM yyyy').format(date);
  }

  // Parse methods

  /// Parse currency string to double (remove Rp and separators)
  static double? parseCurrency(String value) {
    try {
      // Remove currency symbol and whitespace
      String cleaned = value
          .replaceAll(AppConstants.currencySymbol, '')
          .replaceAll(' ', '')
          .replaceAll(AppConstants.thousandSeparator, '')
          .replaceAll(AppConstants.decimalSeparator, '.');
      return double.parse(cleaned);
    } catch (e) {
      return null;
    }
  }

  /// Parse date string
  static DateTime? parseDate(String value, {String? format}) {
    try {
      if (format != null) {
        return DateFormat(format).parse(value);
      }
      return DateTime.parse(value);
    } catch (e) {
      return null;
    }
  }
}
