import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/new_reserve_account.dart';
import '../../../utils/toast.dart';

import '../../../core/services/base_service.dart';

class ReserveAccountService extends BaseService {
  ReserveAccountService() : super(apiBasePathOverride: "/rsapi/RSV1");

  Future<String> wallets() async {
    return await getText('/GetAllReserveAccounts');
  }

  Future<NewReserveAccount?> create(String password) async {
    if (kIsWeb) {
      //TODO: logic for web
    }

    final payload = {"Password": password, "StoreRecoveryAccount": true};
    final response = await postJson('/NewReserveAddress', params: payload);
    final data = response['data'];
    if (data != null) {
      if (data['Success'] == true) {
        if (data['ReserveAccount'] != null) {
          return NewReserveAccount.fromJson(data['ReserveAccount']);
        }
      }
    }

    Toast.error(data['Message'] ?? "A problem occurred.");

    return null;
  }

  Future<NewReserveAccount?> restore({
    required String restoreCode,
    required String password,
    bool store = true,
    bool rescan = true,
  }) async {
    final payload = {
      "RestoreCode": restoreCode,
      "Password": password,
      "StoreRecoveryAccount": store,
      "RescanForTx": rescan,
      "OnlyRestoreRecovery": false,
    };

    final response = await postJson('/RestoreReserveAddress', params: payload);
    print(response);
    print("****");
    final data = response['data'];
    if (data != null) {
      print(jsonEncode(data));
      if (data['Success'] == true) {
        if (data['ReserveAccount'] != null && data['ReserveAccount']['Result'] != null) {
          return NewReserveAccount.fromJson(data['ReserveAccount']['Result']);
        }
      }
    }

    Toast.error(data['Message'] ?? "A problem occurred.");

    return null;
  }

  // Future<Wallet?> recover({
  //   required String restoreCode,
  //   required String password,
  //   bool store = true,
  //   bool rescan = true,
  // }) async {
  //   final payload = {
  //     "RestoreCode": restoreCode,
  //     "Password": password,
  //     "StoreRecoveryAccount": store,
  //     "RescanForTx": rescan,
  //     "OnlyRestoreRecovery": true,
  //   };

  //   final response = await postJson('/RestoreReserveAddress', params: payload);
  //   print(response);
  //   print("****");
  //   final data = response['data'];
  //   if (data != null) {
  //     print(jsonEncode(data));
  //     if (data['Success'] == true) {
  //       if (data['Account'] != null) {
  //         return Wallet.fromJson(data['Account']);
  //       }
  //     }
  //   }

  //   Toast.error(data['Message'] ?? "A problem occurred.");

  //   return null;
  // }

  Future<bool> publish({required String address, required String password}) async {
    try {
      final response = await getText("/PublishReserveAccount/$address/$password", cleanPath: false);
      final data = jsonDecode(response);
      print(data);
      print("****");
      if (data['Success'] != null && data['Success'] == true) {
        return true;
      }
      OverlayToast.error(data['Message']);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> sendTx({
    required String fromAddress,
    required String toAddress,
    required double amount,
    required String password,
    int unlockDelayHours = 0,
  }) async {
    final params = {
      'FromAddress': fromAddress,
      'ToAddress': toAddress,
      'Amount': amount,
      'DecryptPassword': password,
      'UnlockDelayHours': unlockDelayHours,
    };

    try {
      final response = await postJson("/SendReserveTransaction", params: params);
      final data = response['data'];

      if (data['Success'] != null && data['Success'] == true) {
        return data['Message'];
      }
      Toast.error(data['Message']);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> callBack(String password, String txHash) async {
    try {
      final response = await getText("/CallBackReserveAccountTx/$txHash/$password", cleanPath: false);
      final data = jsonDecode(response);
      if (data['Success'] != null && data["Success"] == true) {
        return data['Hash'];
      }
      Toast.error(data['Message']);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> recoverAccount({
    required String recoveryPhrase,
    required String address,
    required String password,
  }) async {
    try {
      final response = await getText("/RecoverReserveAccountTx/$recoveryPhrase/$address/$password", cleanPath: false);
      final data = jsonDecode(response);
      if (data['Success'] != null && data["Success"] == true) {
        return data['Hash'];
      }

      Toast.error(data['Message']);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> transferFromReserveAccount({
    required String id,
    required String toAddress,
    required String fromAddress,
    required String password,
    required int delayHours,
    String? backupUrl,
  }) async {
    try {
      const url = "/ReserveTransferNFT";
      final params = {
        'FromAddress': fromAddress,
        'ToAddress': toAddress,
        'DecryptPassword': password,
        'UnlockDelayHours': delayHours - 24,
        'SmartContractUID': id,
      };

      if (backupUrl != null && backupUrl.isNotEmpty) {
        params['BackupURL'] = backupUrl;
      }

      print("**********");
      print(jsonEncode(params));
      print("**********");

      final response = await postJson(url, timeout: 0, params: params, cleanPath: false);
      final data = response['data'];

      if (data['Success'] == true) {
        Toast.message(data['Message'] ?? 'Success: NFT Transfer has been started.');
        return true;
      }

      print(data);

      Toast.error(data['Message']);
      return false;
    } catch (e) {
      print(e);
      Toast.error(e.toString());
      return false;
    }
  }

  Future<bool> downloadAssets(String scId, String address, String password) async {
    try {
      final response = await getText("/GetReserveAccountNFTAssets/$scId/$address/$password", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        Toast.message(data['Message']);
        return true;
      }

      Toast.error(data['Message']);
      return false;
    } catch (e) {
      print(e);
      Toast.error("A problem occurred");
      return false;
    }
  }

  Future<bool> isUnlockedV2(String address) async {
    final response = await getText("/UnlockReserveAccount/$address/0/checking", cleanPath: false);
    final data = jsonDecode(response);

    print(data);

    return data['AlreadyUnlocked'] == true;
  }

  Future<bool> unlockV2(String address, String password) async {
    final response = await getText("/UnlockReserveAccount/$address/0/$password", cleanPath: false);
    final data = jsonDecode(response);

    print(data);

    return data['Success'] == true;
  }
}
