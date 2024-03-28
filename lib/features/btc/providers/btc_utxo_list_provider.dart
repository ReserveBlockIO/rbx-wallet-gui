import '../models/btc_utxo.dart';
import '../services/btc_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'btc_utxo_list_provider.g.dart';

@Riverpod(keepAlive: true)
class BtcUtxoList extends _$BtcUtxoList {
  @override
  List<BtcUtxo> build(String address) {
    return [];
  }

  load() async {
    state = await BtcService().listUtxos(address);
  }
}
