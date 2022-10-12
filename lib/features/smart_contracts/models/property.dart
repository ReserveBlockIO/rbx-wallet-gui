import 'package:freezed_annotation/freezed_annotation.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
class Property with _$Property {
  const Property._();

  @JsonSerializable(explicitToJson: true)
  const factory Property({
    @Default("") String label,
    @Default("") String value,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);
}
