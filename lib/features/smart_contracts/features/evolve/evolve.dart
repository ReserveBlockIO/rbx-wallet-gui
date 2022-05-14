import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';

part 'evolve.freezed.dart';
part 'evolve.g.dart';

enum EvolveType { time, numericVariable, stringVariable }

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
  }) = _Evolve;

  String get typeLabel {
    return typeToString(type);
  }

  static List<EvolveType> allTypes() {
    return [
      EvolveType.time,
      EvolveType.numericVariable,
      EvolveType.stringVariable,
    ];
  }

  static String typeToString(EvolveType type) {
    switch (type) {
      case EvolveType.time:
        return "Time";
      case EvolveType.numericVariable:
        return "Numberic Variable";
      case EvolveType.stringVariable:
        return "String Variable";
    }
  }

  static EvolveType intToType(int val) {
    switch (val) {
      case 0:
        return EvolveType.time;
      case 1:
        return EvolveType.stringVariable;
      case 2:
      default:
        return EvolveType.numericVariable;
    }
  }

  static int typeToInt(EvolveType type) {
    switch (type) {
      case EvolveType.time:
        return 0;
      case EvolveType.stringVariable:
        return 1;
      case EvolveType.numericVariable:
        return 2;
    }
  }

  factory Evolve.fromCompiler(dynamic json) {
    try {
      return Evolve(
        type: intToType(json['EvolveParamaterType']),
      );
    } catch (e) {
      print(e);
      //TODO: Fix this when aaron is ready
      return Evolve(type: EvolveType.numericVariable, phases: [
        EvolvePhase(
          expectedValue: '10',
          name: "Test Phase",
          description: "Test 123",
        )
      ]);
    }
  }

  List<Map<String, dynamic>> serializeForCompiler() {
    final List<Map<String, dynamic>> items = phases.map((p) {
      final Map<String, dynamic> data = {
        'EvolutionState': 0, //TODO: do we need to set this?
        'EvolveParamaterType': typeToInt(type),
        'EvolveParamater':
            type == EvolveType.time ? p.dateTime.toString() : p.expectedValue,
        //TODO: asset
      };
      return data;
    }).toList();

    return items;
  }

  factory Evolve.fromJson(Map<String, dynamic> json) => _$EvolveFromJson(json);
}
