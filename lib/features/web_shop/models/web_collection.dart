import 'package:freezed_annotation/freezed_annotation.dart';

import 'web_shop.dart';

part 'web_collection.freezed.dart';
part 'web_collection.g.dart';

shopToJson(WebShop? shop) {
  return shop?.id;
}

@freezed
class WebCollection with _$WebCollection {
  const WebCollection._();

  factory WebCollection({
    required int id,
    @JsonKey(toJson: shopToJson) WebShop? shop,
    required String name,
    required String description,
    @JsonKey(name: "is_live") @Default(true) bool isLive,
  }) = _WebCollection;

  factory WebCollection.fromJson(Map<String, dynamic> json) => _$WebCollectionFromJson(json);

  bool get exists {
    return id != 0;
  }

  factory WebCollection.empty() {
    return WebCollection(id: 0, name: '', description: '');
  }
}
