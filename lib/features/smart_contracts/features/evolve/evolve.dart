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

  factory Evolve.fromCompiler(dynamic data) {
    final phases = data['phases'];

    final List<EvolvePhase> _phases = [];
    for (final p in phases!) {
      print(p);
      print("********");
      _phases.add(
        //TODO parse date time
        EvolvePhase(
          name: p['Name'] ?? p['name'],
          description: p['Description'] ?? p['description'],
          dateTime: p['DateTime'] ?? p['dateTime'],
          evolutionState: p['EvolutionState'] ?? p['evolutionState'],
          isCurrentState: p['IsCurrentState'] ?? p['isCurrentState'],
          asset:
              p['SmartContractAsset'] != null || p['smartContractAsset'] != null
                  ? Asset.fromJson(
                      p['SmartContractAsset'] ?? ['smartContractAsset'])
                  : null,
        ),
      );
    }

    return Evolve(
      type: _phases.first.dateTime == null
          ? EvolveType.variable
          : EvolveType.time,
      isDynamic: phases[0]['IsDynamic'] ?? phases[0]['isDynamic'] ?? false,
      phases: _phases,
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
        'SmartContractAsset': p.asset != null ? p.asset!.toJson() : null,
        'EvolveDate': p.dateTimeForCompiler
      };

      return data;
    }).toList();

    return items;
  }

  factory Evolve.fromJson(Map<String, dynamic> json) => _$EvolveFromJson(json);
}
