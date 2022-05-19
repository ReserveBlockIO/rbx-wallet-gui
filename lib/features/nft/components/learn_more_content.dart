import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';

class LearnMoreStep {
  final String title;
  final String description;

  const LearnMoreStep({
    required this.description,
    required this.title,
  });
}

class LearnMoreContent extends BaseComponent {
  final List<LearnMoreStep> steps;
  final Function() onCreate;
  const LearnMoreContent({
    Key? key,
    required this.steps,
    required this.onCreate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 32,
            children: steps.asMap().entries.map((entry) {
              final step = entry.value;
              return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white30, width: 2),
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "${entry.key + 1}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                step.title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.4),
                            thickness: 2,
                          ),
                        ),
                        Text(
                          step.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, height: 1.3),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                label: "Cancel",
                onPressed: () {
                  Navigator.of(context).pop();
                },
                variant: AppColorVariant.Light,
                type: AppButtonType.Text,
                icon: Icons.cancel,
              ),
              SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    ref
                        .read(createSmartContractProvider.notifier)
                        .clearSmartContract();
                    onCreate();

                    AutoRouter.of(context)
                        .push(SmartContractCreatorContainerScreenRoute());
                  },
                  child: Text("Create"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
