import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Centralized toast utility using [ShadToaster] from shadcn_ui.
///
/// Always use these static helpers instead of [ScaffoldMessenger.showSnackBar]
/// because [ShadApp] uses [WidgetsApp] internally and does NOT provide a
/// [ScaffoldMessenger] ancestor.
class AppToast {
  AppToast._();

  /// Show a success toast with a green-accented title.
  static void showSuccess(
    BuildContext context,
    String message, {
    String title = 'Success',
  }) {
    if (!context.mounted) return;
    ShadToaster.of(context).show(
      ShadToast(
        title: Text(title),
        description: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Show an error toast with a destructive (red) style.
  /// The [message] should be user-friendly – avoid raw exception strings.
  static void showError(
    BuildContext context,
    String message, {
    String title = 'Something went wrong',
  }) {
    if (!context.mounted) return;
    ShadToaster.of(context).show(
      ShadToast.destructive(
        title: Text(title),
        description: Text(message),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  /// Show an informational / warning toast.
  static void showInfo(
    BuildContext context,
    String message, {
    String title = 'Notice',
  }) {
    if (!context.mounted) return;
    ShadToaster.of(context).show(
      ShadToast(
        title: Text(title),
        description: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
