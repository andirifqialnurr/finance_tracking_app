import 'expense_category.dart';

/// Represents a single transaction (income or expense) returned by
/// GET /api/v1/transactions
class Transaction {
  final String id;
  final String type; // 'income' or 'expense'
  final double amount;
  final DateTime date;
  final String? description;

  /// Only present when type == 'income'
  final String? source;

  /// Only present when type == 'expense'
  final ExpenseCategory? category;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    this.description,
    this.source,
    this.category,
  });

  bool get isIncome => type == 'income';
  bool get isExpense => type == 'expense';

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? 'expense',
      amount: (json['amount'] as num? ?? 0).toDouble(),
      date: json['date'] != null
          ? DateTime.parse(json['date'] as String)
          : DateTime.now(),
      description: json['description'] as String?,
      source: json['source'] as String?,
      category: json['category'] != null
          ? ExpenseCategory.fromJson(json['category'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'amount': amount,
    'date': date.toIso8601String(),
    if (description != null) 'description': description,
    if (source != null) 'source': source,
    if (category != null) 'category': category!.toJson(),
  };
}

/// Summary statistics returned alongside the transaction list
class TransactionSummary {
  final double totalIncome;
  final double totalExpense;
  final double netBalance;

  TransactionSummary({
    required this.totalIncome,
    required this.totalExpense,
    required this.netBalance,
  });

  factory TransactionSummary.fromJson(Map<String, dynamic> json) {
    return TransactionSummary(
      totalIncome: (json['total_income'] as num? ?? 0).toDouble(),
      totalExpense: (json['total_expense'] as num? ?? 0).toDouble(),
      netBalance: (json['net_balance'] as num? ?? 0).toDouble(),
    );
  }
}

/// Pagination metadata for paginated transaction responses
class TransactionPaginationMeta {
  final int page;
  final int limit;
  final int total;
  final int totalPages;

  TransactionPaginationMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
  });

  factory TransactionPaginationMeta.fromJson(Map<String, dynamic> json) {
    return TransactionPaginationMeta(
      page: json['page'] as int? ?? 1,
      limit: json['limit'] as int? ?? 20,
      total: json['total'] as int? ?? 0,
      totalPages: json['total_pages'] as int? ?? 1,
    );
  }
}

/// Wraps the transaction list + pagination + summary as returned by the API
class TransactionPaginatedResponse {
  final List<Transaction> transactions;
  final TransactionPaginationMeta pagination;
  final TransactionSummary summary;

  TransactionPaginatedResponse({
    required this.transactions,
    required this.pagination,
    required this.summary,
  });

  factory TransactionPaginatedResponse.fromJson(Map<String, dynamic> json) {
    // The backend returns data as a nested object:
    // { "data": { "transactions": [...], "pagination": {...}, "summary": {...} } }
    // However, guard against a flat list in data as well.
    final raw = json['data'];
    late List<dynamic> rawList;
    late Map<String, dynamic> paginationMap;
    late Map<String, dynamic> summaryMap;

    if (raw is Map<String, dynamic>) {
      // Backend wraps TransactionResponse inside Response.Data, so the array
      // lives at json['data']['data'], not json['data']['transactions']
      rawList = raw['data'] as List<dynamic>? ?? [];
      paginationMap = raw['pagination'] as Map<String, dynamic>? ?? {};
      summaryMap = raw['summary'] as Map<String, dynamic>? ?? {};
    } else {
      // Flat structure: data is the list; pagination/summary are top-level
      rawList = raw as List<dynamic>? ?? [];
      paginationMap = json['pagination'] as Map<String, dynamic>? ?? {};
      summaryMap = json['summary'] as Map<String, dynamic>? ?? {};
    }

    return TransactionPaginatedResponse(
      transactions: rawList
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: TransactionPaginationMeta.fromJson(paginationMap),
      summary: TransactionSummary.fromJson(summaryMap),
    );
  }
}
