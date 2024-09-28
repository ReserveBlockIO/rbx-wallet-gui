import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';
import '../models/mother_child.dart';

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
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
            const Divider(),
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
                      value: "${child.balance} VFX",
                    ),
                    const Divider(),
                    _Row(
                      label: "IP Address",
                      value: child.ipAddress,
                    ),
                    const Divider(),
                    _Row(
                      label: "Block Height",
                      value: "${child.blockHeight}",
                    ),
                    const Divider(),
                    _Row(
                      label: "Is Validating?",
                      value: child.activeWithValidating ? 'Yes' : 'No',
                      color: child.activeWithValidating
                          ? AppColorVariant.Success
                          : AppColorVariant.Danger,
                    ),
                    const Divider(),
                    _Row(
                      label: "Is Connected to Mother?",
                      value: child.activeWithMother ? 'Yes' : 'No',
                      color: child.activeWithMother
                          ? AppColorVariant.Success
                          : AppColorVariant.Danger,
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
                    launchUrlString(
                        "${Env.baseExplorerUrl}/validators/${child.address}");
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
                  const Divider(),
                  Text(
                    child.address,
                    style: Theme.of(context).textTheme.bodySmall,
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
