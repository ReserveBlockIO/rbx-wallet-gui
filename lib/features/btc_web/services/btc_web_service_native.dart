import '../models/btc_web_transaction.dart';
import '../models/btc_web_balance_info.dart';
import '../models/btc_web_account.dart';
import 'btc_web_service_interface.dart';

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
  Future<String?> sendTransaction(String senderWif, String recipientAddress, double amount, int feeRate) {
    throw UnimplementedError();
  }

  @override
  Future<String> signMessage(String wif, String message) {
    // TODO: implement signMessage
    throw UnimplementedError();
  }
}
