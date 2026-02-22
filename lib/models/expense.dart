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
      id: json['id'] as String? ?? '',
      categoryId: json['category_id'] as String? ?? '',
      amount: (json['amount'] as num? ?? 0).toDouble(),
      date: json['date'] != null
          ? DateTime.parse(json['date'] as String)
          : DateTime.now(),
      description: json['description'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : DateTime.now(),
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

/// Budget alert returned after creating an expense (when threshold triggered)
class ExpenseBudgetAlert {
  final String level; // "warning" or "critical"
  final String message;
  final double percentageUsed;

  ExpenseBudgetAlert({
    required this.level,
    required this.message,
    required this.percentageUsed,
  });

  factory ExpenseBudgetAlert.fromJson(Map<String, dynamic> json) {
    return ExpenseBudgetAlert(
      level: json['level'] as String,
      message: json['message'] as String,
      percentageUsed: (json['percentage_used'] as num).toDouble(),
    );
  }
}

/// Response from POST /expenses
class ExpenseCreateResponse {
  final Expense expense;
  final double budgetRemaining;
  final ExpenseBudgetAlert? alert;

  ExpenseCreateResponse({
    required this.expense,
    required this.budgetRemaining,
    this.alert,
  });

  factory ExpenseCreateResponse.fromJson(Map<String, dynamic> json) {
    // Backend returns the expense object directly in data (not wrapped in 'expense' key)
    // budget_remaining and alert are not returned by this backend
    return ExpenseCreateResponse(
      expense: Expense.fromJson(json),
      budgetRemaining: (json['budget_remaining'] as num?)?.toDouble() ?? 0.0,
      alert: json['alert'] != null
          ? ExpenseBudgetAlert.fromJson(json['alert'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Paginated expense list response
class ExpensePaginatedResponse {
  final List<Expense> data;
  final ExpensePaginationMeta? pagination;
  final ExpenseSummary? summary;

  ExpensePaginatedResponse({required this.data, this.pagination, this.summary});

  factory ExpensePaginatedResponse.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    final List<dynamic> dataList = rawData is List ? rawData : [];
    return ExpensePaginatedResponse(
      data: dataList
          .map((e) => Expense.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] != null
          ? ExpensePaginationMeta.fromJson(
              json['pagination'] as Map<String, dynamic>,
            )
          : null,
      summary: json['summary'] != null
          ? ExpenseSummary.fromJson(json['summary'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Pagination metadata for expenses
class ExpensePaginationMeta {
  final int page;
  final int limit;
  final int total;
  final int totalPages;

  ExpensePaginationMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
  });

  factory ExpensePaginationMeta.fromJson(Map<String, dynamic> json) {
    return ExpensePaginationMeta(
      page: json['page'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
    );
  }
}

/// Summary returned alongside expense list
class ExpenseSummary {
  final double totalAmount;
  final int count;

  ExpenseSummary({required this.totalAmount, required this.count});

  factory ExpenseSummary.fromJson(Map<String, dynamic> json) {
    return ExpenseSummary(
      totalAmount: (json['total_amount'] as num).toDouble(),
      count: json['count'] as int,
    );
  }
}
