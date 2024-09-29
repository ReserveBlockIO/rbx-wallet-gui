import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../smart_contracts/providers/create_smart_contract_provider.dart';

class LearnMoreStep {
  final String title;
  final String description;
  final String? imagePath;

  const LearnMoreStep({
    required this.description,
    required this.title,
    this.imagePath,
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
          const SizedBox(
            height: 12,
          ),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 32,
            children: steps.asMap().entries.map((entry) {
              final step = entry.value;
              return ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400, minHeight: 370),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white30, width: 2),
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.secondary.withOpacity(.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
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
                                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                              color: Theme.of(context).colorScheme.primary,
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
                                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.secondary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                                thickness: 2,
                              ),
                            ),
                            Text(
                              step.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18, height: 1.3),
                            ),
                          ],
                        ),
                        if (step.imagePath != null && step.imagePath!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white10,
                                  width: 2,
                                ),
                              ),
                              child: Image.asset(
                                step.imagePath!,
                                width: double.infinity,
                                height: 140,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
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
                    foregroundColor: Colors.black, backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    ref.read(createSmartContractProvider.notifier).clearSmartContract();
                    onCreate();

                    AutoRouter.of(context).push(const SmartContractCreatorContainerScreenRoute());
                  },
                  child: const Text("Create"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
