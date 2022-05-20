import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat.freezed.dart';
part 'stat.g.dart';

enum StatType {
  string,
  integer,
  float,
  percent,
  color,
}

@freezed
abstract class Stat with _$Stat {
  const Stat._();

  const factory Stat({
    @Default("") String label,
    @Default("") String value,
    @Default("") String description,
    @Default(StatType.string) StatType type,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  String get typeLabel {
    return typeToString(type);
  }

  static List<StatType> allTypes() {
    return [
      StatType.string,
      StatType.integer,
      StatType.float,
      StatType.percent,
      StatType.color,
    ];
  }

  static typeToString(StatType type) {
    switch (type) {
      case StatType.string:
        return "Text";
      case StatType.integer:
        return "Integer";
      case StatType.float:
        return "Float";
      case StatType.percent:
        return "Percent";
      case StatType.color:
        return "Color";
    }
  }
}
