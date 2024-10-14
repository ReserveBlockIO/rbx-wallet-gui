import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'tokenize.dart';
import '../../token/models/token_sc_feature.dart';

import '../features/evolve/evolve.dart';
import '../features/royalty/royalty.dart';
import '../features/soul_bound/soul_bound.dart';
import '../features/ticket/ticket.dart';
import 'fractional.dart';
import 'multi_asset.dart';
import 'pair.dart';
import 'tokenization.dart';

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
  soulBound,
  wrap,
  token,
  btcTokenization,
  notImplemented,
}

@freezed
abstract class Feature with _$Feature {
  const Feature._();

  factory Feature({
    @Default(FeatureType.royalty) FeatureType type,
    @Default({}) Map<String, dynamic> data,
  }) = _Feature;

  factory Feature.fromJson(Map<String, dynamic> json) => _$FeatureFromJson(json);

  factory Feature.fromCompiler(Map<String, dynamic> f) {
    switch (f['FeatureName']) {
      case Evolve.compilerEnum:
        final payload = {'phases': f['FeatureFeatures']};
        final data = Feature(
          type: FeatureType.evolution,
          data: Evolve.fromCompiler(payload).toJson(),
        );
        return data;
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

      case TokenScFeature.compilerEnum:
        return Feature(
          type: FeatureType.token,
          data: TokenScFeature.fromJson(f['FeatureFeatures']).toJson(),
        );
      case Tokenize.compilerEnum:
        return Feature(
          type: FeatureType.token,
          data: Tokenize.fromJson(f['FeatureFeatures']).toJson(),
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
        case FeatureType.tokenization:
          return "Pair this smart contract with a physical/digital good";
        case FeatureType.fractionalization:
          return "Share ownership between multiple wallets and support voting";
        case FeatureType.pair:
          return "Pair/Wrap this smart contract with an existing NFT on or off this network";
        case FeatureType.soulBound:
          return "Create a non-transferrable smart contract bound to a perminent address";
        case FeatureType.btcTokenization:
          return "Tokenize BTC within a smart contract";
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
        // case FeatureType.btcTokenization:
        // case FeatureType.tokenization:
        // case FeatureType.pair:
        // case FeatureType.fractionalization:
        // case FeatureType.soulBound:
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
      // FeatureType.tokenization,
      // FeatureType.fractionalization,
      // FeatureType.btcTokenization,
      // FeatureType.pair,
      // FeatureType.soulBound,
      // FeatureType.ticket,
      // FeatureType.music,
      // FeatureType.additionalOwners,
      // FeatureType.selfDestructive,
      // FeatureType.consumable,
      // FeatureType.wrap,
    ];
  }

  bool get canEdit {
    if (type == FeatureType.btcTokenization) {
      return false;
    }
    return true;
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
      case FeatureType.tokenization:
        final tokenization = Tokenization.fromJson(data);
        String label = tokenization.name;
        if (tokenization.properties.isNotEmpty) {
          if (tokenization.properties.length == 1) {
            label = "$label (1 property)";
          } else {
            label = "$label (${tokenization.properties.length} properties)";
          }
        }
        return label;
      case FeatureType.fractionalization:
        final fractional = Fractional.fromJson(data);
        return "${fractional.fractionalInterest}% | Creator Retains: ${fractional.creatorRetains}%";
      case FeatureType.pair:
        final pair = Pair.fromJson(data);
        return "${pair.network} [${pair.nftAddress}]";
      case FeatureType.soulBound:
        final sb = SoulBound.fromJson(data);
        return "${sb.ownerAddress} ${sb.beneficiaryAddress != null && sb.beneficiaryAddress!.isNotEmpty ? '(Beneficiary: ${sb.beneficiaryAddress})' : ''}";

      case FeatureType.token:
        if (data.containsKey("AssetTicker") && data.containsKey('AssetName')) {
          return "${data['AssetName']} [${data['AssetTicker']}]";
        }
        return "Token";
      case FeatureType.btcTokenization:
        return "BTC Tokenization";
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
        return "Mint a physical or Real World Asset";
      case FeatureType.soulBound:
        return "Soul Bound";
      case FeatureType.wrap:
        return "Wrap";
      case FeatureType.token:
        return "Token";
      case FeatureType.btcTokenization:
        return "BTC Tokenization";
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
      case FeatureType.soulBound:
        return FontAwesomeIcons.person;
      case FeatureType.btcTokenization:
        return FontAwesomeIcons.bitcoin;

      default:
        return Icons.star;
    }
  }
}
