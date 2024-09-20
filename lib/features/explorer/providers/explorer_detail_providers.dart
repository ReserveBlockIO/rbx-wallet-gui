import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/explorer_service.dart';
import '../models/explorer_data.dart';

final vfxExplorerDataDetailProvider = FutureProvider<ExplorerData?>((ref) async {
  return ExplorerService().retrieveExplorerData('vfx');
});
final btcExplorerDataDetailProvider = FutureProvider<ExplorerData?>((ref) async {
  return ExplorerService().retrieveExplorerData('btc');
});
