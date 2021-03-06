import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/models/multi_asset.dart';

part 'feature.freezed.dart';
part 'feature.g.dart';

enum FeatureType {
  royalty,
  evolution,
  multiAsset,
  ticket,
  tokenization,
  music,
  additionalOwners,
  selfDestructive,
  consumable,
  fractionalization,
  pair,
  wrap,
  notImplemented,
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

  factory Feature.fromCompiler(Map<String, dynamic> f) {
    switch (f['FeatureName']) {
      case Evolve.compilerEnum:
        final payload = {'phases': f['FeatureFeatures']};
        return Feature(
          type: FeatureType.evolution,
          data: Evolve.fromCompiler(payload).toJson(),
        );
      case Royalty.compilerEnum:
        return Feature(
          type: FeatureType.royalty,
          data: Royalty.fromCompiler(f['FeatureFeatures']).toJson(),
        );
      case MultiAsset.compilerEnum:
        return Feature(
          type: FeatureType.multiAsset,
          data: MultiAsset.fromCompiler(f['FeatureFeatures']).toJson(),
        );
      default:
        return Feature(type: FeatureType.notImplemented, data: {});
    }
  }

  String get nameLabel {
    return typeToName(type);
  }

  String get genericDescription {
    if (isAvailable) {
      switch (type) {
        case FeatureType.royalty:
          return "Include a royalty that is enforced on-chain upon any trade";
        case FeatureType.evolution:
          return "Allow the smart contract to evolve based on time or network variables";
        case FeatureType.multiAsset:
          return "Allow multiple assets to be compiled into the smart contract";
        default:
          break;
      }
    }
    return "Activating soon...";
  }

  IconData get icon {
    return typeToIcon(type);
  }

  bool get isAvailable {
    switch (type) {
      case FeatureType.royalty:
      case FeatureType.evolution:
      case FeatureType.multiAsset:
        // case FeatureType.ticket:
        return true;
      default:
        return false;
    }
  }

  static List<FeatureType> allTypes() {
    return [
      FeatureType.royalty,
      FeatureType.evolution,
      FeatureType.multiAsset,
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
        return "${evolve.phases.length + 1} phase${evolve.phases.length + 1 == 1 ? '' : 's'}";
      case FeatureType.ticket:
        final ticket = Ticket.fromJson(data);
        return "${ticket.typeLabel}: ${ticket.eventName} (${ticket.dateTimeLabel})";
      case FeatureType.multiAsset:
        final multiAsset = MultiAsset.fromJson(data);
        return "${multiAsset.assets.length} asset${multiAsset.assets.length == 1 ? '' : 's'}";

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
      case FeatureType.multiAsset:
        return "Multi Asset";
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
        return "Pair with Existing NFT";
      case FeatureType.wrap:
        return "Wrap with Off-Platform NFT";
      case FeatureType.notImplemented:
        return "Not implemented";
    }
  }

  static IconData typeToIcon(FeatureType type) {
    switch (type) {
      case FeatureType.royalty:
        return FontAwesomeIcons.moneyBill;
      case FeatureType.evolution:
        return FontAwesomeIcons.circleHalfStroke;
      case FeatureType.multiAsset:
        return FontAwesomeIcons.rectangleList;
      case FeatureType.ticket:
        return FontAwesomeIcons.ticketSimple;
      case FeatureType.tokenization:
        return FontAwesomeIcons.trophy;
      case FeatureType.music:
        return FontAwesomeIcons.music;
      case FeatureType.additionalOwners:
        return FontAwesomeIcons.users;
      case FeatureType.selfDestructive:
        return FontAwesomeIcons.fire;
      case FeatureType.consumable:
        return FontAwesomeIcons.boxOpen;
      case FeatureType.fractionalization:
        return FontAwesomeIcons.divide;
      case FeatureType.pair:
        return FontAwesomeIcons.leftRight;
      case FeatureType.wrap:
        return FontAwesomeIcons.gift;

      default:
        return Icons.star;
    }
  }
}
