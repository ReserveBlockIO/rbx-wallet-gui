import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'web_shop.freezed.dart';
part 'web_shop.g.dart';

@freezed
class WebShop with _$WebShop {
  const WebShop._();

  factory WebShop({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'unique_id') required String uid,
    @JsonKey(name: 'owner_address') required String ownerAddress,
    @JsonKey(name: 'is_offline') required bool isOffline,
  }) = _WebShop;

  factory WebShop.fromJson(Map<String, dynamic> json) => _$WebShopFromJson(json);
}
