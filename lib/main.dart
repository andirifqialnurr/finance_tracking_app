import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'core/theme/app_theme.dart';
import 'core/navigation/routes.dart';
import 'core/constants/app_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations (portrait only)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const FinanceTrackingApp());
}

class FinanceTrackingApp extends StatelessWidget {
  const FinanceTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      materialThemeBuilder: (context, theme) {
        return AppTheme.materialLightTheme();
      },
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.dashboard,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
