import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/utils/toast.dart';

class WebRaModeSwitcher extends BaseComponent {
  const WebRaModeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(webSessionProvider);
    final primaryAddress = session.currentWallet?.address;
    final raAddress = session.raKeypair?.address;
    final usingRa = session.usingRa;

    if (primaryAddress == null || raAddress == null) {
      return SizedBox();
    }
    final color = usingRa ? Colors.deepPurple.shade200 : Colors.white;
    final selectedAddress = usingRa ? raAddress : primaryAddress;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () async {
            await Clipboard.setData(
              ClipboardData(text: selectedAddress),
            );
            Toast.message("$selectedAddress copied to clipboard");
          },
          child: Icon(
            Icons.copy,
            size: 12,
            color: color,
          ),
        ),
        SizedBox(width: 4),
        PopupMenuButton(
          constraints: const BoxConstraints(
            minWidth: 2.0 * 56.0,
            maxWidth: 8.0 * 56.0,
          ),
          color: Color(0xFF080808),
          child: Row(
            children: [
              Text(
                selectedAddress,
                style: TextStyle(color: color),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 18,
                color: Colors.white,
              ),
            ],
          ),
          itemBuilder: (context) {
            final list = <PopupMenuEntry<int>>[];

            list.add(PopupMenuItem(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    !usingRa ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                  ),
                  SizedBox(width: 6),
                  Text(primaryAddress),
                ],
              ),
              onTap: () {
                ref.read(webSessionProvider.notifier).setUsingRa(false);
              },
            ));

            list.add(PopupMenuItem(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    usingRa ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                    color: Colors.deepPurple.shade200,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      raAddress,
                      style: TextStyle(color: Colors.deepPurple.shade200),
                    ),
                  ),
                  SizedBox(width: 6),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(WebReserveAccountOverviewScreenRoute());
                    },
                    child: Icon(
                      Icons.help,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 14,
                    ),
                  )
                ],
              ),
              onTap: () {
                ref.read(webSessionProvider.notifier).setUsingRa(true);
              },
            ));

            return list;
          },
        ),
        SizedBox(width: 4),
      ],
    );
  }
}
