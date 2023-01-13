import 'dart:convert';

import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/block/block.dart';
import 'package:rbx_wallet/features/genesis/models/genesis_block.dart';
import 'package:rbx_wallet/features/node/models/node.dart';
import 'package:rbx_wallet/features/node/models/node_info.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/utils/toast.dart';

class BridgeService extends BaseService {
  Future<dynamic> status() async {
    return await getText('/CheckStatus');
  }

  Future<bool> startupPasswordRequired() async {
    try {
      final value = await getText("/CheckPasswordNeeded");
      return value == "true";
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkIfEncrypted() async {
    try {
      final value = await getText("/GetIsWalletEncrypted");
      return value == "true";
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkIfPasswordIsNeeded() async {
    final value = await getText("/GetIsEncryptedPasswordStored");
    print("VALUE: $value");
    return value == "false";
  }

  Future<String?> encryptWallet(String password) async {
    try {
      final data = await getText("/GetEncryptWallet/$password", cleanPath: false, timeout: 0);
      final response = jsonDecode(data);
      if (response['Result'] != null && response['Result'] == "Success") {
        return null;
      }
      if (response['Message'] != null) {
        return response['Message'];
      }

      return "A problem occurred";
    } catch (e) {
      print("Unlock Wallet Error");
      print(e);
      return "$e";
    }
  }

  Future<bool> unlockWallet(String password) async {
    try {
      final data = await getText("/GetDecryptWallet/$password", cleanPath: false);
      final response = jsonDecode(data);

      if (response['Result'] != null && response['Result'] == "Success") {
        return true;
      }
      return false;
    } catch (e) {
      print("Unlock Wallet Error");
      print(e);
      return false;
    }
  }

  Future<bool> lockWallet() async {
    try {
      final data = await getText("/GetEncryptLock", cleanPath: false);
      final response = jsonDecode(data);

      if (response['Result'] != null && response['Result'] == "Success") {
        return true;
      }
      return false;
    } catch (e) {
      print("Lock Wallet Error");
      print(e);
      return false;
    }
  }

  Future<String> getCliVersion() async {
    return await getText("/GetCLIVersion");
  }

  Future<Map<String, dynamic>> walletInfo() async {
    final d = await getText('/GetWalletInfo');
    final a = jsonDecode(d);
    return a[0];
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

  Future<Map<String, dynamic>?> importPrivateKey(String key) async {
    final response = await getText("/ImportPrivateKey/${key.trim()}");
    if (response == "NAC") {
      return null;
    }

    return jsonDecode(response);
  }

  Future<String?> newAddress() async {
    final response = await getText("/GetNewAddress");
    if (response == "Fail") {
      return null;
    }
    return response;
  }

  Future<String?> sendFunds({
    required double amount,
    required String to,
    required String from,
  }) async {
    final response = await getText("/SendTransaction/$from/$to/$amount");

    if (response == "FAIL") {
      Toast.error();

      return null;
    }

    if (response == "This is not a valid RBX address to send to. Please verify again.") {
      Toast.error(response);
      return null;
    }

    return response;
  }

  Future<String> startValidating(String address, String username) async {
    return await getText("/StartValidating/$address/$username");
  }

  Future<String?> turnOnValidator(String id) async {
    final message = await getText("/TurnOnValidator/$id");

    if (message == "No Validator account has been found. Please create one.") {
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

  Future<String?> getValidatorInfo(String address) async {
    try {
      final name = await getText("/GetValidatorInfo/$address");
      return name;
    } catch (e) {
      print(e);
      return null;
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

  Future<List<Node>> getMasterNodes() async {
    final response = await getText("/GetMasternodes");
    try {
      final items = jsonDecode(response);
      final List<Node> nodes = [];
      for (final item in items) {
        nodes.add(Node.fromJson(item));
      }
      return nodes;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<NodeInfo>> getPeerInfo() async {
    final response = await getText("/GetPeerInfo");
    try {
      final items = jsonDecode(response);
      final List<NodeInfo> nodeInfos = [];
      for (final item in items) {
        nodeInfos.add(NodeInfo.fromJson(item));
      }
      return nodeInfos;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String> getDebugInfo() async {
    return await getText("/GetDebugInfo");
  }

  Future<bool> rollback(String id) async {
    try {
      await getText("/GetRollbackBlocks/$id");
      return true;
    } catch (e) {
      print(e);
      return false;
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

  Future<bool> clearLog() async {
    try {
      await getText("/ClearRBXLog");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> renameValidator(String name) async {
    try {
      await getText("/ChangeValidatorName/${name.trim()}");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> getHdWallet([int strength = 24]) async {
    try {
      final response = await getText("/GetHDWallet/$strength", cleanPath: false);
      final data = jsonDecode(response);
      print(data);
      if (data != null && data['Result'] != null) {
        if (data['Result'] == true) {
          if (data['Message'] != null) {
            return data['Message'];
          }
          return null;
        } else {
          if (data['Message'] != null) {
            Toast.error(data['Message']);
            return null;
          }
          Toast.error();
          return null;
        }
      }
      Toast.error();
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> restoreHd(String mnumonic) async {
    try {
      final response = await getText("/GetRestoreHDWallet/${mnumonic.trim()}", cleanPath: false);
      final data = jsonDecode(response);
      print(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> validateSendToAddress(String address) async {
    try {
      final response = await getText("/ValidateAddress/$address", cleanPath: false);
      if (response.toLowerCase() == "true") {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
