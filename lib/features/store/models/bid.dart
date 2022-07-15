import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'bid.freezed.dart';
part 'bid.g.dart';

@freezed
abstract class Bid with _$Bid {
  const Bid._();

  factory Bid({
    @JsonKey(name: "wallet_address") required String walletAddress,
    required double amount,
    @JsonKey(name: "amount_rbx") required double amountRbx,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _Bid;

  factory Bid.fromJson(Map<String, dynamic> json) => _$BidFromJson(json);

  String get amountLabel {
    return "\$${amount.toStringAsFixed(2)} USD | $amountRbx RBX";
  }

  String get createdAtLabel {
    return DateFormat.yMd().add_jm().format(createdAt);
  }
}
