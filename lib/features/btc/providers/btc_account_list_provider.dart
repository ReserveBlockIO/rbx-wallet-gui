import "package:rbx_wallet/features/btc/models/btc_account.dart";
import "package:rbx_wallet/features/btc/services/btc_service.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:collection/collection.dart";

part 'btc_account_list_provider.g.dart';

@Riverpod(keepAlive: true)
class BtcAccountList extends _$BtcAccountList {
  @override
  List<BtcAccount> build() {
    return [];
  }

  Future<void> load() async {
    state = await BtcService().listAccounts();

    print(state);
  }

  Future<BtcAccount?> create() async {
    final account = await BtcService().createAccount();
    if (account != null) {
      await load();
      return await BtcService().retrieveAccount(account.address, omitPrivateKey: false);
    }

    return null;
  }
}
