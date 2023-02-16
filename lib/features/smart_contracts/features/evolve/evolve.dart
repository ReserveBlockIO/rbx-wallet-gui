import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/utils.dart';
import 'package:rbx_wallet/features/sc_property/models/sc_property.dart';

import '../../../asset/asset.dart';
import 'evolve_phase.dart';

part 'evolve.freezed.dart';
part 'evolve.g.dart';

enum EvolveType { time, blockHeight, manualOnly }

@freezed
abstract class Evolve with _$Evolve {
  static const int compilerEnum = 0;

  const Evolve._();

  @JsonSerializable(explicitToJson: true)
  const factory Evolve({
    @Default("") String id,
    @Default(EvolveType.manualOnly) EvolveType type,
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
      EvolveType.blockHeight,
      EvolveType.manualOnly,
    ];
  }

  static String typeToString(EvolveType type) {
    switch (type) {
      case EvolveType.time:
        return "Date/Time";
      case EvolveType.blockHeight:
        return "Block Height";
      case EvolveType.manualOnly:
        return "Manual Only";
    }
  }

  // static EvolveType intToType(int val) {
  //   switch (val) {
  //     case 0:
  //       return EvolveType.time;
  //     case 1:
  //       return EvolveType.blockHeight;
  //     default:
  //       return EvolveType.variable;
  //   }
  // }

  // static int typeToInt(EvolveType type) {
  //   switch (type) {
  //     case EvolveType.time:
  //       return 0;
  //     case EvolveType.blockHeight:
  //       return 1;
  //     case EvolveType.variable:
  //       return 2;
  //   }
  // }

  static Map<String, dynamic> getPhase(dynamic data) {
    if (data.runtimeType == Map) {
      if (data.containsKey('phases')) {
        return getPhase(data['phases']);
      }
    }
    return data;
  }

  factory Evolve.fromCompiler(dynamic data) {
    List<dynamic> phases = [];
    try {
      phases = data['phases'];
    } catch (e) {
      // print(e);
      phases = [data];
    }

    List<EvolvePhase> _phases = [];
    bool isDynamic = false;
    for (final Map<String, dynamic> _p in phases) {
      // THIS SHIT IS SUPER FUCKED because of the whole "FeatureFeatures" can be a list or a map

      var p = _p.containsKey('phases') ? _p['phases'] : _p;
      p = p.containsKey('phases') ? p['phases'] : p;
      if (p.runtimeType == List<Map<String, dynamic>>) {
        p = p.first;
      }
      if (p.runtimeType == List<Map<String, dynamic>>) {
        p = p.first;
      }

      p = p as Map<String, dynamic>;

      if (p.containsKey('isDynamic') && p['isDynamic'] == true) {
        isDynamic = true;
      }

      if (p.containsKey('IsDynamic') && p['IsDynamic'] == true) {
        isDynamic = true;
      }

      Asset? asset;

      if (p.containsKey('SmartContractAsset') && p['SmartContractAsset'] != null) {
        asset = Asset.fromJson(p['SmartContractAsset']);
      } else if (p.containsKey('smartContractAsset') && p['smartContractAsset'] != null) {
        asset = Asset.fromJson(p['smartContractAsset']);
      } else if (p.containsKey('asset') && p['asset'] != null) {
        asset = Asset.fromJson(p['asset']);
      }

      String? dateTimeString = p.containsKey("DateTime") ? p['DateTime'] : p['dateTime'];
      dateTimeString ??= p['EvolveDate'];

      DateTime? dateTime;
      if (dateTimeString != null) {
        dateTime = DateTime.parse(dateTimeString);
      }

      List<ScProperty> properties = [];
      Map<String, dynamic>? props;

      if (p.containsKey('Properties') && p['Properties'] != null) {
        props = p['Properties'] as Map<String, dynamic>;
      } else if (p.containsKey('properties') && p['properties'] != null) {
        final List<Map<String, dynamic>> propsList = p['properties'];

        if (propsList.isNotEmpty) {
          props = {};
          for (final prop in propsList) {
            props[prop['name']] = prop['value'];
          }
        }
      }

      if (props != null) {
        for (final kv in props.entries) {
          final key = kv.key;
          final String value = kv.value;

          ScPropertyType type = ScPropertyType.text;

          if (isNumeric(value)) {
            type = ScPropertyType.number;
          }

          if (value.length == 7 && value.startsWith("#")) {
            type = ScPropertyType.color;
          }

          properties.add(ScProperty(name: key, value: value, type: type));
        }
      }

      final newPhase = EvolvePhase(
        name: p.containsKey("Name") ? p['Name'] : p['name'],
        description: p.containsKey("Description") ? p['Description'] ?? "" : p['description'] ?? "",
        dateTime: dateTime,
        blockHeight: p['EvolveBlockHeight'] ?? p['blockHeight'],
        evolutionState: p.containsKey("EvolutionState") ? p['EvolutionState'] : p['evolutionState'],
        isCurrentState: p.containsKey("IsCurrentState") ? p['IsCurrentState'] : p['isCurrentState'],
        asset: asset,
        properties: properties,
      );

      _phases.add(newPhase);
    }

    return Evolve(
      type: _phases.first.dateTime == null ? EvolveType.manualOnly : EvolveType.time,
      isDynamic: isDynamic,
      phases: _phases,
    );
  }

  List<Map<String, dynamic>> serializeForCompiler(String minterName, String timezoneName) {
    List<EvolvePhase> _phases = [...phases];

    if (type == EvolveType.time) {
      _phases = _phases..sort((a, b) => a.dateTime!.compareTo(b.dateTime!));
      for (final entry in _phases.asMap().entries) {
        final key = entry.key;
        final p = entry.value;
        if (p.dateTime == null) {
          final u = _phases[key].copyWith(dateTime: DateTime.now());
          final updated = [..._phases]
            ..removeAt(key)
            ..insert(key, u);
          _phases = updated;
          // _phases[key] = _phases[key].copyWith(dateTime: DateTime.now());
        }
      }
    } else if (type == EvolveType.blockHeight) {
      _phases = _phases..sort((a, b) => a.blockHeight!.compareTo(b.blockHeight!));
    }

    final List<Map<String, dynamic>> items = _phases.asMap().entries.map((entry) {
      final p = entry.value;

      bool _isDynamic = isDynamic;

      if (p.dateTime != null || p.blockHeight != null) {
        _isDynamic = true;
      }

      Map<String, String>? propertiesOutput;
      if (p.properties.isNotEmpty) {
        propertiesOutput = {};
        for (final property in p.properties) {
          propertiesOutput[property.name] = property.value;
        }
      }

      final Map<String, dynamic> data = {
        'Name': p.name,
        'Description': p.description,
        'IsDynamic': _isDynamic,
        'EvolutionState': entry.key + 1,
        'IsCurrentState': false,
        // 'EvolveParamaterType': typeToInt(type),
        // 'EvolveParamater':
        //     type == EvolveType.time ? p.dateTime.toString() : p.expectedValue,
        'SmartContractAsset': p.asset != null ? p.asset!.copyWith(authorName: minterName).toJson() : null,
        'EvolveDate': type == EvolveType.time ? p.dateTimeForCompiler(timezoneName) : null,
        'EvolveBlockHeight': type == EvolveType.blockHeight ? p.blockHeight : null,
        ...propertiesOutput != null ? {'Properties': propertiesOutput} : {}
      };

      print(jsonEncode(data));

      return data;
    }).toList();

    return items;
  }

  factory Evolve.fromJson(Map<String, dynamic> json) => _$EvolveFromJson(json);
}
