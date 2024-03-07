import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/btc/models/btc_account.dart';
import 'package:rbx_wallet/features/btc/models/btc_address_type.dart';
import 'package:collection/collection.dart';

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
}
