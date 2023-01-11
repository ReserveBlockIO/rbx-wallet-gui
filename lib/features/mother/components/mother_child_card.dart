import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/mother/models/mother_child.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MotherChildCard extends StatelessWidget {
  final MotherChild child;

  const MotherChildCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              child.validatorName,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
            ),
            Divider(),
            Card(
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Row(
                      label: "Balance",
                      value: "${child.balance} RBX",
                    ),
                    Divider(),
                    _Row(
                      label: "IP Address",
                      value: child.ipAddress,
                    ),
                    Divider(),
                    _Row(
                      label: "Block Height",
                      value: "${child.blockHeight}",
                    ),
                    Divider(),
                    _Row(
                      label: "Is Validating?",
                      value: child.isValidating ? 'Yes' : 'No',
                      color: child.isValidating ? AppColorVariant.Success : AppColorVariant.Danger,
                    ),
                    Divider(),
                    _Row(
                      label: "Is Connected to Mother?",
                      value: child.activeWithMother ? 'Yes' : 'No',
                      color: child.activeWithMother ? AppColorVariant.Success : AppColorVariant.Danger,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  label: "Open in Explorer",
                  onPressed: () {
                    launchUrlString("${Env.baseExplorerUrl}/validators/${child.address}");
                  },
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(),
                  Text(
                    child.address,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final AppColorVariant color;
  const _Row({
    Key? key,
    required this.label,
    required this.value,
    this.color = AppColorVariant.Primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        AppBadge(
          label: value,
          variant: color,
        )
      ],
    );
  }
}
