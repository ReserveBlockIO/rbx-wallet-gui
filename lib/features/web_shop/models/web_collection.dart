import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';

part 'web_collection.freezed.dart';
part 'web_collection.g.dart';

@freezed
class WebCollection with _$WebCollection {
  const WebCollection._();

  factory WebCollection({
    required int id,
    required WebShop shop,
    required String name,
    required String description,
  }) = _WebCollection;

  factory WebCollection.fromJson(Map<String, dynamic> json) => _$WebCollectionFromJson(json);
}
