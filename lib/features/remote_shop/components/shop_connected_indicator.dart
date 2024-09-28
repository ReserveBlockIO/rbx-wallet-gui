import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';

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
