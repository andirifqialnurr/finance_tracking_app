import 'package:flutter/material.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import '../../screens/budget/budget_overview_screen.dart';
import '../../screens/transactions/transaction_history_screen.dart';
import '../../screens/expenses/expense_history_screen.dart';
import '../../screens/expenses/add_expense_screen.dart';
import '../../screens/incomes/income_history_screen.dart';
import '../../screens/incomes/add_income_screen.dart';
import '../../screens/categories/category_management_screen.dart';
import '../../screens/categories/add_edit_category_screen.dart';
import '../../models/expense_category.dart';

/// Route names constants
class Routes {
  static const String dashboard = '/';
  static const String budgetOverview = '/budget';
  static const String transactionHistory = '/transactions';
  static const String expenseHistory = '/expenses';
  static const String addExpense = '/expenses/add';
  static const String incomeHistory = '/incomes';
  static const String addIncome = '/incomes/add';
  static const String categoryManagement = '/categories';
  static const String addCategory = '/categories/add';
  static const String editCategory = '/categories/edit';
}

/// Generate routes for the app
class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case Routes.budgetOverview:
        return MaterialPageRoute(builder: (_) => const BudgetOverviewScreen());

      case Routes.transactionHistory:
        return MaterialPageRoute(
          builder: (_) => const TransactionHistoryScreen(),
        );

      case Routes.expenseHistory:
        return MaterialPageRoute(builder: (_) => const ExpenseHistoryScreen());

      case Routes.addExpense:
        return MaterialPageRoute(builder: (_) => const AddExpenseScreen());

      case Routes.incomeHistory:
        return MaterialPageRoute(builder: (_) => const IncomeHistoryScreen());

      case Routes.addIncome:
        return MaterialPageRoute(builder: (_) => const AddIncomeScreen());

      case Routes.categoryManagement:
        return MaterialPageRoute(
          builder: (_) => const CategoryManagementScreen(),
        );

      case Routes.addCategory:
        return MaterialPageRoute(builder: (_) => const AddEditCategoryScreen());

      case Routes.editCategory:
        final category = settings.arguments as ExpenseCategory?;
        return MaterialPageRoute(
          builder: (_) => AddEditCategoryScreen(category: category),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
