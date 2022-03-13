import 'dart:convert';

import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/block/block.dart';
import 'package:rbx_wallet/features/genesis/models/genesis_block.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';

class BridgeService extends BaseService {
  Future<dynamic> status() async {
    return await getText('/CheckStatus');
  }

  Future<String> walletInfo() async {
    return await getText('/GetWalletInfo');
  }

  Future<String> wallets() async {
    return await getText('/GetAllAddresses');
  }

  Future<String> validators() async {
    return await getText('/GetValidatorAddresses');
  }

  Future<GenesisBlock?> genesisBlock() async {
    try {
      final response = await getText("/getgenesisblock");
      final data = jsonDecode(response);
      return GenesisBlock.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Transaction>?> transactions() async {
    final response = await getText('/GetAllTransactions');
    if (response.isEmpty) {
      return null;
    }

    if (response == "FAIL") {
      return null;
    }

    if (response == "No TX") {
      return null;
    }

    final items = jsonDecode(response);

    final List<Transaction> transactions = [];
    for (final item in items) {
      transactions.add(Transaction.fromJson(item));
    }

    return transactions;
  }

  Future<Map<String, dynamic>?> importPrivateKey(String key) async {
    final response = await getText("/ImportPrivateKey/$key");
    if (response == "NAC") {
      return null;
    }

    return jsonDecode(response);
  }

  Future<List<String>?> newAddress() async {
    final response = await getText("/GetNewAddress");
    if (response == "Fail") {
      return null;
    }
    return response.split(':');
  }

  Future<String> startValidating(String address, String username) async {
    return await getText("/StartValidating/$address/$username");
  }

  Future<String?> turnOnValidator(String id) async {
    final message = await getText("/TurnOnValidator/$id");

    if (message == "STV") {
      return null;
    }

    return message;
  }

  Future<bool> turnOffValidator(String id) async {
    try {
      await getText("/TurnOffValidator/$id");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Block?> blockInfo(int height) async {
    final response = await getText("/SendBlock/$height");
    try {
      final data = jsonDecode(response);
      return Block.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> killCli() async {
    if (Env.launchCli) {
      try {
        await getText("/SendExit");
      } catch (e) {
        return true;
      }
    }

    return true;
  }
}
