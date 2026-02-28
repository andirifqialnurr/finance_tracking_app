import 'package:flutter/material.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import '../../screens/budget/budget_overview_screen.dart';
import '../../screens/budget/budget_reallocation_screen.dart';
import '../../screens/transactions/transaction_history_screen.dart';
import '../../screens/expenses/expense_history_screen.dart';
import '../../screens/expenses/add_expense_screen.dart';
import '../../screens/incomes/income_history_screen.dart';
import '../../screens/incomes/add_income_screen.dart';
import '../../screens/categories/category_management_screen.dart';
import '../../screens/categories/add_edit_category_screen.dart';
import '../../screens/analytics/analytics_screen.dart';
import '../../screens/reports/reports_screen.dart';
import '../../screens/alerts/alerts_screen.dart';
import '../../screens/alerts/create_alert_screen.dart';
import '../../screens/accounts/accounts_screen.dart';
import '../../screens/accounts/account_detail_screen.dart';
import '../../screens/accounts/account_form_screen.dart';
import '../../screens/transfer/transfers_screen.dart';
import '../../screens/transfer/add_transfer_screen.dart';
import '../../screens/scheduled_funds/scheduled_funds_screen.dart';
import '../../screens/scheduled_funds/add_edit_scheduled_fund_screen.dart';
import '../../screens/notifications/notification_settings_screen.dart';
import '../../models/expense_category.dart';
import '../../models/account.dart';
import '../../models/scheduled_fund.dart';

/// Route names constants
class Routes {
  static const String dashboard = '/';
  static const String budgetOverview = '/budget';
  static const String budgetReallocation = '/budget/reallocation';
  static const String transactionHistory = '/transactions';
  static const String expenseHistory = '/expenses';
  static const String addExpense = '/expenses/add';
  static const String incomeHistory = '/incomes';
  static const String addIncome = '/incomes/add';
  static const String categoryManagement = '/categories';
  static const String addCategory = '/categories/add';
  static const String editCategory = '/categories/edit';
  static const String analytics = '/analytics';
  static const String reports = '/reports';
  static const String alerts = '/alerts';
  static const String createAlert = '/alerts/create';
  static const String accounts = '/accounts';
  static const String accountDetail = '/accounts/detail';
  static const String addAccount = '/accounts/add';
  static const String editAccount = '/accounts/edit';
  static const String transfers = '/transfers';
  static const String addTransfer = '/transfers/add';
  static const String scheduledFunds = '/scheduled-funds';
  static const String addScheduledFund = '/scheduled-funds/add';
  static const String editScheduledFund = '/scheduled-funds/edit';
  static const String notificationSettings = '/notifications/settings';
}

/// Generate routes for the app
class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case Routes.accounts:
        return MaterialPageRoute(builder: (_) => const AccountsScreen());

      case Routes.accountDetail:
        final account = settings.arguments as Account;
        return MaterialPageRoute(
          builder: (_) => AccountDetailScreen(account: account),
        );

      case Routes.addAccount:
        return MaterialPageRoute(builder: (_) => const AccountFormScreen());

      case Routes.editAccount:
        final account = settings.arguments as Account;
        return MaterialPageRoute(
          builder: (_) => AccountFormScreen(account: account),
        );

      case Routes.transfers:
        return MaterialPageRoute(builder: (_) => const TransfersScreen());

      case Routes.addTransfer:
        return MaterialPageRoute(builder: (_) => const AddTransferScreen());

      case Routes.budgetReallocation:
        return MaterialPageRoute(
          builder: (_) => const BudgetReallocationScreen(),
        );

      case Routes.scheduledFunds:
        return MaterialPageRoute(builder: (_) => const ScheduledFundsScreen());

      case Routes.addScheduledFund:
        return MaterialPageRoute(
          builder: (_) => const AddEditScheduledFundScreen(),
        );

      case Routes.editScheduledFund:
        final fund = settings.arguments as ScheduledFund;
        return MaterialPageRoute(
          builder: (_) => AddEditScheduledFundScreen(fund: fund),
        );

      case Routes.notificationSettings:
        return MaterialPageRoute(
          builder: (_) => const NotificationSettingsScreen(),
        );

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

      case Routes.analytics:
        return MaterialPageRoute(builder: (_) => const AnalyticsScreen());

      case Routes.reports:
        return MaterialPageRoute(builder: (_) => const ReportsScreen());

      case Routes.alerts:
        return MaterialPageRoute(builder: (_) => const AlertsScreen());

      case Routes.createAlert:
        final existingAlert = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => CreateAlertScreen(existingAlert: existingAlert),
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
