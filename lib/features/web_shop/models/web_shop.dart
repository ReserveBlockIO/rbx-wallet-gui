import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';

part 'web_shop.freezed.dart';
part 'web_shop.g.dart';

@freezed
class WebShop with _$WebShop {
  const WebShop._();

  factory WebShop({
    required int id,
    required String name,
    required String description,
    required String url,
    @JsonKey(name: 'unique_id') required String uid,
    @JsonKey(name: 'owner_address') required String ownerAddress,
    @JsonKey(name: 'is_online') required bool isOnline,
    @JsonKey(name: 'is_published') required bool isPublished,
    @JsonKey(name: 'is_third_party') @Default(false) bool isThirdParty,
  }) = _WebShop;

  factory WebShop.fromJson(Map<String, dynamic> json) => _$WebShopFromJson(json);

  factory WebShop.empty() => WebShop(
        id: 0,
        uid: '',
        name: '',
        description: '',
        ownerAddress: '',
        url: '',
        isOnline: false,
        isPublished: false,
      );

  bool get isNew {
    return id == 0;
  }

  bool isOwner(WidgetRef ref) {
    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;
    if (address == null) {
      return false;
    }

    return address == ownerAddress;
  }

  Map<String, dynamic> get txPayload {
    return {
      "Id": 1,
      "UniqueId": uid,
      "Name": name,
      "DecShopURL": url,
      "ThirdPartyBaseURL": Env.shopBaseUrl,
      "ThirdPartyAPIURL": Env.shopApiUrl,
      "Description": description,
      "OwnerAddress": ownerAddress,
      "HostingType": 2,
      "IP": "NA",
      "Port": 0,
      "STUNServerGroup": 0,
      "OriginalBlockHeight": 0,
      "OriginalTXHash": null,
      "LatestBlockHeight": 0,
      "LatestTXHash": null,
      "UpdateTimestamp": 0,
      "AutoUpdateNetworkDNS": true,
      "NeedsPublishToNetwork": true,
      "IsOffline": false,
      "IsPublished": true,
      "CollectionCount": 0,
      "ListingCount": 0,
      "AuctionCount": 0,
      "IsIPDifferent": false
    };
  }
}
