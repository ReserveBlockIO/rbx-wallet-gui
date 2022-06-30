import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';

class ReloadButton extends BaseStatefulComponent {
  const ReloadButton({Key? key}) : super(key: key);

  @override
  ReloadButtonState createState() => ReloadButtonState();
}

class ReloadButtonState extends BaseComponentState<ReloadButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox(
        width: 32,
        height: 32,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return IconButton(
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });
          ref.read(walletInfoProvider.notifier).fetch();
          await Future.delayed(const Duration(milliseconds: 300));
          setState(() {
            _isLoading = false;
          });
        },
        icon: const Icon(Icons.refresh));
  }
}
