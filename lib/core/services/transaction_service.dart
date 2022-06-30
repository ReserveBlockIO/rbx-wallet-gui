import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';

class TransactionService extends BaseService {
  TransactionService()
      : super(
          hostOverride: Env.transactionApiBaseUrl,
        );

  Future<Map<String, dynamic>?> getTimestamp() async {
    try {
      return await getJson('/GetTimestamp');
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getNonce(String address) async {
    try {
      return await getJson('/GetAddressNonce/$address');
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getFee(
    Map<String, dynamic> transactionData,
  ) async {
    print(transactionData);
    try {
      return await postJson('/GetRawTxFee', params: transactionData);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getHash(
    Map<String, dynamic> transactionData,
  ) async {
    print(transactionData);
    try {
      return await postJson('/GetTxHash', params: transactionData);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> validateSignature(
      String message, String address, String signature) async {
    try {
      print("Message: $message");
      print("Address: $address");
      print("Signature: $signature");

      return await getJson(
        '/ValidateSignature/$message/$address/$signature',
        cleanPath: false,
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> sendTransaction({
    required Map<String, dynamic> transactionData,
    bool execute = false,
  }) async {
    try {
      return await postJson(
        execute ? '/SendRawTransaction' : '/VerifyRawTransaction',
        params: transactionData,
      );
    } catch (e) {
      print(e);
      return null;
    }
  }
}
