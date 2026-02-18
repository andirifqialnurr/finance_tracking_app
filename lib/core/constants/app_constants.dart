/// App-wide Constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Finance Tracker';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Personal Finance Tracking App';

  // API Configuration
  static const String apiBaseUrl = 'http://localhost:8080/api/v1';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Date Formats
  static const String dateFormatDisplay = 'dd MMM yyyy'; // 18 Feb 2026
  static const String dateFormatFull =
      'EEEE, dd MMMM yyyy'; // Tuesday, 18 February 2026
  static const String dateFormatShort = 'dd/MM/yyyy'; // 18/02/2026
  static const String dateFormatAPI = 'yyyy-MM-dd'; // 2026-02-18
  static const String dateTimeFormatAPI = "yyyy-MM-dd'T'HH:mm:ss'Z'";
  static const String timeFormat = 'HH:mm'; // 14:30

  // Currency
  static const String currencySymbol = 'Rp';
  static const String currencyCode = 'IDR';
  static const String currencyLocale = 'id_ID';

  // Number Formats
  static const int currencyDecimalDigits = 0; // No decimals for IDR
  static const String thousandSeparator = '.';
  static const String decimalSeparator = ',';

  // Budget Thresholds (for color coding)
  static const double budgetWarningThreshold = 0.5; // 50%
  static const double budgetDangerThreshold = 0.8; // 80%

  // Expense Category Types
  static const String categoryTypeSubscription = 'SUBSCRIPTION';
  static const String categoryTypeDailyContinuous = 'DAILY_CONTINUOUS';
  static const String categoryTypeUsageBased = 'USAGE_BASED';
  static const String categoryTypeOneTime = 'ONE_TIME';

  // Expense Type Labels
  static const Map<String, String> categoryTypeLabels = {
    categoryTypeSubscription: 'Subscription',
    categoryTypeDailyContinuous: 'Daily Continuous',
    categoryTypeUsageBased: 'Usage Based',
    categoryTypeOneTime: 'One Time',
  };

  // Default Values
  static const int defaultMonth = 1; // January
  static const int defaultYear = 2026;
  static const int itemsPerPage = 20;
  static const int maxDescriptionLength = 500;
  static const int maxCategoryNameLength = 100;

  // Animation Durations
  static const Duration animationDurationShort = Duration(milliseconds: 150);
  static const Duration animationDurationMedium = Duration(milliseconds: 300);
  static const Duration animationDurationLong = Duration(milliseconds: 500);

  // Debounce Durations
  static const Duration debounceDuration = Duration(milliseconds: 500);
  static const Duration searchDebounceDuration = Duration(milliseconds: 300);

  // Snackbar Durations
  static const Duration snackbarDurationShort = Duration(seconds: 2);
  static const Duration snackbarDurationMedium = Duration(seconds: 4);
  static const Duration snackbarDurationLong = Duration(seconds: 6);

  // Local Storage Keys
  static const String storageKeyThemeMode = 'theme_mode';
  static const String storageKeyLanguage = 'language';
  static const String storageKeyOnboardingComplete = 'onboarding_complete';

  // Navigation Routes
  static const String routeDashboard = '/dashboard';
  static const String routeBudget = '/budget';
  static const String routeExpenses = '/expenses';
  static const String routeAddExpense = '/expenses/add';
  static const String routeIncomes = '/incomes';
  static const String routeAddIncome = '/incomes/add';
  static const String routeCategories = '/categories';

  // Error Messages
  static const String errorGeneric = 'An error occurred. Please try again.';
  static const String errorNetwork =
      'Network error. Please check your connection.';
  static const String errorTimeout = 'Request timeout. Please try again.';
  static const String errorUnauthorized = 'Unauthorized. Please login again.';
  static const String errorNotFound = 'Resource not found.';
  static const String errorServerError =
      'Server error. Please try again later.';

  // Success Messages
  static const String successIncomeSaved = 'Income saved successfully';
  static const String successExpenseSaved = 'Expense saved successfully';
  static const String successCategorySaved = 'Category saved successfully';
  static const String successCategoryUpdated = 'Category updated successfully';
  static const String successCategoryDeleted = 'Category deleted successfully';

  // Validation Messages
  static const String validationRequired = 'This field is required';
  static const String validationInvalidAmount = 'Please enter a valid amount';
  static const String validationInsufficientBudget = 'Insufficient budget';
  static const String validationMaxLengthExceeded = 'Maximum length exceeded';

  // Chart Configuration
  static const int chartMaxDataPoints = 12; // Max months to show
  static const double chartAnimationDuration = 1.5; // seconds
  static const double chartBarWidth = 16.0;

  // Refresh Intervals
  static const Duration autoRefreshInterval = Duration(minutes: 5);
}
