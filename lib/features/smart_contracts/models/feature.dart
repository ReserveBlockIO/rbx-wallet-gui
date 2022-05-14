import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';

part 'feature.freezed.dart';
part 'feature.g.dart';

enum FeatureType {
  royalty,
  evolution,
  ticket,
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

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);

  String get nameLabel {
    return typeToName(type);
  }

  String get genericDescription {
    if (!isAvailable) {
      return "Activating soon...";
    }

    return "Lorem ipsim";
  }

  IconData get icon {
    return typeToIcon(type);
  }

  bool get isAvailable {
    switch (type) {
      case FeatureType.royalty:
      case FeatureType.evolution:
      case FeatureType.ticket:
        return true;
      default:
        return false;
    }
  }

  static List<FeatureType> allTypes() {
    return [
      FeatureType.royalty,
      FeatureType.evolution,
      FeatureType.ticket,
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

  String get description {
    switch (type) {
      case FeatureType.royalty:
        final royalty = Royalty.fromJson(data);
        return "${royalty.typeLabel} ${royalty.amountWithSuffix} [${royalty.address}]";
      case FeatureType.evolution:
        final evolve = Evolve.fromJson(data);
        return "${evolve.typeLabel} (${evolve.phases.length} phase${evolve.phases.length == 1 ? '' : 's'})";
      case FeatureType.ticket:
        final ticket = Ticket.fromJson(data);
        return "${ticket.typeLabel}: ${ticket.eventName} (${ticket.dateTimeLabel})";
      default:
        return "Not implemented";
    }
  }

  static String typeToName(FeatureType type) {
    switch (type) {
      case FeatureType.royalty:
        return "Royalty";
      case FeatureType.evolution:
        return "Evolving";
      case FeatureType.ticket:
        return "Ticketing";
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

  static IconData typeToIcon(FeatureType type) {
    return Icons.star;
  }
}
