/// API Endpoints Constants
class ApiEndpoints {
  ApiEndpoints._();

  // Base paths
  static const String expenses = '/expenses';
  static const String incomes = '/incomes';
  static const String categories = '/categories';
  static const String budgets = '/budgets';
  static const String transactions = '/transactions';
  static const String analytics = '/analytics';
  static const String reports = '/reports';
  static const String alerts = '/alerts';

  // Expense endpoints
  static const String createExpense = '$expenses';
  static const String getExpenses = '$expenses';
  static String getExpenseById(String id) => '$expenses/$id';
  static String updateExpense(String id) => '$expenses/$id';
  static String deleteExpense(String id) => '$expenses/$id';

  // Income endpoints
  static const String createIncome = '$incomes';
  static const String getIncomes = '$incomes';
  static String getIncomeById(String id) => '$incomes/$id';
  static String updateIncome(String id) => '$incomes/$id';
  static String deleteIncome(String id) => '$incomes/$id';

  // Category endpoints
  static const String createCategory = '$categories';
  static const String getCategories = '$categories';
  static String getCategoryById(String id) => '$categories/$id';
  static String updateCategory(String id) => '$categories/$id';
  static String deleteCategory(String id) => '$categories/$id';

  // Budget endpoints
  static const String getBudgets = '$budgets';
  static const String getBudgetSummary = '$budgets/summary';
  static const String reallocateBudget = '$budgets/reallocate';
  static const String getBudgetReallocations = '$budgets/reallocations';
  static String cancelReallocation(String id) => '$budgets/reallocate/$id';

  // Transaction endpoints
  static const String getTransactions = '$transactions';

  // Analytics endpoints
  static const String getSpendingPattern = '$analytics/spending-pattern';
  static const String getCategoryComparison = '$analytics/category-comparison';
  static const String getTopSpending = '$analytics/top-spending';
  static const String getBudgetPerformance = '$analytics/budget-performance';

  // Reports endpoints
  static const String getMonthlyReport = '$reports/monthly';
  static const String getYearlyReport = '$reports/yearly';
  static const String exportMonthlyReport = '$reports/monthly/export';
  static const String exportYearlyReport = '$reports/yearly/export';

  // Alert endpoints — Note: GET /alerts/:id is NOT available, use GET /alerts with filter
  static const String createAlert = '$alerts';
  static const String getAlerts = '$alerts';
  static String updateAlert(String id) => '$alerts/$id';
  static String deleteAlert(String id) => '$alerts/$id';
}
