/// Expense Model
class Expense {
  final String id;
  final String categoryId;
  final double amount;
  final DateTime date;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Expense({
    required this.id,
    required this.categoryId,
    required this.amount,
    required this.date,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  // From JSON
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'amount': amount,
      'date': date.toIso8601String(),
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // To JSON for API request
  Map<String, dynamic> toJsonRequest() {
    return {
      'category_id': categoryId,
      'amount': amount,
      'date': date.toIso8601String(),
      if (description != null) 'description': description,
    };
  }

  // Copy with
  Expense copyWith({
    String? id,
    String? categoryId,
    double? amount,
    DateTime? date,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Expense(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Expense(id: $id, categoryId: $categoryId, amount: $amount, date: $date)';
  }
}
