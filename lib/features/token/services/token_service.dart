import 'dart:convert';

import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/services/base_service.dart';

class TokenService extends BaseService {
  TokenService() : super(apiBasePathOverride: "/tkapi/TKV2");

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
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error minting token");
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
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error transferring token");
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
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error burning token");
      print(e);
      return false;
    }
  }

  Future<bool> pause({
    required String scId,
    required String fromAddress,
  }) async {
    try {
      final path = "/PauseTokenContract/$scId/$fromAddress";
      final response = await getText(path, cleanPath: false, inspect: true);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error pausing/unpausing token");
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
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error changing ownership");
      print(e);
      return false;
    }
  }

  Future<bool> banAddress({
    required String scId,
    required String fromAddress,
    required String banAddress,
  }) async {
    try {
      final response = await getText("/BanAddress/$scId/$fromAddress/$banAddress", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error banning address");
      print(e);
      return false;
    }
  }
}
