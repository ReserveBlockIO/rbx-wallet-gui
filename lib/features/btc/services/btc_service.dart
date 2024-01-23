import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/btc/models/btc_wallet.dart';

class BtcService extends BaseService {
  Future<List<BtcWallet>> listWallets() async {
    await Future.delayed(Duration(milliseconds: 300));

    return [
      BtcWallet(
        privateKey: "PRIVATE KEY HERE",
        publicKey: "PUBLIC KEY HERE",
        address: '1Lbcfr7sAHTD9CgdQo3HTMTkV8LK4ZnX71',
      ),
      BtcWallet(
        privateKey: "PRIVATE KEY HERE",
        publicKey: "PUBLIC KEY HERE",
        address: '3Lbcfr7sAHTD9CgdQo3HTMTkV8LK4ZnX71',
      ),
    ];
  }
}
