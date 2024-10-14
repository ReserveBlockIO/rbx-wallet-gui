import '../models/btc_web_account.dart';
import '../models/btc_web_balance_info.dart';
import '../models/btc_web_transaction.dart';

abstract class BtcWebServiceInterface {
  Future<BtcWebAccount?> keypairFromRandom();
  Future<BtcWebAccount?> keypairFromWif(String wif);
  Future<BtcWebAccount?> keypairFromRandomMnemonic();
  Future<BtcWebAccount?> keypairFromMnemonic(String mnemonic);
  Future<BtcWebAccount?> keypairFromEmailPassword(String email, password);
  Future<BtcWebBalanceInfo?> addressInfo(String address);
  Future<List<BtcWebTransaction>> listTransactions(String address, {int limit = 50, int? before});
  Future<String?> sendTransaction(String senderWif, String recipientAddress, double amount, int feeRate);
  Future<String> signMessage(String wif, String message);
}
