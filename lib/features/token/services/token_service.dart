import 'dart:convert';

import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/services/base_service.dart';

class TokenService extends BaseService {
  TokenService() : super(apiBasePathOverride: "/tkapi/TKV2");

  Future<dynamic> compileAndMintSmartContract() async {
    //TODO
  }

  Future<bool> mint({
    required String scId,
    required String fromAddress,
    required double amount,
  }) async {
    try {
      final response = await getText("/TokenMint/$scId/$fromAddress/$amount", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error("Error minting token");
      return false;
    } catch (e) {
      print("Error minting token");
      print(e);
      return false;
    }
  }

  Future<bool> transfer({
    required String scId,
    required String fromAddress,
    required String toAddress,
    required double amount,
  }) async {
    try {
      final response = await getText("/TransferToken/$scId/$fromAddress/$toAddress/$amount", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error("Error transferring token");
      return false;
    } catch (e) {
      print("Error transferring token");
      print(e);
      return false;
    }
  }

  Future<bool> burn({
    required String scId,
    required String fromAddress,
    required double amount,
  }) async {
    try {
      final response = await getText("/BurnToken/$scId/$fromAddress/$amount", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error("Error burning token");
      return false;
    } catch (e) {
      print("Error burning token");
      print(e);
      return false;
    }
  }

  Future<bool> pause({
    required String scId,
    required String fromAddress,
  }) async {
    try {
      final response = await getText("/PauseToken/$scId/$fromAddress", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error("Error pausing/unpausing token");
      return false;
    } catch (e) {
      print("Error pausing/unpausing token");
      print(e);
      return false;
    }
  }

  Future<bool> changeOwnership({
    required String scId,
    required String fromAddress,
    required String toAddress,
  }) async {
    try {
      final response = await getText("/ChangeTokenContractOwnership/$scId/$fromAddress/$toAddress", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error("Error changing ownership");
      return false;
    } catch (e) {
      print("Error changing ownership");
      print(e);
      return false;
    }
  }
}
