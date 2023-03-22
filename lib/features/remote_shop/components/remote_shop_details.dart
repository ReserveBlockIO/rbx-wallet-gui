import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';

class RemoteShopDetails extends BaseComponent {
  final DecShop shop;
  const RemoteShopDetails(this.shop, {super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(child: Text(shop.name));
  }
}
