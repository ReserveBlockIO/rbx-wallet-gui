import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

@freezed
class Collection with _$Collection {
  const Collection._();

  factory Collection({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "CollectionLive") required bool isLive,
    @JsonKey(name: "IsDefault") required bool isDefault,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

  factory Collection.empty() {
    return Collection(
      id: 0,
      name: '',
      description: '',
      isLive: false,
      isDefault: false,
    );
  }
}
