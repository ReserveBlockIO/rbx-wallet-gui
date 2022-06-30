import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/block/block.dart';

part 'web_block.freezed.dart';
part 'web_block.g.dart';

@freezed
abstract class WebBlock with _$WebBlock {
  const WebBlock._();

  factory WebBlock({
    required int height,
    required int timestamp,
    required String hash,
    required String validator,
    @JsonKey(name: "total_amount") required double totalAmount,
    @JsonKey(name: "total_reward") required double totalReward,
    @JsonKey(name: "number_of_transactions") required int numberOfTransactions,
    required int size,
    @JsonKey(name: "craft_time") required int craftTime,
    @JsonKey(name: "prev_hash") required String prevHash,
  }) = _WebBlock;

  factory WebBlock.fromJson(Map<String, dynamic> json) =>
      _$WebBlockFromJson(json);

  Block toNativeBlock() {
    return Block(
      height: height,
      chainRefId: '',
      timestamp: timestamp,
      hash: hash,
      prevHash: prevHash,
      merkleRoot: "",
      stateRoot: "",
      validator: validator,
      validatorSignature: "",
      validatorAnswer: "",
      totalValidators: 0,
      version: 1,
      totalAmount: totalAmount,
      totalReward: totalReward,
      numberOfTransactions: numberOfTransactions,
      size: size,
      craftTime: craftTime,
      transactions: [],
    );
  }
}
