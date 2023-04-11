import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'web_nft.freezed.dart';
part 'web_nft.g.dart';

@freezed
class WebNft with _$WebNft {
  const WebNft._();

  factory WebNft({
    required String identifier,
    required String name,
    required String description,
    @JsonKey(name: 'minter_address') required String minterAddress,
    @JsonKey(name: 'owner_address') required String ownerAddress,
    @JsonKey(name: 'minter_name') required String minterName,
    @JsonKey(name: 'primary_asset_name') required String primaryAssetName,
    @JsonKey(name: 'primary_asset_size') required double primaryAssetSize,
    @JsonKey(name: 'minted_at') required DateTime mintedAt,
    @JsonKey(name: 'mint_transaction') required String mintTransaction,
    @JsonKey(name: 'burn_transaction') String? burnTransaction,
    required String data,
    @JsonKey(name: 'is_burned') required bool isBurned,
  }) = _WebNft;

  factory WebNft.fromJson(Map<String, dynamic> json) => _$WebNftFromJson(json);

  factory WebNft.empty() => WebNft(
        identifier: '',
        name: '',
        description: '',
        minterAddress: '',
        ownerAddress: '',
        minterName: '',
        primaryAssetName: '',
        primaryAssetSize: 0,
        mintedAt: DateTime.now(),
        mintTransaction: '',
        data: '',
        isBurned: false,
      );
}
