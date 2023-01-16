import 'package:freezed_annotation/freezed_annotation.dart';

part 'genesis_block.freezed.dart';
part 'genesis_block.g.dart';

@freezed
class GenesisBlock with _$GenesisBlock {
  const GenesisBlock._();

  factory GenesisBlock({
    @JsonKey(name: 'Height') required int height,
    @JsonKey(name: 'ChainRefId') required String chainRefId,
    @JsonKey(name: 'Timestamp') required int timestamp,
    @JsonKey(name: 'Hash') required String hash,
    @JsonKey(name: 'TotalAmount') required double totalAmount,
    @JsonKey(name: 'TotalReward') required double totalReward,
    @JsonKey(name: 'Size') required double size,
    @JsonKey(name: 'BCraftTime') required int bCraftTime,
  }) = _GenesisBlock;

  factory GenesisBlock.fromJson(Map<String, dynamic> json) => _$GenesisBlockFromJson(json);
}
