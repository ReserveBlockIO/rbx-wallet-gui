import 'dart:convert';

import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/adnr/models/adnr_response.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/models/web_nft.dart';
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
        toAddress: keypair.address,
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

  Future<List<Nft>> listMintedNfts(String address) async {
    try {
      final params = {
        'address': address,
      };

      final response = await getJson('/nft/minted', params: params, responseIsJson: true);
      final List<Nft> results = response['data'].map<Nft>((json) => WebNft.fromJson(json).smartContract).toList();
      return results;
    } catch (e) {
      print(e);

      return [];
    }
  }

  Future<dynamic> nftTransferData(String scId, String toAddress, String locator) async {
    try {
      final response = await postJson("/nft-transfer-data/$scId/$toAddress/$locator/", responseIsJson: true);
      print(response['data']);
      return response['data'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> nftBurnData(String scId, String toAddress) async {
    try {
      final response = await postJson("/nft-burn-data/$scId/$toAddress/", responseIsJson: true);
      return response['data']['Message'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Assets

  Future<String?> getLocators(
    String scId,
  ) async {
    try {
      final response = await getJson("/locators/$scId");
      return response["Locators"];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> beaconUpload(String scId, String toAddress, String signature, [int attempt = 0]) async {
    try {
      final data = await getJson("/beacon/upload/$scId/$toAddress/$signature", cleanPath: false);
      if (data['success'] == true) {
        return data['locator'];
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future<dynamic> beaconDownload(String scId, String toAddress, String signature) async {
  //   try {
  //     final response = await getText("/beacon/upload/$scId/$toAddress/$signature/");
  //     final data = jsonDecode(response);
  //     return data;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  Future<bool> beaconAssets(String scId, String locators, String address, String signature) async {
    try {
      final path = "/beacon-assets/$scId/$locators/$address/$signature";

      final assets = await getText(path, cleanPath: false);
      print("Assets: $assets");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // ADNRs

  Future<AdnrResponse> createAdnr(String address, String name) async {
    try {
      final response = await getText("/CreateAdnr/$address/$name");
      final data = jsonDecode(response);
      return AdnrResponse(
        success: data['Result'] == "Success",
        message: data['Message'],
        hash: data['Hash'],
      );
    } catch (e) {
      return AdnrResponse(success: false, message: "An error occurred: ${e.toString()}");
    }
  }

  Future<AdnrResponse> transferAdnr(String fromAddress, String toAddress) async {
    try {
      final response = await getText("/TransferAdnr/$fromAddress/$toAddress");
      final data = jsonDecode(response);
      return AdnrResponse(
        success: data['Result'] == "Success",
        message: data['Message'],
        hash: data['Hash'],
      );
    } catch (e) {
      return AdnrResponse(success: false, message: "An error occurred: ${e.toString()}");
    }
  }

  Future<AdnrResponse> deleteAdnr(String address) async {
    try {
      final response = await getText("/DeleteAdnr/$address");
      final data = jsonDecode(response);
      return AdnrResponse(
        success: data['Result'] == "Success",
        message: data['Message'],
        hash: data['Hash'],
      );
    } catch (e) {
      return AdnrResponse(success: false, message: "An error occurred: ${e.toString()}");
    }
  }

  // Shop

  // Not sure if these are needed yet
  Future<dynamic> publishShopData() async {}

  Future<dynamic> buyNowData() async {}

  Future<dynamic> bidData() async {}
}
