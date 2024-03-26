import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/services/base_service.dart';
import '../models/btc_account.dart';
import '../models/btc_account_sync_info.dart';
import '../models/btc_address_type.dart';
import 'package:collection/collection.dart';
import '../models/btc_send_tx_result.dart';
import '../models/btc_transaction.dart';
import '../models/btc_utxo.dart';

class BtcService extends BaseService {
  BtcService() : super(apiBasePathOverride: "/btcapi/BTCV2");

  Future<BtcAddressType> addressType() async {
    BtcAddressType? type;

    try {
      final result = await getJson("/GetDefaultAddressType");
      if (result['Success'] == true) {
        type = BtcAddressType.values.firstWhereOrNull((t) => t.label == result['AddressType']);
      }
      return type ?? BtcAddressType.segwit;
    } catch (e) {
      print(e);
      return BtcAddressType.segwit;
    }
  }

  Future<BtcAccountSyncInfo?> accountSyncInfo() async {
    try {
      final result = await getJson("/GetLastAccounySync");

      if (result["Success"] == true) {
        return BtcAccountSyncInfo(
          lastSync: DateTime.parse(result['LastChecked']),
          nextSync: DateTime.parse(result['NextCheck']),
        );
      }
      print(result["Message"]);

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<BtcAccount?> createAccount() async {
    try {
      final result = await getJson("/GetNewAddress");
      if (result["Success"] == true) {
        return BtcAccount(
          id: 0,
          address: result['Address'] ?? '',
          privateKey: result['PrivateKey'] ?? '',
          wifKey: result['WifKey'] ?? '',
        );
      }
      print(result['Message']);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> importPrivateKey(String privateKey, BtcAddressType addressType) async {
    try {
      final result = await getJson("/ImportPrivateKey/$privateKey/${addressType.value}");
      if (result["Success"] == true) {
        return true;
      }
      print(result['Message']);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<BtcAccount>> listAccounts() async {
    try {
      final result = await getJson("/GetBitcoinAccountList/true");
      if (result["Success"] == true) {
        final accounts = result['BitcoinAccounts'] as List;

        return accounts.map((json) => BtcAccount.fromJson(json)).toList();
      }
      print(result['Message']);
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<BtcAccount?> retrieveAccount(String address, {bool omitPrivateKey = true}) async {
    try {
      final result = await getJson("/GetBitcoinAccount/$address/$omitPrivateKey");
      if (result["Success"] == true) {
        return BtcAccount.fromJson(result['BitcoinAccount']);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<BtcSendTxResult> sendTransaction({
    required String fromAddress,
    required String toAddress,
    required double amount,
    required int feeRate,
  }) async {
    try {
      final result = await getJson(
        "/SendTransaction/$fromAddress/$toAddress/$amount/$feeRate/true",
        inspect: true,
        cleanPath: true,
      );
      print(result);

      if (result['Success'] == true) {
        return BtcSendTxResult(
          success: true,
          message: result['Message'],
        );
      }
      return BtcSendTxResult(
        success: false,
        message: result['Message'] ?? "A Problem Occurred",
      );
    } catch (e) {
      return BtcSendTxResult(
        success: false,
        message: e.toString(),
      );
    }
  }

  Future<List<BtcUtxo>> listUtxos(String address) async {
    try {
      final result = await getJson("/GetAddressUTXOList/$address", cleanPath: false);

      if (result['Success'] == true) {
        final items = (result['UTXOs'] ?? []) as List;
        return items.map((item) => BtcUtxo.fromJson(item)).toList();
      }

      print(result["Message"]);

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<BtcTransaction>> listTransactions(String address) async {
    try {
      final result = await getJson("/GetAddressTXList/$address", cleanPath: false);

      if (result['Success'] == true) {
        final items = (result['TXs'] ?? []) as List;
        return items.map((item) => BtcTransaction.fromJson(item)).toList();
      }

      print(result["Message"]);

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String?> createAdnr({
    required String address,
    required String btcAddress,
    required String name,
  }) async {
    try {
      final result = await getJson("/CreateAdnr/$address/$btcAddress/$name", cleanPath: false);

      if (result['Success'] == true) {
        if (result.containsKey('Hash')) {
          return result['Hash'];
        }
      }

      Toast.error(result['Message']);
      return null;
    } catch (e, st) {
      print(e);
      print(st);
      Toast.error();
      return null;
    }
  }

  Future<dynamic> transferAdnr({
    required String fromAddress,
    required String toAddress,
    required String fromBtcAddress,
    required String toBtcAddress,
  }) async {
    try {
      final result = await getJson("/TransferAdnr/$fromAddress/$toAddress/$fromBtcAddress/$toBtcAddress", cleanPath: false);

      if (result['Success'] == true) {
        if (result.containsKey('Hash')) {
          return result['Hash'];
        }
      }

      Toast.error(result['Message']);
      return null;
    } catch (e, st) {
      print(e);
      print(st);
      Toast.error();
      return null;
    }
  }

  Future<dynamic> deleteAdnr({
    required String address,
    required String btcAddress,
  }) async {
    try {
      final result = await getJson("/DeleteAdnr/$address/$btcAddress", cleanPath: false);

      if (result['Success'] == true) {
        if (result.containsKey('Hash')) {
          return result['Hash'];
        }
      }

      Toast.error(result['Message']);
      return null;
    } catch (e, st) {
      print(e);
      print(st);
      Toast.error();
      return null;
    }
  }
}
