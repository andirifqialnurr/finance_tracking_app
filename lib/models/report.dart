/// Report Models

// Monthly Report Model
class MonthlyReport {
  final int month;
  final int year;
  final double totalIncome;
  final double totalSpent;
  final double totalBudget;
  final double remainingBudget;
  final String topCategory;
  final double topCategoryAmount;
  final List<CategorySummary> categories;

  MonthlyReport({
    required this.month,
    required this.year,
    required this.totalIncome,
    required this.totalSpent,
    required this.totalBudget,
    required this.remainingBudget,
    required this.topCategory,
    required this.topCategoryAmount,
    required this.categories,
  });

  factory MonthlyReport.fromJson(Map<String, dynamic> json) {
    return MonthlyReport(
      month: json['month'] as int,
      year: json['year'] as int,
      totalIncome: (json['total_income'] as num).toDouble(),
      totalSpent: (json['total_spent'] as num).toDouble(),
      totalBudget: (json['total_budget'] as num).toDouble(),
      remainingBudget: (json['remaining_budget'] as num).toDouble(),
      topCategory: json['top_category'] as String,
      topCategoryAmount: (json['top_category_amount'] as num).toDouble(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategorySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'year': year,
      'total_income': totalIncome,
      'total_spent': totalSpent,
      'total_budget': totalBudget,
      'remaining_budget': remainingBudget,
      'top_category': topCategory,
      'top_category_amount': topCategoryAmount,
      'categories': categories.map((e) => e.toJson()).toList(),
    };
  }
}

class CategorySummary {
  final String name;
  final double spent;
  final double budget;
  final double percentage;

  CategorySummary({
    required this.name,
    required this.spent,
    required this.budget,
    required this.percentage,
  });

  factory CategorySummary.fromJson(Map<String, dynamic> json) {
    return CategorySummary(
      name: json['name'] as String,
      spent: (json['spent'] as num).toDouble(),
      budget: (json['budget'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'spent': spent,
      'budget': budget,
      'percentage': percentage,
    };
  }
}

// Yearly Report Model
class YearlyReport {
  final int year;
  final double totalIncome;
  final double totalSpent;
  final double totalBudget;
  final double averageMonthlyIncome;
  final double averageMonthlySpending;
  final String highestSpendingMonth;
  final String lowestSpendingMonth;
  final List<MonthlySummary> monthlySummaries;

  YearlyReport({
    required this.year,
    required this.totalIncome,
    required this.totalSpent,
    required this.totalBudget,
    required this.averageMonthlyIncome,
    required this.averageMonthlySpending,
    required this.highestSpendingMonth,
    required this.lowestSpendingMonth,
    required this.monthlySummaries,
  });

  factory YearlyReport.fromJson(Map<String, dynamic> json) {
    return YearlyReport(
      year: json['year'] as int,
      totalIncome: (json['total_income'] as num).toDouble(),
      totalSpent: (json['total_spent'] as num).toDouble(),
      totalBudget: (json['total_budget'] as num).toDouble(),
      averageMonthlyIncome: (json['average_monthly_income'] as num).toDouble(),
      averageMonthlySpending: (json['average_monthly_spending'] as num)
          .toDouble(),
      highestSpendingMonth: json['highest_spending_month'] as String,
      lowestSpendingMonth: json['lowest_spending_month'] as String,
      monthlySummaries: (json['monthly_summaries'] as List<dynamic>)
          .map((e) => MonthlySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total_income': totalIncome,
      'total_spent': totalSpent,
      'total_budget': totalBudget,
      'average_monthly_income': averageMonthlyIncome,
      'average_monthly_spending': averageMonthlySpending,
      'highest_spending_month': highestSpendingMonth,
      'lowest_spending_month': lowestSpendingMonth,
      'monthly_summaries': monthlySummaries.map((e) => e.toJson()).toList(),
    };
  }
}

class MonthlySummary {
  final String month;
  final double income;
  final double spent;
  final double remaining;

  MonthlySummary({
    required this.month,
    required this.income,
    required this.spent,
    required this.remaining,
  });

  factory MonthlySummary.fromJson(Map<String, dynamic> json) {
    return MonthlySummary(
      month: json['month'] as String,
      income: (json['income'] as num).toDouble(),
      spent: (json['spent'] as num).toDouble(),
      remaining:
          (json['remaining'] as num?)?.toDouble() ??
          (json['income'] as num).toDouble() -
              (json['spent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'income': income,
      'spent': spent,
      'remaining': remaining,
    };
  }
}
