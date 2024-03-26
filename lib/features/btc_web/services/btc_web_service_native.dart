import 'package:rbx_wallet/features/btc_web/models/btc_web_transaction.dart';
import 'package:rbx_wallet/features/btc_web/models/btc_web_balance_info.dart';
import 'package:rbx_wallet/features/btc_web/models/btc_web_account.dart';
import 'package:rbx_wallet/features/btc_web/services/btc_web_service_interface.dart';

class BtcWebServiceImpl extends BtcWebServiceInterface {
  @override
  Future<BtcWebBalanceInfo?> addressInfo(String address) {
    throw UnimplementedError();
  }

  @override
  Future<BtcWebAccount?> keypairFromEmailPassword(String email, password) {
    throw UnimplementedError();
  }

  @override
  Future<BtcWebAccount?> keypairFromMnemonic(String mnemonic) {
    throw UnimplementedError();
  }

  @override
  Future<BtcWebAccount?> keypairFromRandom() {
    throw UnimplementedError();
  }

  @override
  Future<BtcWebAccount?> keypairFromRandomMnemonic() {
    throw UnimplementedError();
  }

  @override
  Future<BtcWebAccount?> keypairFromWif(String wif) {
    throw UnimplementedError();
  }

  @override
  Future<List<BtcWebTransaction>> listTransactions(String address, {int limit = 50, int? before}) {
    throw UnimplementedError();
  }

  @override
  Future<BtcWebTransaction?> sendTransaction(String senderWif, String senderAddress, String recipientAddress, double amount) {
    throw UnimplementedError();
  }
}