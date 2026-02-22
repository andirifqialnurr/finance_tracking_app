/// Analytics Models

// Spending Pattern Model
class SpendingPattern {
  final int month;
  final int year;
  final String? categoryId;
  final String? categoryName;
  final double totalSpent;
  final double budgetAllocated;
  final double percentageUsed;
  final int transactionCount;
  final List<DailySpending> dailyBreakdown;

  SpendingPattern({
    required this.month,
    required this.year,
    this.categoryId,
    this.categoryName,
    required this.totalSpent,
    required this.budgetAllocated,
    required this.percentageUsed,
    required this.transactionCount,
    required this.dailyBreakdown,
  });

  factory SpendingPattern.fromJson(Map<String, dynamic> json) {
    return SpendingPattern(
      month: json['month'] as int,
      year: json['year'] as int,
      categoryId: json['category_id'] as String?,
      categoryName: json['category_name'] as String?,
      totalSpent: (json['total_spent'] as num).toDouble(),
      budgetAllocated: (json['budget_allocated'] as num).toDouble(),
      percentageUsed: (json['percentage_used'] as num).toDouble(),
      transactionCount: json['transaction_count'] as int,
      dailyBreakdown: (json['daily_breakdown'] as List<dynamic>)
          .map((e) => DailySpending.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'year': year,
      'category_id': categoryId,
      'category_name': categoryName,
      'total_spent': totalSpent,
      'budget_allocated': budgetAllocated,
      'percentage_used': percentageUsed,
      'transaction_count': transactionCount,
      'daily_breakdown': dailyBreakdown.map((e) => e.toJson()).toList(),
    };
  }
}

class DailySpending {
  final String date;
  final double amount;
  final int transactionCount;

  DailySpending({
    required this.date,
    required this.amount,
    required this.transactionCount,
  });

  factory DailySpending.fromJson(Map<String, dynamic> json) {
    return DailySpending(
      date: json['date'] as String,
      amount: (json['amount'] as num).toDouble(),
      transactionCount: json['transaction_count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'amount': amount,
      'transaction_count': transactionCount,
    };
  }
}

// Category Comparison Model
class CategoryComparison {
  final String categoryId;
  final String categoryName;
  final int month;
  final int year;
  final double currentMonthSpending;
  final double previousMonthSpending;
  final double percentageChange;
  final String trend; // "up", "down", "stable"

  CategoryComparison({
    required this.categoryId,
    required this.categoryName,
    required this.month,
    required this.year,
    required this.currentMonthSpending,
    required this.previousMonthSpending,
    required this.percentageChange,
    required this.trend,
  });

  factory CategoryComparison.fromJson(Map<String, dynamic> json) {
    return CategoryComparison(
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      month: json['month'] as int,
      year: json['year'] as int,
      currentMonthSpending: (json['current_month_spending'] as num).toDouble(),
      previousMonthSpending: (json['previous_month_spending'] as num)
          .toDouble(),
      percentageChange: (json['percentage_change'] as num).toDouble(),
      trend: json['trend'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'month': month,
      'year': year,
      'current_month_spending': currentMonthSpending,
      'previous_month_spending': previousMonthSpending,
      'percentage_change': percentageChange,
      'trend': trend,
    };
  }
}

// Top Spending Model
class TopSpending {
  final List<TopSpendingCategory> categories;
  final DateTime startDate;
  final DateTime endDate;
  final double totalSpent;

  TopSpending({
    required this.categories,
    required this.startDate,
    required this.endDate,
    required this.totalSpent,
  });

  factory TopSpending.fromJson(Map<String, dynamic> json) {
    return TopSpending(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => TopSpendingCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      totalSpent: (json['total_spent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories.map((e) => e.toJson()).toList(),
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'total_spent': totalSpent,
    };
  }
}

class TopSpendingCategory {
  final String categoryId;
  final String categoryName;
  final double totalSpent;
  final int transactionCount;
  final double percentageOfTotal;

  TopSpendingCategory({
    required this.categoryId,
    required this.categoryName,
    required this.totalSpent,
    required this.transactionCount,
    required this.percentageOfTotal,
  });

  factory TopSpendingCategory.fromJson(Map<String, dynamic> json) {
    return TopSpendingCategory(
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      totalSpent: (json['total_spent'] as num).toDouble(),
      transactionCount: json['transaction_count'] as int,
      percentageOfTotal: (json['percentage_of_total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'total_spent': totalSpent,
      'transaction_count': transactionCount,
      'percentage_of_total': percentageOfTotal,
    };
  }
}

// Budget Performance Model
class BudgetPerformance {
  final int year;
  final double totalBudget;
  final double totalSpent;
  final double percentageUsed;
  final List<CategoryPerformance> categoryPerformances;
  final List<MonthlyPerformance> monthlyPerformances;

  BudgetPerformance({
    required this.year,
    required this.totalBudget,
    required this.totalSpent,
    required this.percentageUsed,
    required this.categoryPerformances,
    required this.monthlyPerformances,
  });

  factory BudgetPerformance.fromJson(Map<String, dynamic> json) {
    return BudgetPerformance(
      year: json['year'] as int,
      totalBudget: (json['total_budget'] as num).toDouble(),
      totalSpent: (json['total_spent'] as num).toDouble(),
      percentageUsed: (json['percentage_used'] as num).toDouble(),
      categoryPerformances: (json['category_performances'] as List<dynamic>)
          .map((e) => CategoryPerformance.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthlyPerformances: (json['monthly_performances'] as List<dynamic>)
          .map((e) => MonthlyPerformance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total_budget': totalBudget,
      'total_spent': totalSpent,
      'percentage_used': percentageUsed,
      'category_performances': categoryPerformances
          .map((e) => e.toJson())
          .toList(),
      'monthly_performances': monthlyPerformances
          .map((e) => e.toJson())
          .toList(),
    };
  }
}

class CategoryPerformance {
  final String categoryId;
  final String categoryName;
  final double budget;
  final double spent;
  final double percentageUsed;
  final String status; // "under", "near", "over"

  CategoryPerformance({
    required this.categoryId,
    required this.categoryName,
    required this.budget,
    required this.spent,
    required this.percentageUsed,
    required this.status,
  });

  factory CategoryPerformance.fromJson(Map<String, dynamic> json) {
    return CategoryPerformance(
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String,
      budget: (json['budget'] as num).toDouble(),
      spent: (json['spent'] as num).toDouble(),
      percentageUsed: (json['percentage_used'] as num).toDouble(),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'budget': budget,
      'spent': spent,
      'percentage_used': percentageUsed,
      'status': status,
    };
  }
}

class MonthlyPerformance {
  final int month;
  final String monthName;
  final double budget;
  final double spent;
  final double percentageUsed;

  MonthlyPerformance({
    required this.month,
    required this.monthName,
    required this.budget,
    required this.spent,
    required this.percentageUsed,
  });

  factory MonthlyPerformance.fromJson(Map<String, dynamic> json) {
    return MonthlyPerformance(
      month: json['month'] as int,
      monthName: json['month_name'] as String,
      budget: (json['budget'] as num).toDouble(),
      spent: (json['spent'] as num).toDouble(),
      percentageUsed: (json['percentage_used'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'month_name': monthName,
      'budget': budget,
      'spent': spent,
      'percentage_used': percentageUsed,
    };
  }
}
