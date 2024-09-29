import 'dart:convert';


import '../../../core/services/base_service.dart';
import '../models/transaction.dart';

class LocalTransactionService extends BaseService {
  LocalTransactionService() : super(apiBasePathOverride: "/txapi/TXV1");

  Future<List<Transaction>> _transactions(String path) async {
    final response = await getText(path);

    if (response.isEmpty) {
      return [];
    }

    if (response == "FAIL") {
      return [];
    }

    if (response == "No TX") {
      return [];
    }

    final items = jsonDecode(response);

    final List<Transaction> transactions = [];
    for (final item in items) {
      transactions.add(Transaction.fromJson(item));
    }

    return transactions.reversed.toList();
  }

  Future<List<Transaction>> transactionsAll() async {
    return await _transactions('/GetAllLocalTX');
  }

  Future<List<Transaction>> transactionsSuccess() async {
    return await _transactions('/GetSuccessfulLocalTX');
  }

  Future<List<Transaction>> transactionsFailed() async {
    return await _transactions('/GetFailedLocalTX');
  }

  Future<List<Transaction>> transactionsPending() async {
    return await _transactions('/GetPendingLocalTX');
  }

  Future<List<Transaction>> transactionsMined() async {
    List<Transaction> mined = await _transactions('/GetMinedLocalTX');
    mined.sort((a, b) => b.height.compareTo(a.height));
    return mined;
  }

  Future<List<Transaction>> transactionsReserved() async {
    return await _transactions('/GetReserveLocalTX');
  }
}
