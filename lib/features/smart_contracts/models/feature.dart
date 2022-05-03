import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature.freezed.dart';

enum FeatureType {
  royalty,
  evolution,
  tokenization,
  music,
  additionalOwners,
  selfDestructive,
  consumable,
  fractionalization,
  pair,
  wrap,
}

@freezed
abstract class Feature with _$Feature {
  const Feature._();

  factory Feature({
    @Default(FeatureType.royalty) FeatureType type,
    @Default({}) Map<String, dynamic> data,
  }) = _Feature;

  String get nameLabel {
    return typeToName(type);
  }

  String get descriptionLabel {
    return typeToDescription(type);
  }

  IconData get icon {
    return typeToIcon(type);
  }

  static List<FeatureType> allTypes() {
    return [
      FeatureType.royalty,
      FeatureType.evolution,
      FeatureType.tokenization,
      FeatureType.music,
      FeatureType.additionalOwners,
      FeatureType.selfDestructive,
      FeatureType.consumable,
      FeatureType.fractionalization,
      FeatureType.pair,
      FeatureType.wrap,
    ];
  }

  static String typeToName(FeatureType type) {
    switch (type) {
      case FeatureType.royalty:
        return "Royalty";
      case FeatureType.evolution:
        return "Evolving";
      case FeatureType.tokenization:
        return "Tokenization of Physical/Digital Good";
      case FeatureType.music:
        return "Music Release";
      case FeatureType.additionalOwners:
        return "Additional Owners";
      case FeatureType.selfDestructive:
        return "Self Destructive";
      case FeatureType.consumable:
        return "Consumable";
      case FeatureType.fractionalization:
        return "Fractionalization";
      case FeatureType.pair:
        return "Pair with Existing RBX NFT";
      case FeatureType.wrap:
        return "Wrap with Off-Platform NFT";
    }
  }

  static String typeToDescription(FeatureType type) {
    return "Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus.";
  }

  static IconData typeToIcon(FeatureType type) {
    return Icons.star;
  }
}
