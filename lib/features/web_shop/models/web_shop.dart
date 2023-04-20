import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';

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
    @JsonKey(name: 'is_offline') required bool isOffline,
  }) = _WebShop;

  factory WebShop.fromJson(Map<String, dynamic> json) => _$WebShopFromJson(json);

  factory WebShop.empty() => WebShop(
        id: 0,
        uid: '',
        name: '',
        description: '',
        ownerAddress: '',
        url: '',
        isOffline: true,
      );

  bool get isNew {
    return id == 0;
  }

  bool isOwner(WidgetRef ref) {
    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.public : ref.read(sessionProvider).currentWallet?.address;
    if (address == null) {
      return false;
    }

    return address == ownerAddress;
  }
}
