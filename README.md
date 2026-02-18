# Finance Tracking App

Aplikasi Finance Tracking berbasis Flutter dengan UI menggunakan shadcn UI dan fl_chart untuk visualisasi data.

## 📁 Struktur Folder

```
lib/
├── core/
│   ├── constants/           # Konstanta aplikasi
│   │   ├── app_colors.dart      # Palet warna (shadcn inspired)
│   │   ├── app_typography.dart  # Sistem tipografi
│   │   ├── app_dimensions.dart  # Spacing & dimensi  
│   │   └── app_constants.dart   # Konstanta umum
│   ├── theme/              # Konfigurasi tema
│   │   └── app_theme.dart      # shadcn UI + Material theme
│   └── navigation/         # Routing
│       └── routes.dart         # Definisi routes
│
├── models/                 # Data models
│   ├── income.dart            # Model income & alokasi
│   ├── expense.dart           # Model expense
│   ├── expense_category.dart  # Model kategori expense
│   └── budget.dart            # Model budget & summary
│
├── services/              # API services
│   ├── api_client.dart       # HTTP client base
│   ├── income_service.dart   # Income API calls
│   ├── expense_service.dart  # Expense API calls
│   ├── category_service.dart # Category API calls
│   └── budget_service.dart   # Budget API calls│
├── utils/                 # Utility functions
│   ├── formatters.dart       # Format currency, date, number
│   └── validators.dart       # Form validators
│
├── widgets/               # Reusable widgets
│   ├── common/              # Widget umum
│   │   ├── app_card.dart
│   │   ├── app_button.dart
│   │   ├── loading_indicator.dart
│   │   ├── empty_state.dart
│   │   └── error_state_widget.dart
│   ├── dashboard/          # Dashboard widgets
│   │   ├── summary_card.dart
│   │   └── income_expense_chart.dart
│   ├── budget/             # Budget widgets
│   │   └── budget_category_item.dart
│   ├── expenses/           # Expense widgets
│   │   └── expense_list_item.dart
│   ├── incomes/            # Income widgets
│   │   └── income_list_item.dart
│   └── categories/         # Category widgets
│       └── category_list_item.dart
│
└── screens/               # Screen pages
    ├── dashboard/
    │   └── dashboard_screen.dart
    ├── budget/
    │   └── budget_overview_screen.dart
    ├── expenses/
    │   ├── expense_history_screen.dart
    │   └── add_expense_screen.dart
    ├── incomes/
    │   ├── income_history_screen.dart
    │   └── add_income_screen.dart
    └── categories/
        ├── category_management_screen.dart
        └── add_edit_category_screen.dart
```

## 🎨 Design System

### Colors (shadcn inspired)
- **Primary**: Slate 900 (#0F172A)
- **Secondary**: Indigo 500 (#6366F1)
- **Success**: Green 500 (#10B981)
- **Warning**: Amber 500 (#F59E0B)
- **Error**: Red 500 (#EF4444)
- **Info**: Blue 500 (#3B82F6)

### Typography
- Display: 32px / 28px / 24px
- Headline: 24px / 20px
- Title: 20px / 18px / 16px
- Body: 16px / 14px / 12px
- Amount: 32px / 28px / 24px

### Spacing (4px grid)
- 4px, 8px, 12px, 16px, 20px, 24px, 32px, 40px, 48px, 64px, 80px

## 🛠️ Tech Stack

- **Flutter SDK**: ^3.10.8
- **shadcn_ui**: ^0.46.1 - UI component library
- **fl_chart**: ^0.69.0 - Chart visualization
- **http**: ^1.2.2 - HTTP client
- **intl**: ^0.20.2 - Internationalization
- **uuid**: ^4.5.1 - UUID generation
- **provider**: ^6.1.2 - State management

## 📊 Features

### 1. Dashboard
- Summary cards (Income, Expense, Balance, Budget)
- Income vs Expense line chart
- Quick actions

### 2. Budget Overview
- Budget usage dengan progress indicators
- Color-coded status (Green < 50%, Yellow 50-80%, Red > 80%)
- Filter by category type

### 3. Expense Management
- List expenses dengan filter & search
- Add expense dengan budget validation
- Category-based organization

### 4. Income Management
- Income history
- Add income dengan allocation preview
- Automatic budget allocation

### 5. Category Management
- CRUD categories
- Type-based grouping
- Priority-based allocation

## 🧪 Running the App

```bash
# Install dependencies
flutter pub get

# Run app
flutter run

# Build
flutter build apk  # Android
flutter build ios  # iOS
```

## 📝 API Configuration

Update `lib/core/constants/app_constants.dart`:

```dart
static const String apiBaseUrl = 'YOUR_API_URL';
```

## 🌍 Locale

- Currency: Indonesian Rupiah (Rp)
- Date Format: dd MMM yyyy
- No decimal places for currency

## ✨ Next Steps

1. Integrate dengan Backend API
2. Implement State Management
3. Add Authentication
4. Add Tests
5. Dark Mode support
6. Multi-language support
