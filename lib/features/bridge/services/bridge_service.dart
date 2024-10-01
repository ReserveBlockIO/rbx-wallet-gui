import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import '../../metrics/models/network_metrics.dart';

import '../../../core/env.dart';
import '../../../core/services/base_service.dart';
import '../../../utils/toast.dart';
import '../../block/block.dart';
import '../../genesis/models/genesis_block.dart';
import '../../node/models/node.dart';
import '../../node/models/node_info.dart';

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
      print("Unlock Account Error");
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
      print("Unlock Account Error");
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
      print("Lock Account Error");
      print(e);
      return false;
    }
  }

  Future<String> getCliVersion() async {
    return await getText("/GetCLIVersion");
  }

  Future<Map<String, dynamic>> walletInfo() async {
    try {
      final d = await getText('/GetWalletInfo');
      final a = jsonDecode(d);
      return a[0];
    } catch (e) {
      return {};
    }
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

  Future<Map<String, dynamic>?> importPrivateKey(String key, [bool rescan = false]) async {
    final response = await getText("/ImportPrivateKey/${key.trim()}/${rescan ? 'true' : 'false'}");
    if (response == "NAC") {
      return null;
    }

    return jsonDecode(response);
  }

  Future<bool> rescanAddress(String address) async {
    try {
      final response = await getText("/RescanForTx/$address");

      final data = jsonDecode(response);
      if (data['Success'] == true) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
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
    final response = await getText("/SendTransaction/$from/$to/$amount", timeout: 0);

    if (response == "FAIL") {
      Toast.error();

      return null;
    }

    if (response == "This is not a valid VFX address to send to. Please verify again.") {
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

  Future<Block?> blockInfo(int height, Block? fallback) async {
    final response = await getText("/SendBlock/$height", cleanPath: false);
    try {
      if (response == "NNB") {
        return fallback;
      }
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

  Future<String?> getMempool() async {
    final data = await getText("/GetMemPool");
    return data == 'null' ? null : data;
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

  Future<bool> checkIfCliIsKilled() async {
    try {
      final response = await getText("/SendExitComplete", timeout: 1000);
      if (response == "SA") {
        await Future.delayed(const Duration(seconds: 5));
        return checkIfCliIsKilled();
      }
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<bool> killCli() async {
    if (Env.launchCli) {
      getText("/SendExit");
      await Future.delayed(const Duration(milliseconds: 300));
      // return await checkIfCliIsKilled();
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

      print("---------_$response----");
      if (response.toLowerCase() == "true") {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool?> isValidating() async {
    try {
      final data = await getText("/IsValidating");
      return data.toString().toLowerCase() == 'true';
    } catch (e) {
      return null;
    }
  }

  Future<List<String>?> getLatestCliFiles() async {
    try {
      final data = await getJson('/GetLatestReleaseFiles', cleanPath: false);
      if (data.containsKey('Result') && data['Result'] == "Success") {
        if (data.containsKey("Message")) {
          print(data['Message']);
          final filenames = jsonDecode(data['Message'].toString()) as List<dynamic>;
          return filenames.map((e) => e.toString()).toList();
        }
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool?> updateCli(bool execute) async {
    if (kIsWeb) {
      return null;
    }

    final filenames = await getLatestCliFiles();
    if (filenames == null) {
      return null;
    }

    print(filenames);

    String osVersion = Platform.version;
    print("OS Version:");
    print(osVersion);
    print("********");

    String? filename;
    if (Platform.isMacOS) {
      if (osVersion.contains("macos_x64")) {
        filename = "vfx-corecli-mac-intel.zip";
      } else {
        filename = "vfx-corecli-mac-arm.zip";
      }
    } else if (Platform.isWindows) {
      filename = "vfx-corecli-win7-x64.zip";
    }

    if (filename == null) {
      return null;
    }

    if (!filenames.contains(filename)) {
      return null;
    }

    final data = await getJson('/GetLatestRelease/${execute ? 'true' : 'false'}/$filename', cleanPath: false);
    if (data.containsKey('Result') && data['Result'] == "Success") {
      if (data.containsKey("Message")) {
        final message = data['Message'];
        if (message == "CLI is up to date.") {
          return false;
        }
        if (message == "Update was not successful.") {
          return false;
        }
        if (message == "Update was successful. Please Restart CLI.") {
          return true;
        }
      }
    }
    return null;
  }

  Future<NetworkMetrics?> networkMetrics() async {
    try {
      final data = await getJson("/NetworkMetrics");
      return NetworkMetrics.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
