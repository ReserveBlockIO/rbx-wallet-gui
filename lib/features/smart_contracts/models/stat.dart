import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat.freezed.dart';

enum StatType {
  string,
  integer,
  float,
  percent,
  color,
}

// class StatType {
//   final IStatType type;

//   const StatType(this.type);

//   @override
//   String toString() {
//     switch (type) {
//       case IStatType.string:
//         return "Text";
//       case IStatType.integer:
//         return "Integer";
//       case IStatType.float:
//         return "Float";
//       case IStatType.percent:
//         return "Percent";
//       case IStatType.color:
//         return "Color";
//     }
//   }
// }

@freezed
abstract class Stat with _$Stat {
  const Stat._();

  factory Stat({
    @Default("") String label,
    @Default("") String value,
    required StatType type,
  }) = _Stat;

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
