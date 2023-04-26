import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';

class ShopConnectedIndicator extends BaseComponent {
  final String shopUrl;
  const ShopConnectedIndicator({
    super.key,
    required this.shopUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (shopUrl != ref.watch(connectedShopProvider).url) {
      return SizedBox();
    }

    final isConnected = ref.watch(connectedShopProvider).isConnected;

    return AppBadge(
      variant: isConnected ? AppColorVariant.Success : AppColorVariant.Danger,
      label: isConnected ? "Connected" : "Disconnected",
    );
  }
}
