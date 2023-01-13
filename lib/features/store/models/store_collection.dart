import 'package:freezed_annotation/freezed_annotation.dart';

import 'listing.dart';

part 'store_collection.freezed.dart';
part 'store_collection.g.dart';

@freezed
abstract class StoreCollection with _$StoreCollection {
  const StoreCollection._();

  factory StoreCollection({
    required int id,
    required String uuid,
    required String slug,
    required String name,
    required String description,
    @JsonKey(name: "logo_url") String? logoUrl,
    @JsonKey(defaultValue: []) required List<Listing> listings,
  }) = _StoreCollection;

  factory StoreCollection.fromJson(Map<String, dynamic> json) => _$StoreCollectionFromJson(json);
}
