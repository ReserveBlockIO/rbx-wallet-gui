import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';

part 'evolve.freezed.dart';
part 'evolve.g.dart';

enum EvolveType { time, variable }

@freezed
abstract class Evolve with _$Evolve {
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
    return [EvolveType.time, EvolveType.variable];
  }

  static typeToString(EvolveType type) {
    switch (type) {
      case EvolveType.time:
        return "Time";
      case EvolveType.variable:
        return "Variable";
    }
  }

  factory Evolve.fromJson(Map<String, dynamic> json) => _$EvolveFromJson(json);
}
