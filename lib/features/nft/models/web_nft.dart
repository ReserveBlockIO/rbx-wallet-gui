import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/features/asset/proxied_asset.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'web_nft.freezed.dart';
part 'web_nft.g.dart';

@freezed
abstract class WebNft with _$WebNft {
  const WebNft._();

  factory WebNft({
    required String identifier,
    required String name,
    required String description,
    @JsonKey(name: "owner_address") required String ownerAddress,
    @JsonKey(name: "minter_name") required String minterName,
    @JsonKey(name: "primary_asset_name") required String primaryAssetName,
    @JsonKey(name: "primary_asset_size") required int primaryAssetSize,
    @JsonKey(name: "primary_asset_remote_key") String? primaryAssetRemoteKey,
    @JsonKey(name: "smart_contract_data") required String smartContractDataString,
    @JsonKey(name: "minted_at") required DateTime mintedAt,
  }) = _WebNft;

  factory WebNft.fromJson(Map<String, dynamic> json) => _$WebNftFromJson(json);

  Map<String, dynamic> get smartContractData {
    final sanatizedString = smartContractDataString.replaceAll("'", '"');
    return jsonDecode(sanatizedString);
  }

  Nft get smartContract {
    return Nft.fromJson(smartContractData).copyWith(
      currentOwner: ownerAddress,
      proxiedAsset: primaryAssetRemoteKey != null
          ? ProxiedAsset(
              key: primaryAssetRemoteKey!,
              fileName: primaryAssetName,
              fileSize: primaryAssetSize,
              authorName: minterName,
            )
          : null,
    );
  }

  String get mintedAtLabel {
    return timeago.format(mintedAt, allowFromNow: true);
  }

  String get mintedAtLabelPrecise {
    return DateFormat.yMd().add_jm().format(mintedAt);
  }
}
