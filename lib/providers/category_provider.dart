import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/category_repository.dart';
import '../models/expense_category.dart';

part 'category_provider.g.dart';

// ─── Read-only providers ──────────────────────────────────────────────────────

@riverpod
Future<List<ExpenseCategory>> categories(CategoriesRef ref) {
  return ref.watch(categoryRepositoryProvider).getCategories();
}

// ─── Mutable notifier ─────────────────────────────────────────────────────────

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  @override
  AsyncValue<ExpenseCategory?> build() => const AsyncValue.data(null);

  Future<ExpenseCategory> createCategory(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(categoryRepositoryProvider)
          .createCategory(data);
      state = AsyncValue.data(result);
      ref.invalidate(categoriesProvider);
      return result;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<ExpenseCategory> updateCategory(
    String id,
    Map<String, dynamic> data,
  ) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(categoryRepositoryProvider)
          .updateCategory(id, data);
      state = AsyncValue.data(result);
      ref.invalidate(categoriesProvider);
      return result;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> deleteCategory(String id) async {
    await ref.read(categoryRepositoryProvider).deleteCategory(id);
    ref.invalidate(categoriesProvider);
  }
}
