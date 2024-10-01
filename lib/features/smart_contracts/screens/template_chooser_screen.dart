import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/assets.gen.dart';
import '../../nft/data/templates.dart';
import '../components/sc_creator/common/modal_container.dart';
import '../models/smart_contract_template.dart';
import '../providers/create_smart_contract_provider.dart';

class TemplateChooserScreen extends BaseScreen {
  const TemplateChooserScreen({Key? key})
      : super(
          key: key,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Smart Contracts Templates"),
      leading: IconButton(
        onPressed: () async {
          AutoRouter.of(context).pop();
        },
        icon: const Icon(Icons.close),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final templates = getSmartContractTemplates(context, ref);

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            Assets.images.decorBottom.path,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black45,
                Colors.black87,
                // Theme.of(context).colorScheme.primary,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Choose a Smart Contract & Add Features",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: templates.asMap().entries.map(
                    (entry) {
                      return _TemplateCard(
                        template: entry.value,
                        delay: entry.key * 200,
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TemplateCard extends BaseStatefulComponent {
  final SmartContractTemplate template;
  final int delay;
  const _TemplateCard({
    Key? key,
    required this.template,
    this.delay = 0,
  }) : super(key: key);

  @override
  BaseComponentState<_TemplateCard> createState() => _TemplateCardState();
}

class _TemplateCardState extends BaseComponentState<_TemplateCard> {
  bool isHovering = false;

  late final Timer timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.delay)).then((value) {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        setState(() => _index++);
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _provider = ref.read(createSmartContractProvider.notifier);

    void _handleCreate() {
      _provider.clearSmartContract();
      widget.template.init();
      AutoRouter.of(context).push(const SmartContractCreatorContainerScreenRoute());
    }

    return InkWell(
      onTap: _handleCreate,
      onHover: (val) {
        setState(() {
          isHovering = val;
        });
      },
      child: SizedBox(
        width: 350,
        height: 500,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            // border: Border.all(color: Colors.white10, width: 3),
            // color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary.withOpacity(isHovering ? .75 : 0.25),
                spreadRadius: 4,
                blurRadius: 10,
              ),
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary.withOpacity(isHovering ? .75 : 0.25),
                spreadRadius: -4,
                blurRadius: 5,
              )
            ],
          ),
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.black87,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 350,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            child: Image.asset(
                              widget.template.images[_index % widget.template.images.length],
                              width: 350,
                              height: 200,
                              fit: BoxFit.cover,
                              key: UniqueKey(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                              width: 2,
                            ),
                          ),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.template.name,
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                // fontFamily: "RobotoMono",
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.template.description,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 18, color: Colors.white, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                          onPressed: _handleCreate,
                          child: const Text("Create"),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (widget.template.learnMoreContent != null)
                        AppButton(
                          label: "Learn More",
                          icon: Icons.help,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return ModalContainer(
                                    withClose: true,
                                    children: [
                                      widget.template.learnMoreContent!,
                                    ],
                                  );
                                });
                          },
                          type: AppButtonType.Text,
                          variant: AppColorVariant.Light,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
