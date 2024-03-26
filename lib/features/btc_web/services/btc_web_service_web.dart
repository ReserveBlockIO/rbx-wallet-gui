// ignore_for_file: avoid_web_libraries_in_flutter
@JS()
library rbx_btc;

import 'dart:convert';
import 'dart:js' as js;
import 'dart:js_util';
import 'package:js/js.dart';

import 'package:rbx_wallet/features/btc_web/models/btc_web_account.dart';
import 'package:rbx_wallet/features/btc_web/models/btc_web_balance_info.dart';
import 'package:rbx_wallet/features/btc_web/models/btc_web_transaction.dart';
import 'package:rbx_wallet/features/btc_web/services/btc_web_service_interface.dart';
import 'package:rbx_wallet/utils/toast.dart';

@JS()
external btcAddressInfo(String address);

@JS()
external btcTransactions(String address, int limit, int? before);

@JS()
external btcSendTransaction(String senderWif, String senderAddress, String recipientAddress, double amount);

class BtcWebServiceImpl extends BtcWebServiceInterface {
  @override
  Future<BtcWebAccount?> keypairFromRandom() async {
    try {
      final data = await js.context.callMethod('btcKeypairFromRandom', []);
      final account = BtcWebAccount.fromJson(jsonDecode(data));
      print(account);
      return account;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<BtcWebAccount?> keypairFromWif(String wif) async {
    try {
      final data = await js.context.callMethod('btcKeypairFromWif', [wif]);
      final account = BtcWebAccount.fromJson(jsonDecode(data));
      print(account);
      return account;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<BtcWebAccount?> keypairFromRandomMnemonic() async {
    try {
      final data = await js.context.callMethod('btcKeypairFromRandomMnemonic', []);
      final account = BtcWebAccount.fromJson(jsonDecode(data));
      print(account);
      return account;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<BtcWebAccount?> keypairFromMnemonic(String mnemonic) async {
    try {
      final data = await js.context.callMethod('btcKeypairFromMnemonic', [mnemonic]);
      final account = BtcWebAccount.fromJson(jsonDecode(data));
      print(account);
      return account;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<BtcWebAccount?> keypairFromEmailPassword(String email, password) async {
    try {
      final data = await js.context.callMethod('btcKeypairFromEmailPassword', [email, password]);
      final account = BtcWebAccount.fromJson(jsonDecode(data));
      print(account);
      return account;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<BtcWebBalanceInfo?> addressInfo(String address) async {
    try {
      final promise = btcAddressInfo(address);
      final data = await promiseToFuture(promise);

      final balanceInfo = BtcWebBalanceInfo.fromJson(jsonDecode(data));
      print(balanceInfo);
      return balanceInfo;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<BtcWebTransaction>> listTransactions(String address, {int limit = 50, int? before}) async {
    print("Listing txs for $address...");
    try {
      final promise = btcTransactions(address, limit, before);
      final data = await promiseToFuture(promise);
      final decodedData = jsonDecode(data);
      print("---------");

      print(jsonEncode(decodedData['transactions'][0]));
      print("---------");

      final List<dynamic> txDatas = decodedData['transactions'];
      final List<BtcWebTransaction> transactions = [];

      for (final json in txDatas) {
        final t = BtcWebTransaction.fromJson(json);
        transactions.add(t);
      }

      return transactions;
    } catch (e) {
      print("Error");
      print(e);
      return [];
    }
  }

  @override
  Future<BtcWebTransaction?> sendTransaction(String senderWif, String senderAddress, String recipientAddress, double amount) async {
    try {
      final promise = btcSendTransaction(senderWif, senderAddress, recipientAddress, amount);
      final data = await promiseToFuture(promise);
      final decodedData = jsonDecode(data);

      if (decodedData['success'] == true) {
        if (decodedData['result'] != null && decodedData['result']['tx'] != null) {
          return BtcWebTransaction.fromJson(decodedData['result']['tx']);
        }
      }

      if (decodedData['error'] != null) {
        Toast.error(decodedData['error']);
        return null;
      }

      Toast.error();
      return null;
    } catch (e) {
      Toast.error(e.toString());
      return null;
    }
  }
}
