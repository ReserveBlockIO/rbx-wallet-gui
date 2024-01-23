import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/dialogs.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../utils/toast.dart';
import '../../../bridge/services/bridge_service.dart';

class ShowDebugDataButton extends BaseComponent {
  final bool forBtc;

  const ShowDebugDataButton({
    Key? key,
    this.forBtc = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cliStarted = ref.watch(sessionProvider).cliStarted;

    return AppButton(
      label: "Show Debug Data",
      icon: Icons.analytics_outlined,
      variant: forBtc ? AppColorVariant.Btc : AppColorVariant.Primary,
      onPressed: !cliStarted
          ? null
          : () async {
              final data = await BridgeService().getDebugInfo();
              InfoDialog.show(
                title: "Debug Data",
                content: Container(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppButton(
                            label: "Copy",
                            icon: Icons.copy,
                            variant: AppColorVariant.Success,
                            onPressed: () async {
                              await Clipboard.setData(ClipboardData(text: data));
                              Toast.message("Debug data copied to clipboard");
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SelectableText(
                            data,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: "Courier",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
    );
  }
}
