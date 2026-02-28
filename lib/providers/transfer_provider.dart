import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/transfer_repository.dart';
import '../models/transfer.dart';
import 'account_provider.dart';

part 'transfer_provider.g.dart';

@riverpod
Future<List<Transfer>> transfers(
  TransfersRef ref, {
  int? month,
  int? year,
}) async {
  final repo = ref.watch(transferRepositoryProvider);
  return repo.getTransfers();
}

@riverpod
class TransferNotifier extends _$TransferNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> createTransfer({
    required String fromAccountId,
    required String toAccountId,
    required double amount,
    String? note,
    required DateTime transferDate,
  }) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(transferRepositoryProvider);
      await repo.createTransfer(
        fromAccountId: fromAccountId,
        toAccountId: toAccountId,
        amount: amount,
        note: note,
        transferDate: transferDate,
      );
      ref.invalidate(transfersProvider);
      ref.invalidate(accountsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> cancelTransfer(String id) async {
    state = const AsyncLoading();
    try {
      await ref.read(transferRepositoryProvider).cancelTransfer(id);
      ref.invalidate(transfersProvider);
      ref.invalidate(accountsProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
