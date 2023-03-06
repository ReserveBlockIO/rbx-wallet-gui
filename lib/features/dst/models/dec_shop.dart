import 'package:freezed_annotation/freezed_annotation.dart';

part 'dec_shop.freezed.dart';
part 'dec_shop.g.dart';

@freezed
class DecShop with _$DecShop {
  const DecShop._();

  factory DecShop({
    @JsonKey(name: "UniqueId") required String id,
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "DecShopURL") required String url,
    @JsonKey(name: "IP") String? ip,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "BlockHeight") int? blockHeight,
    @JsonKey(name: "DecShopHostingType") required int type,
    @JsonKey(name: "NeedsPublishToNetwork") required bool needsPublishToNetwork,
    @JsonKey(name: "IsOffline") required bool isOffline,
  }) = _DecShop;

  factory DecShop.fromJson(Map<String, dynamic> json) => _$DecShopFromJson(json);
}
