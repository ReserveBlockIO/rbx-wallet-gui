import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_creator_container_screen.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

class SmartContractsScreen extends BaseScreen {
  const SmartContractsScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Smart Contracts"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _BigButton(
              title: "Use Template",
              iconData: FontAwesomeIcons.magic,
              body:
                  "Donec sollicitudin molestie malesuada. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada.",
              onPressed: () {},
            ),
            _BigButton(
              title: "Create Custom",
              iconData: Icons.create,
              body:
                  "Donec sollicitudin molestie malesuada. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada.",
              onPressed: () {
                AutoRouter.of(context)
                    .push(SmartContractCreatorContainerScreenRoute());
              },
            ),
            _BigButton(
              title: "Launch IDE",
              iconData: Icons.code,
              body:
                  "Donec sollicitudin molestie malesuada. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada.",
              onPressed: () {},
            ),
            _BigButton(
              title: "My Smart Contracts",
              iconData: Icons.folder,
              body:
                  "Donec sollicitudin molestie malesuada. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada.",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _BigButton extends StatelessWidget {
  final String title;
  final String body;
  final IconData iconData;
  final Function() onPressed;
  const _BigButton({
    Key? key,
    required this.title,
    required this.body,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              width: 3),
          boxShadow: [
            BoxShadow(blurRadius: 12.0, color: Colors.white12),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    size: 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Text(
                    body,
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
