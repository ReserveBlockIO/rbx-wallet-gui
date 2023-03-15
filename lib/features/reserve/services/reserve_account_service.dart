import 'dart:convert';

import 'package:rbx_wallet/features/reserve/models/new_reserve_account.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/services/base_service.dart';

class ReserveAccountService extends BaseService {
  ReserveAccountService() : super(apiBasePathOverride: "/rsapi/RSV1");

  Future<String> wallets() async {
    return await getText('/GetAllReserveAccounts');
  }

  Future<NewReserveAccount?> create(String password) async {
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

  Future<NewReserveAccount?> recover({
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
      final response = await postJson("/SendReserveTransaction", params: params, inspect: true);
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
}
