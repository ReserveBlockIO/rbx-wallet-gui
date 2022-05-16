import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract_template.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';

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
      title: Text("Smart Contracts Templates"),
      leading: IconButton(
        onPressed: () async {
          AutoRouter.of(context).pop();
        },
        icon: Icon(Icons.close),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(createSmartContractProvider.notifier);

    final templates = [
      SmartContractTemplate(
        name: "Baseline Smart Contract",
        color: Theme.of(context).colorScheme.primary,
        description:
            "Create a basic smart contract with an asset and metadata and deploy it to the network.",
        images: [
          Assets.images.templateBasic1.path,
          Assets.images.templateBasic2.path,
          Assets.images.templateBasic3.path,
        ],
        init: () {
          final smartContract = SmartContract(
            owner: ref.read(sessionProvider).currentWallet!,
            name: "My Basic NFT",
            description: "Write some good stuff here...",
          );

          _provider.setSmartContract(smartContract);
        },
      ),
      SmartContractTemplate(
        name: "Evolving Smart Contract",
        description:
            "Generate a smart contract that can evolve based on time or network controlled variables.",
        images: [
          Assets.images.templateEvolve1.path,
          Assets.images.templateEvolve2.path,
          Assets.images.templateEvolve3.path,
        ],
        color: Theme.of(context).colorScheme.primary,
        init: () {
          final evolve = Evolve(phases: [
            EvolvePhase(
              name: "First Phase",
              description: "Write something here.",
            )
          ]);
          final smartContract = SmartContract(
              owner: ref.read(sessionProvider).currentWallet!,
              name: "My Evolving NFT",
              description: "Write some good stuff here...",
              evolves: [evolve]);

          _provider.setSmartContract(smartContract);
        },
      ),
      SmartContractTemplate(
        name: "Royalty Smart Contract",
        description:
            "Create a smart contract that includes a royalty that is enforced by the network on all future sales.",
        color: Theme.of(context).colorScheme.primary,
        images: [
          Assets.images.templateRoyalty1.path,
          Assets.images.templateRoyalty2.path,
          Assets.images.templateRoyalty3.path,
        ],
        init: () {
          final royalty = Royalty(
            amount: 0.3,
            type: RoyaltyType.percent,
            address: ref.read(sessionProvider).currentWallet!.address,
          );
          final smartContract = SmartContract(
            owner: ref.read(sessionProvider).currentWallet!,
            name: "My Royalty NFT",
            description: "Write some good stuff here...",
            royalties: [royalty],
          );

          _provider.setSmartContract(smartContract);
        },
      ),
    ];

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
          decoration: BoxDecoration(
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
                "Choose a Template",
                style: Theme.of(context).textTheme.headline2,
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
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     AppButton(
              //       label: "Create Custom",
              //       onPressed: () {
              //         ref
              //             .read(createSmartContractProvider.notifier)
              //             .clearSmartContract();
              //         AutoRouter.of(context)
              //             .push(SmartContractCreatorContainerScreenRoute());
              //       },
              //       type: AppButtonType.Elevated,
              //       variant: AppColorVariant.Light,
              //     ),
              //   ],
              // )
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
      timer = Timer.periodic(Duration(seconds: 3), (timer) {
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
      AutoRouter.of(context).push(SmartContractCreatorContainerScreenRoute());
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
          duration: Duration(milliseconds: 300),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            // border: Border.all(color: Colors.white10, width: 3),
            // color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withOpacity(isHovering ? .75 : 0.25),
                spreadRadius: 4,
                blurRadius: 10,
              ),
              BoxShadow(
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withOpacity(isHovering ? .75 : 0.25),
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
                            duration: Duration(milliseconds: 400),
                            // transitionBuilder: (child, animation) {
                            //   return ScaleTransition(
                            //     scale: animation,
                            //     child: child,
                            //   );
                            // },
                            child: Image.asset(
                              widget.template.images[
                                  _index % widget.template.images.length],
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.1),
                              width: 2,
                            ),
                          ),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.template.name,
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
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
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: 18, color: Colors.white, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // AppButton(
                      //   label: "Create",
                      //   icon: Icons.edit,
                      //   onPressed: _handleCreate,
                      //   type: AppButtonType.Elevated,
                      //   variant: AppColorVariant.Light,
                      // ),
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
                              )),
                          onPressed: _handleCreate,
                          child: Text("Create"),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      AppButton(
                        label: "Learn More",
                        icon: Icons.help,
                        onPressed: () {},
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
