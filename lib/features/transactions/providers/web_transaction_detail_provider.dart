import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/features/transactions/models/web_transaction.dart';

final webTransactionDetailProvider = FutureProvider.family<WebTransaction?, String>((ref, String hash) async {
  return ExplorerService().retrieveTransaction(hash);
});
