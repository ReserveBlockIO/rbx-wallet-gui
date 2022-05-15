import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';

part 'evolve.freezed.dart';
part 'evolve.g.dart';

enum EvolveType { time, variable }

@freezed
abstract class Evolve with _$Evolve {
  static const int compilerEnum = 0;

  const Evolve._();

  @JsonSerializable(explicitToJson: true)
  const factory Evolve({
    @Default("") String id,
    @Default(EvolveType.time) EvolveType type,
    @Default("") String url,
    @Default([]) List<EvolvePhase> phases,
    @Default(false) bool isDynamic,
    Asset? asset,
  }) = _Evolve;

  String get typeLabel {
    return typeToString(type);
  }

  static List<EvolveType> allTypes() {
    return [
      EvolveType.time,
      EvolveType.variable,
    ];
  }

  static String typeToString(EvolveType type) {
    switch (type) {
      case EvolveType.time:
        return "Time";
      case EvolveType.variable:
        return "Variable";
    }
  }

  static EvolveType intToType(int val) {
    switch (val) {
      case 0:
        return EvolveType.time;
      case 1:
      default:
        return EvolveType.variable;
    }
  }

  static int typeToInt(EvolveType type) {
    switch (type) {
      case EvolveType.time:
        return 0;
      case EvolveType.variable:
        return 1;
    }
  }

  factory Evolve.fromCompiler(dynamic json) {
    return Evolve(
      type: intToType(json['EvolveParamaterType']),
    );
  }

  List<Map<String, dynamic>> serializeForCompiler() {
    final List<Map<String, dynamic>> items =
        phases.asMap().entries.map((entry) {
      final p = entry.value;

      final Map<String, dynamic> data = {
        'Name': p.name,
        'Description': p.description,
        'IsDynamic': isDynamic,
        'EvolutionState': entry.key + 1,
        'IsCurrentState': false,
        // 'EvolveParamaterType': typeToInt(type),
        // 'EvolveParamater':
        //     type == EvolveType.time ? p.dateTime.toString() : p.expectedValue,
        'SmartContractAsset': null,
        'EvolveDate': p.dateTimeForCompiler
      };
      return data;
    }).toList();

    return items;
  }

  factory Evolve.fromJson(Map<String, dynamic> json) => _$EvolveFromJson(json);
}
