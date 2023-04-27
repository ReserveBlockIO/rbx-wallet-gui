import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/utils/toast.dart';

class RawService extends BaseService {
  RawService()
      : super(
          hostOverride: "${Env.explorerApiBaseUrl}/raw",
        );

  Future<int?> getTimestamp() async {
    try {
      final response = await postJson('/timestamp');
      print(response);
      return response['data'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int?> getNonce(String address) async {
    try {
      final response = await postJson('/nonce/$address');
      return response['data'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<double?> getFee(
    Map<String, dynamic> transactionData,
  ) async {
    try {
      final response = await postJson('/fee', params: {'transaction': transactionData});
      return response['data']['Fee'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> getHash(
    Map<String, dynamic> transactionData,
  ) async {
    try {
      final response = await postJson(
        '/hash',
        params: {'transaction': transactionData},
      );
      return response['data']['Hash'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> validateSignature(String message, String address, String signature) async {
    try {
      final response = await postJson(
        '/validate-signature/$message/$address/$signature/',
        cleanPath: false,
      );
      return response['data'] == true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map<String, dynamic>?> sendTransaction({
    required Map<String, dynamic> transactionData,
    bool execute = false,
  }) async {
    final data = transactionData;

    try {
      final response = await postJson(
        execute ? '/send' : '/verify',
        params: {'transaction': data},
      );
      return response['data'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> compileAndMintSmartContract(Map<String, dynamic> payload, Keypair keypair) async {
    try {
      final response = await postJson('/smart-contract-data/', params: payload, responseIsJson: true);

      final txData = await RawTransaction.generate(
        keypair: keypair,
        amount: 0.0,
        toAddress: keypair.public,
        data: response['data'],
        txType: TxType.nftMint,
      );

      if (txData == null) {
        Toast.error("Invalid transaction data.");
        return false;
      }

      final tx = await RawService().sendTransaction(
        transactionData: txData,
        execute: true,
      );

      print(tx);

      if (tx != null && tx['Result'] == "Success") {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
