import "package:rbx_wallet/features/btc/models/btc_account.dart";
import "package:rbx_wallet/features/btc/models/btc_address_type.dart";
import "package:rbx_wallet/features/btc/services/btc_service.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part 'btc_account_list_provider.g.dart';

@Riverpod(keepAlive: true)
class BtcAccountList extends _$BtcAccountList {
  @override
  List<BtcAccount> build() {
    return [];
  }

  Future<void> load() async {
    state = await BtcService().listAccounts();
  }

  Future<BtcAccount?> create() async {
    final account = await BtcService().createAccount();
    if (account != null) {
      await load();
      return await BtcService().retrieveAccount(account.address, omitPrivateKey: false);
    }

    return null;
  }

  Future<bool> importPrivateKey(String privateKey, BtcAddressType addressType) async {
    final success = await BtcService().importPrivateKey(privateKey, addressType);
    if (success) {
      await load();
      return true;
    }

    return false;
  }

}
