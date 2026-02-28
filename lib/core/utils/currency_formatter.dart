import 'package:intl/intl.dart';

/// Format angka ke currency IDR: "Rp 1.500.000"
class CurrencyFormatter {
  static final NumberFormat _fmt = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  /// Format double ke string IDR. Contoh: 1500000 → "Rp 1.500.000"
  static String format(double amount) => _fmt.format(amount);

  /// Format dengan tanda (+/-) untuk net flow. Contoh: +Rp 1.500.000
  static String formatSigned(double amount) {
    final formatted = _fmt.format(amount.abs());
    return amount >= 0 ? '+$formatted' : '-$formatted';
  }

  /// Parse string IDR kembali ke double. Contoh: "1.500.000" → 1500000
  static double? parse(String text) {
    final cleaned = text
        .replaceAll('.', '')
        .replaceAll(',', '')
        .replaceAll('Rp', '')
        .trim();
    return double.tryParse(cleaned);
  }
}
