import 'package:freezed_annotation/freezed_annotation.dart';

part 'sc_property.freezed.dart';
part 'sc_property.g.dart';

enum ScPropertyType {
  text,
  number,
  color,
  url,
}

@freezed
class ScProperty with _$ScProperty {
  const ScProperty._();

  const factory ScProperty({
    @Default("") String name,
    @Default("") String value,
    @Default(ScPropertyType.text) ScPropertyType type,
  }) = _ScProperty;

  factory ScProperty.fromJson(Map<String, dynamic> json) => _$ScPropertyFromJson(json);

  factory ScProperty.empty() => ScProperty();

  String get typeLabel {
    switch (type) {
      case ScPropertyType.text:
        return "Text";
      case ScPropertyType.number:
        return "Number";
      case ScPropertyType.color:
        return "Color";
      case ScPropertyType.url:
        return "URL";
    }
  }
}
