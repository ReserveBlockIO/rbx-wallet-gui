import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/asset/asset.dart';

part 'multi_asset.freezed.dart';
part 'multi_asset.g.dart';

@freezed
abstract class MultiAsset with _$MultiAsset {
  const MultiAsset._();

  static const compilerEnum = 2;

  @JsonSerializable(explicitToJson: true)
  const factory MultiAsset({
    @Default("") String id,
    @Default([]) List<Asset> assets,
  }) = _MultiAsset;

  factory MultiAsset.fromJson(Map<String, dynamic> json) => _$MultiAssetFromJson(json);

  factory MultiAsset.fromCompiler(dynamic json) {
    final List<Asset> assets = [];
    for (final Map<String, dynamic> asset in json) {
      if (asset.containsKey("FileName")) {
        asset["Name"] = asset["FileName"];
      }
      assets.add(Asset.fromJson(asset));
    }

    return MultiAsset(assets: assets);
  }

  List<Map<String, dynamic>> serializeForCompiler(String minterName) {
    return assets.map((a) {
      final b = a.toJson();

      b['FileName'] = b['Name'];
      b['AssetAuthorName'] = minterName;

      b.remove('Name');
      b.remove('bytes');

      return b;
    }).toList();
  }
}
