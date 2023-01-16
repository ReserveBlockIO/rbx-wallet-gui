import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/explorer_service.dart';
import '../models/web_transaction.dart';

final webTransactionDetailProvider = FutureProvider.family<WebTransaction?, String>((ref, String hash) async {
  return ExplorerService().retrieveTransaction(hash);
});
