import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/account_repository.dart';
import '../models/account.dart';

part 'account_provider.g.dart';

// ─── Simple async providers ───────────────────────────────────────────────────

@riverpod
Future<List<Account>> accounts(AccountsRef ref) {
  return ref.watch(accountRepositoryProvider).getAccounts();
}

@riverpod
Future<AccountSummary> accountSummary(AccountSummaryRef ref, String id) {
  return ref.watch(accountRepositoryProvider).getAccountSummary(id);
}

// ─── Mutable notifier ─────────────────────────────────────────────────────────

@riverpod
class AccountNotifier extends _$AccountNotifier {
  @override
  AsyncValue<List<Account>> build() => const AsyncValue.loading();

  Future<void> loadAccounts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(accountRepositoryProvider).getAccounts(),
    );
  }

  Future<Account> createAccount(Map<String, dynamic> data) async {
    final account = await ref
        .read(accountRepositoryProvider)
        .createAccount(data);
    ref.invalidate(accountsProvider);
    return account;
  }

  Future<Account> updateAccount(String id, Map<String, dynamic> data) async {
    final account = await ref
        .read(accountRepositoryProvider)
        .updateAccount(id, data);
    ref.invalidate(accountsProvider);
    ref.invalidate(accountSummaryProvider(id));
    return account;
  }

  Future<Account> topUp(String id, double amount, {String? note}) async {
    final updated = await ref
        .read(accountRepositoryProvider)
        .topUp(id, amount, note);
    ref.invalidate(accountsProvider);
    ref.invalidate(accountSummaryProvider(id));
    return updated;
  }

  Future<Account> archiveAccount(String id) async {
    final updated = await ref
        .read(accountRepositoryProvider)
        .archiveAccount(id);
    ref.invalidate(accountsProvider);
    return updated;
  }
}
