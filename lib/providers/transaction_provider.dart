import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/transaction_repository.dart';
import '../models/transaction.dart';

part 'transaction_provider.g.dart';

@riverpod
Future<List<Transaction>> transactions(
  TransactionsRef ref, {
  int? month,
  int? year,
  String? accountId,
  String? type,
  int? limit,
}) {
  return ref
      .watch(transactionRepositoryProvider)
      .getTransactions(
        month: month,
        year: year,
        accountId: accountId,
        type: type,
        limit: limit,
      );
}

@riverpod
Future<TransactionSummary> transactionSummary(
  TransactionSummaryRef ref, {
  int? month,
  int? year,
}) {
  return ref
      .watch(transactionRepositoryProvider)
      .getSummary(month: month, year: year);
}
