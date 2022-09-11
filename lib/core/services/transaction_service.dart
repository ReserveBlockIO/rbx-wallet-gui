import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/adnr/models/adnr_response.dart';
import 'package:rbx_wallet/features/asset/web_asset.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/models/web_nft.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiler_response.dart';
import 'package:rbx_wallet/features/smart_contracts/models/detailed_smart_contract.dart';
import 'package:rbx_wallet/features/store/models/listing.dart';
import 'package:rbx_wallet/features/store/models/store.dart';
import 'package:rbx_wallet/features/store/models/store_collection.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/utils/toast.dart';

class TransactionService extends BaseService {
  TransactionService()
      : super(
          hostOverride: Env.transactionApiBaseUrl,
        );

// Raw TXs

  Future<Map<String, dynamic>?> getTimestamp() async {
    try {
      return await getJson('/timestamp');
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getNonce(String address) async {
    try {
      return await getJson('/nonce/$address');
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getFee(
    Map<String, dynamic> transactionData,
  ) async {
    try {
      return await postJson('/tx/fee', params: {'transaction': transactionData});
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> getHash(
    Map<String, dynamic> transactionData,
  ) async {
    try {
      return await postJson(
        '/tx/hash',
        params: {'transaction': transactionData},
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> validateSignature(String message, String address, String signature) async {
    try {
      print("Message: $message");
      print("Address: $address");
      print("Signature: $signature");

      return await getJson(
        '/validate-signature/$message/$address/$signature',
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
    // print("TX");
    // print(jsonEncode(transactionData));

    final data = transactionData;
    // if (data.containsKey("Amount") && data['Amount'] == 0) {
    //   data['Amount'] = Decimal.parse('0.0');hash
    // }
    // print("TX Updated?");

    // print(jsonEncode(data));

    try {
      return await postJson(
        execute ? '/tx/send' : '/tx/verify',
        params: {'transaction': data},
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

// Assets

  Future<WebAsset?> uploadAsset(Uint8List bytes, String filename, String? ext) async {
    FormData body = FormData();

    // final filename = ext != null ? "upload.$ext" : "upload.unknown";

    final MultipartFile file = MultipartFile.fromBytes(bytes, filename: filename);
    MapEntry<String, MultipartFile> entry = MapEntry("file", file);

    body.files.add(entry);

    final response = await postFormData('/asset/', data: body);

    if (!response.containsKey("asset")) return null;

    final asset = WebAsset(
      location: response['asset'],
    );

    return asset;
  }

  Future<String?> uploadImage(Uint8List bytes, String? ext) async {
    FormData body = FormData();

    final filename = ext != null ? "upload.$ext" : "upload.unknown";

    final MultipartFile file = MultipartFile.fromBytes(bytes, filename: filename);
    MapEntry<String, MultipartFile> entry = MapEntry("file", file);

    body.files.add(entry);

    final response = await postFormData('/image/', data: body);

    if (!response.containsKey("image")) return null;

    return response['image'];
  }

  // Smart Contracts

  Future<dynamic> compileAndMintSmartContract(Map<String, dynamic> payload, Keypair keypair) async {
    try {
      final response = await postJson('/nft-data', params: payload, responseIsJson: true);

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

      final tx = await TransactionService().sendTransaction(
        transactionData: txData,
        execute: true,
      );

      if (tx != null && tx['data']['Result'] == "Success") {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<CompilerResponse?> compileSmartContract(Map<String, dynamic> payload) async {
    try {
      final response = await postJson(
        "/smartcontract",
        params: payload,
        responseIsJson: true,
      );

      final csc = CompilerResponse.fromJson(response['data'][0]);
      return csc;
    } catch (e, stackTrace) {
      print('compileSmartContract error');
      print(e);
      print(stackTrace);
      return null;
    }
  }

  Future<bool> mintSmartContract(String id) async {
    try {
      final data = await getText('/smartcontract/mint/$id');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<DetailedSmartContract?> retrieveSmartContract(String id) async {
    try {
      final response = await getText('/smartcontract/$id');
      final data = jsonDecode(response);
      return DetailedSmartContract.fromJson(data[0]);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Nft>> listNfts(String email, String address) async {
    try {
      final params = {
        'email': email,
        'address': address,
      };

      final response = await getJson('/nft', params: params, responseIsJson: true);
      final List<Nft> results = response['data'].map<Nft>((json) => WebNft.fromJson(json).smartContract).toList();
      return results;
    } catch (e) {
      print(e);

      return [];
    }
  }

  Future<List<Nft>> listMintedNfts(String email, String address) async {
    try {
      final params = {
        'email': email,
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

  Future<Nft?> retrieveNft(String id) async {
    try {
      final response = await getJson('/nft/$id', responseIsJson: true);

      return WebNft.fromJson(response['data']).smartContract;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Wallets

  Future<bool> createWallet(String email, String address) async {
    try {
      final params = {'email': email, 'address': address};
      await postJson('/wallet', params: params);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Store Listings

  Future<List<Listing>> listListings({
    required String storeSlug,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'store': storeSlug,
      };
      final response = await getJson('/listing', params: params);

      final List<Listing> results = response['listings'].map<Listing>((json) => Listing.fromJson(json)).toList();
      return results;
    } catch (e) {
      print(e);

      return [];
    }
  }

  Future<Listing?> retrieveListing(String slug) async {
    try {
      final data = await getJson('/listing/$slug');
      return Listing.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> createListing(Map<String, dynamic> params) async {
    try {
      final response = await postJson('/listing', params: params);

      return response['data']['slug'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Bidding

  Future<bool> createRbxBid({
    required Listing listing,
    required double amount,
    required String email,
    required String address,
    String? collectionSlug,
  }) async {
    final params = {
      'listing': listing.id,
      'address': address,
      'email': email,
      'amount': amount,
      'payment_type': 'rbx',
      'collection_slug': collectionSlug,
    };
    try {
      final response = await postJson('/bid', params: params);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> createCcBid({
    required Listing listing,
    required double amount,
    required String email,
    required String address,
    String? collectionSlug,
  }) async {
    final params = {
      'listing': listing.id,
      'address': address,
      'email': email,
      'amount': amount,
      'payment_type': "cc",
      'collection_slug': collectionSlug,
    };
    try {
      final response = await postJson('/bid', params: params);
      return response['data']['redirect'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Purchase

  Future<bool> createRbxPurchase({
    required Listing listing,
    required String email,
    required String address,
    String? collectionSlug,
  }) async {
    final params = {
      'listing': listing.id,
      'address': address,
      'email': email,
      'payment_type': 'rbx',
      'collection_slug': collectionSlug,
    };
    try {
      final response = await postJson('/purchase', params: params);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> createCcPurchase({
    required Listing listing,
    required String email,
    required String address,
    String? collectionSlug,
  }) async {
    final params = {
      'listing': listing.id,
      'address': address,
      'email': email,
      'payment_type': "cc",
      'collection_slug': collectionSlug,
    };
    try {
      final response = await postJson('/purchase', params: params);
      return response['data']['redirect'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Collections

  Future<StoreCollection?> retrieveStoreCollection(String slug) async {
    try {
      final data = await getJson('/collection/$slug');
      return StoreCollection.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Stores

  Future<List<Store>> listStores({
    required String email,
    required String address,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'email': email,
        'address': address,
      };
      final response = await getJson('/store', params: params);

      final List<Store> results = response['stores'].map<Store>((json) => Store.fromJson(json)).toList();
      return results;
    } catch (e) {
      print(e);

      return [];
    }
  }

  Future<Store?> retrieveStore(String slug) async {
    try {
      final data = await getJson('/store/retrieve/$slug');
      return Store.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Store?> createStore({
    required String email,
    required String address,
    required String name,
    required String account,
  }) async {
    final Map<String, dynamic> params = {
      'email': email,
      'address': address,
      'name': name,
      'stripe_account': account,
    };
    try {
      final response = await postJson('/store', params: params);
      return Store.fromJson(response['data']);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> stripeOnboard() async {
    try {
      final response = await postJson('/store/onboard');
      return response['data']['redirect'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Asset Transfer

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

  Future<dynamic> nftTransferData(String scId, String toAddress, String locators) async {
    print("SCID: $scId");
    try {
      final response = await postJson("/nft-transfer-data/$scId/$toAddress/$locators/", responseIsJson: true);
      return response['data'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> beaconUpload(String scId, String toAddress, String signature) async {
    try {
      final response = await getText("/beacon/upload/$scId/$toAddress/$signature/");
      final data = jsonDecode(response);
      print(data);
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> beaconDownload(String scId, String toAddress, String signature) async {
    try {
      final response = await getText("/beacon/upload/$scId/$toAddress/$signature/");
      final data = jsonDecode(response);
      print(data);
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> beaconAssets(String scId, String locators, String signature) async {
    try {
      await getText("/beacon-assets/$scId/$locators/$signature/");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Burn

  Future<dynamic> nftBurnData(String scId, String toAddress) async {
    try {
      final response = await postJson("/nft-burn-data/$scId/$toAddress/", responseIsJson: true);
      return response['data']['Message'];
    } catch (e) {
      print(e);
      return null;
    }
  }

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
}
