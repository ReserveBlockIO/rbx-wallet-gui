import 'package:freezed_annotation/freezed_annotation.dart';
import '../utils.dart';

part 'btc_utxo.freezed.dart';
part 'btc_utxo.g.dart';

@freezed
class BtcUtxo with _$BtcUtxo {
  const BtcUtxo._();

  factory BtcUtxo({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "TxId") required String hash,
    @JsonKey(name: "Value") required int value,
    @JsonKey(name: "Vout") required int vout,
    @JsonKey(name: "IsUsed") required bool isUsed,
  }) = _BtcUtxo;

  factory BtcUtxo.fromJson(Map<String, dynamic> json) => _$BtcUtxoFromJson(json);

  double get valueBtc {
    return satashisToBtc(value);
  }

  String get valueBtcLabel {
    return "${valueBtc.toStringAsFixed(9)} BTC";
  }
}
