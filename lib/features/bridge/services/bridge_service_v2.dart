import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../balance/models/balance.dart';
import '../../token/providers/token_nfts_provider.dart';
import '../../../core/services/base_service.dart';

class BridgeServiceV2 extends BaseService {
  BridgeServiceV2() : super(apiBasePathOverride: "/api/V2");

  Future<List<Balance>?> getBalances(Ref ref) async {
    final response = await getText("/GetBalances", cleanPath: false);

    final data = jsonDecode(response);

    if (data['Success'] == true) {
      final List<Balance> balances = [];
      for (final b in data['AccountBalances']) {
        final balance = Balance.fromJson(b);
        if (balance.tokens.isNotEmpty) {
          for (final token in balance.tokens) {
            ref.read(tokenNftsProvider.notifier).add(token.smartContractId);
          }
        }

        balances.add(balance);
      }

      return balances;
    }
    return null;
  }

  // Future<String?> decompressData(String compressedData) async {

  //   await postJson("/GetImageUncompressedByte", body )
  // }
}
