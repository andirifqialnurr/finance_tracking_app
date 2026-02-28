import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_constants.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/accounts/accounts_screen.dart';
import 'screens/accounts/account_detail_screen.dart';
import 'screens/accounts/account_form_screen.dart';
import 'screens/transactions/transaction_history_screen.dart';
import 'screens/expenses/expense_history_screen.dart';
import 'screens/expenses/add_expense_screen.dart';
import 'screens/incomes/income_history_screen.dart';
import 'screens/incomes/add_income_screen.dart';
import 'screens/budget/budget_overview_screen.dart';
import 'screens/budget/budget_reallocation_screen.dart';
import 'screens/categories/category_management_screen.dart';
import 'screens/categories/add_edit_category_screen.dart';
import 'screens/analytics/analytics_screen.dart';
import 'screens/reports/reports_screen.dart';
import 'screens/alerts/alerts_screen.dart';
import 'screens/alerts/create_alert_screen.dart';
import 'screens/transfer/transfers_screen.dart';
import 'screens/transfer/add_transfer_screen.dart';
import 'screens/scheduled_funds/scheduled_funds_screen.dart';
import 'screens/scheduled_funds/add_edit_scheduled_fund_screen.dart';
import 'screens/notifications/notification_settings_screen.dart';
import 'models/account.dart';
import 'models/expense_category.dart';
import 'models/scheduled_fund.dart';

// ─── App Shell (bottom navigation) ───────────────────────────────────────────
class _AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const _AppShell({required this.navigationShell});

  static const _tabs = [
    _NavTab(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home'),
    _NavTab(
      icon: Icons.account_balance_wallet_outlined,
      activeIcon: Icons.account_balance_wallet,
      label: 'Accounts',
    ),
    _NavTab(
      icon: Icons.swap_horiz_outlined,
      activeIcon: Icons.swap_horiz,
      label: 'Transaksi',
    ),
    _NavTab(
      icon: Icons.pie_chart_outline,
      activeIcon: Icons.pie_chart,
      label: 'Anggaran',
    ),
    _NavTab(
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart,
      label: 'Analitik',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        backgroundColor: Colors.white,
        indicatorColor: AppColors.primary.withValues(alpha: 0.1),
        destinations: _tabs
            .asMap()
            .entries
            .map(
              (e) => NavigationDestination(
                icon: Icon(e.value.icon),
                selectedIcon: Icon(
                  e.value.activeIcon,
                  color: AppColors.primary,
                ),
                label: e.value.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _NavTab {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavTab({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

// ─── Router ───────────────────────────────────────────────────────────────────
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          _AppShell(navigationShell: navigationShell),
      branches: [
        // Tab 0: Home / Dashboard
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
        // Tab 1: Accounts
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/accounts',
              builder: (context, state) => const AccountsScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (context, state) => const AccountFormScreen(),
                ),
                GoRoute(
                  path: 'edit',
                  builder: (context, state) =>
                      AccountFormScreen(account: state.extra as Account),
                ),
                GoRoute(
                  path: 'detail',
                  builder: (context, state) =>
                      AccountDetailScreen(account: state.extra as Account),
                ),
              ],
            ),
            GoRoute(
              path: '/transfers',
              builder: (context, state) => const TransfersScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (context, state) => const AddTransferScreen(),
                ),
              ],
            ),
            GoRoute(
              path: '/scheduled-funds',
              builder: (context, state) => const ScheduledFundsScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (context, state) =>
                      const AddEditScheduledFundScreen(),
                ),
                GoRoute(
                  path: 'edit',
                  builder: (context, state) => AddEditScheduledFundScreen(
                    fund: state.extra as ScheduledFund,
                  ),
                ),
              ],
            ),
            GoRoute(
              path: '/notifications/settings',
              builder: (context, state) => const NotificationSettingsScreen(),
            ),
          ],
        ),
        // Tab 2: Transactions
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/transactions',
              builder: (context, state) => const TransactionHistoryScreen(),
            ),
            GoRoute(
              path: '/expenses',
              builder: (context, state) => const ExpenseHistoryScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (context, state) => const AddExpenseScreen(),
                ),
              ],
            ),
            GoRoute(
              path: '/incomes',
              builder: (context, state) => const IncomeHistoryScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (context, state) => const AddIncomeScreen(),
                ),
              ],
            ),
          ],
        ),
        // Tab 3: Budget
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/budget',
              builder: (context, state) => const BudgetOverviewScreen(),
              routes: [
                GoRoute(
                  path: 'reallocation',
                  builder: (context, state) => const BudgetReallocationScreen(),
                ),
              ],
            ),
            GoRoute(
              path: '/categories',
              builder: (context, state) => const CategoryManagementScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (context, state) => const AddEditCategoryScreen(),
                ),
                GoRoute(
                  path: 'edit',
                  builder: (context, state) => AddEditCategoryScreen(
                    category: state.extra as ExpenseCategory?,
                  ),
                ),
              ],
            ),
            GoRoute(
              path: '/alerts',
              builder: (context, state) => const AlertsScreen(),
              routes: [
                GoRoute(
                  path: 'create',
                  builder: (context, state) => const CreateAlertScreen(),
                ),
              ],
            ),
          ],
        ),
        // Tab 4: Analytics
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/analytics',
              builder: (context, state) => const AnalyticsScreen(),
            ),
            GoRoute(
              path: '/reports',
              builder: (context, state) => const ReportsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class FinanceTrackingApp extends StatelessWidget {
  const FinanceTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      materialThemeBuilder: (context, theme) {
        final isDark =
            MediaQuery.platformBrightnessOf(context) == Brightness.dark;
        return isDark
            ? AppTheme.materialDarkTheme()
            : AppTheme.materialLightTheme();
      },
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
