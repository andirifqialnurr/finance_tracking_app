/// Income Model
class Income {
  final String id;
  final String source;
  final double amount;
  final DateTime date;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Income({
    required this.id,
    required this.source,
    required this.amount,
    required this.date,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  // From JSON
  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      id: json['id'] as String,
      source: json['source'] as String,
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
      'source': source,
      'amount': amount,
      'date': date.toIso8601String(),
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // To JSON for API request (without id, createdAt, updatedAt)
  Map<String, dynamic> toJsonRequest() {
    return {
      'source': source,
      'amount': amount,
      'date': date.toIso8601String(),
      if (description != null) 'description': description,
    };
  }

  // Copy with
  Income copyWith({
    String? id,
    String? source,
    double? amount,
    DateTime? date,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Income(
      id: id ?? this.id,
      source: source ?? this.source,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Income(id: $id, source: $source, amount: $amount, date: $date)';
  }
}

/// Income with allocations (response from create income API)
class IncomeWithAllocations {
  final Income income;
  final List<AllocationBreakdown> allocations;

  IncomeWithAllocations({required this.income, required this.allocations});

  factory IncomeWithAllocations.fromJson(Map<String, dynamic> json) {
    return IncomeWithAllocations(
      income: Income.fromJson(json['income'] as Map<String, dynamic>),
      allocations: (json['allocations'] as List)
          .map((e) => AllocationBreakdown.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Allocation breakdown
class AllocationBreakdown {
  final String categoryId;
  final String categoryName;
  final double allocated;

  AllocationBreakdown({
    required this.categoryId,
    required this.categoryName,
    required this.allocated,
  });

  factory AllocationBreakdown.fromJson(Map<String, dynamic> json) {
    return AllocationBreakdown(
      categoryId: json['category_id'] as String,
      categoryName: json['category'] as String,
      allocated: (json['allocated'] as num).toDouble(),
    );
  }
}
