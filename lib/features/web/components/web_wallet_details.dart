import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';

import '../../../core/base_component.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../utils/toast.dart';
import '../../auth/auth_utils.dart';

class WebWalletDetails extends BaseComponent {
  const WebWalletDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionModel = ref.watch(webSessionProvider);
    final keypair = sessionModel.keypair;
    if (keypair == null) {
      return Container();
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF050505),
        boxShadow: glowingBox,
      ),
      child: ListTile(
        title: SelectableText(
          sessionModel.adnr != null && sessionModel.adnr!.isNotEmpty ? "${sessionModel.adnr} [${keypair.address}]" : keypair.address,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13),
        ),
        subtitle: sessionModel.balance != null
            ? Text(
                "${sessionModel.balance} RBX",
                style: Theme.of(context).textTheme.caption,
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: keypair.address));
                  Toast.message("Address ${keypair.address} copied to clipboard");
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.copy,
                    size: 20,
                  ),
                )),
            InkWell(
                onTap: () async {
                  final confirmed = await ConfirmDialog.show(
                    title: "Reveal Private Key?",
                    body: "Are you sure you want to reveal your private key?",
                    confirmText: "Reveal",
                    cancelText: "Cancel",
                  );
                  if (confirmed == true) {
                    showKeys(context, keypair, true);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
