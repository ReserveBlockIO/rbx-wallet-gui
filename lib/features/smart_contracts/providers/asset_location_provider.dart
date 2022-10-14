import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';

final assetLocationProvider = FutureProvider.family<String?, String>((ref, String data) async {
  final d = data.split("||");

  if (d.length < 2) {
    return null;
  }

  return SmartContractService().getAssetPath(d.first, d.last);
});
