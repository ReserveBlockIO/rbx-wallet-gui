import 'package:freezed_annotation/freezed_annotation.dart';
import '../../transactions/models/web_transaction.dart';

import '../../block/block.dart';

part 'web_block.freezed.dart';
part 'web_block.g.dart';

@freezed
abstract class WebBlock with _$WebBlock {
  const WebBlock._();

  factory WebBlock({
    required int height,
    @JsonKey(name: "date_crafted") required DateTime dateCrafted,
    required String hash,
    @JsonKey(name: "validator_address") required String validator,
    @JsonKey(name: "total_amount") required double totalAmount,
    @JsonKey(name: "total_reward") required double totalReward,
    // @JsonKey(name: "number_of_transactions") required int numberOfTransactions,
    @Default([]) List<WebTransaction> transactions,
    required int size,
    @JsonKey(name: "craft_time") required int craftTime,
    @JsonKey(name: "previous_hash") required String prevHash,
  }) = _WebBlock;

  factory WebBlock.fromJson(Map<String, dynamic> json) => _$WebBlockFromJson(json);

  Block toNativeBlock() {
    return Block(
      height: height,
      chainRefId: '',
      timestamp: dateCrafted.millisecondsSinceEpoch,
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
      // numberOfTransactions: numberOfTransactions,
      numberOfTransactions: transactions.length,
      size: size,
      craftTime: craftTime,
      transactions: [],
    );
  }
}
