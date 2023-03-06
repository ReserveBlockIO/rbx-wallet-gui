import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
class Store with _$Store {
  const Store._();

  factory Store({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "CollectionLive") required bool isLive,
    @JsonKey(name: "IsDefault") required bool isDefault,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  factory Store.empty() {
    return Store(
      id: 0,
      name: '',
      description: '',
      isLive: false,
      isDefault: false,
    );
  }
}
