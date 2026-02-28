import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/account.dart';
import '../core/network/dio_client.dart';

abstract class IAccountRepository {
  Future<List<Account>> getAccounts();
  Future<Account> createAccount(Map<String, dynamic> data);
  Future<Account> updateAccount(String id, Map<String, dynamic> data);
  Future<AccountSummary> getAccountSummary(String id);
  Future<Account> topUp(String id, double amount, String? note);
  Future<Account> archiveAccount(String id);
}

class AccountRepository implements IAccountRepository {
  final Dio _dio;
  AccountRepository(this._dio);

  @override
  Future<List<Account>> getAccounts() async {
    final res = await _dio.get('/accounts');
    final List data = res.data['data'] ?? res.data;
    return data
        .map((e) => Account.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<Account> createAccount(Map<String, dynamic> data) async {
    final res = await _dio.post('/accounts', data: data);
    return Account.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Account> updateAccount(String id, Map<String, dynamic> data) async {
    final res = await _dio.patch('/accounts/$id', data: data);
    return Account.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<AccountSummary> getAccountSummary(String id) async {
    final res = await _dio.get('/accounts/$id/summary');
    return AccountSummary.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Account> topUp(String id, double amount, String? note) async {
    final res = await _dio.post(
      '/accounts/$id/topup',
      data: {'amount': amount, if (note != null) 'note': note},
    );
    return Account.fromJson(res.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<Account> archiveAccount(String id) async {
    final res = await _dio.post('/accounts/$id/archive');
    return Account.fromJson(res.data['data'] as Map<String, dynamic>);
  }
}

final accountRepositoryProvider = Provider<IAccountRepository>((ref) {
  return AccountRepository(ref.watch(dioProvider));
});
