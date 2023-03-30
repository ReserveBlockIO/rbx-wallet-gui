import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/transaction_service.dart';
import '../../store/models/store.dart';

final myStoresProvider = FutureProvider<List<Store>>((ref) async {
  final keypair = ref.read(webSessionProvider).keypair;
  return TransactionService().listStores(email: keypair?.email ?? '', address: keypair?.public ?? '');
});
