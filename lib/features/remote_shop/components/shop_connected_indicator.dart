import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/connected_shop_provider.dart';

class ShopConnectedIndicator extends BaseComponent {
  final String shopUrl;
  const ShopConnectedIndicator({
    super.key,
    required this.shopUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.shrink();

    // if (shopUrl != ref.watch(connectedShopProvider).url) {
    //   return SizedBox();
    // }

    // final isConnected = ref.watch(connectedShopProvider).isConnected;

    // return AppBadge(
    //   variant: isConnected ? AppColorVariant.Success : AppColorVariant.Danger,
    //   label: isConnected ? "Connected" : "Disconnected",
    // );
  }
}
