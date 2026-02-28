/// Koleksi validator untuk form input
class Validators {
  /// Pastikan field tidak kosong
  static String? required(String? value, {String fieldName = 'Field ini'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName tidak boleh kosong';
    }
    return null;
  }

  /// Validasi angka positif
  static String? positiveAmount(String? value) {
    if (value == null || value.trim().isEmpty)
      return 'Jumlah tidak boleh kosong';
    final cleaned = value.replaceAll('.', '').replaceAll(',', '').trim();
    final amount = double.tryParse(cleaned);
    if (amount == null) return 'Format angka tidak valid';
    if (amount <= 0) return 'Jumlah harus lebih dari 0';
    return null;
  }

  /// Validasi panjang minimal
  static String? minLength(
    String? value,
    int min, {
    String fieldName = 'Field ini',
  }) {
    if (value == null || value.trim().length < min) {
      return '$fieldName minimal $min karakter';
    }
    return null;
  }

  /// Validasi format hex color (#RRGGBB)
  static String? hexColor(String? value) {
    if (value == null || value.isEmpty) return null; // opsional
    final regex = RegExp(r'^#[0-9A-Fa-f]{6}$');
    if (!regex.hasMatch(value)) return 'Format warna harus #RRGGBB';
    return null;
  }

  /// Kombinasi required + positiveAmount untuk field jumlah uang
  static String? amountField(String? value) {
    return positiveAmount(value);
  }
}
