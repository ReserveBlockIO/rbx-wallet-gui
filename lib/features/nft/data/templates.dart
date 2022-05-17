import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/nft/components/learn_more_content.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract_template.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';

List<SmartContractTemplate> getSmartContractTemplates(
    BuildContext context, WidgetRef ref) {
  final _provider = ref.read(createSmartContractProvider.notifier);

  void _createBaseline() {
    final smartContract = SmartContract(
      owner: ref.read(sessionProvider).currentWallet!,
      name: "My Basic Smart Contract",
      description: "Write a description about this smart contract here.",
    );

    _provider.setSmartContract(smartContract);
  }

  void _createEvolving() {
    final evolve = Evolve(phases: [
      EvolvePhase(
        name: "Phase 2",
        description: "Write a description about this phase.",
      )
    ]);
    final smartContract = SmartContract(
        owner: ref.read(sessionProvider).currentWallet!,
        name: "My Evolving Smart Contract",
        description:
            "Write a description about this evolving smart contract here.",
        evolves: [evolve]);

    _provider.setSmartContract(smartContract);
  }

  void _createRoyalty() {
    final royalty = Royalty(
      amount: 0.3,
      type: RoyaltyType.percent,
      address: ref.read(sessionProvider).currentWallet!.address,
    );
    final smartContract = SmartContract(
      owner: ref.read(sessionProvider).currentWallet!,
      name: "My Royalty Smart Contract",
      description:
          "Write a description about this royalty enforced smart contract here.",
      royalties: [royalty],
    );

    _provider.setSmartContract(smartContract);
  }

  final learnMorePlaceholder = [
    LearnMoreStep(
      title: "Heading",
      description:
          "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada.",
    ),
    LearnMoreStep(
      title: "Heading",
      description:
          "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada.",
    ),
    LearnMoreStep(
      title: "Heading",
      description:
          "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada.",
    ),
  ];

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
      init: _createBaseline,
      learnMoreContent: LearnMoreContent(
        onCreate: _createBaseline,
        steps: learnMorePlaceholder,
      ),
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
      learnMoreContent: LearnMoreContent(
        onCreate: _createEvolving,
        steps: learnMorePlaceholder,
      ),
      color: Theme.of(context).colorScheme.primary,
      init: _createEvolving,
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
      learnMoreContent: LearnMoreContent(
        onCreate: _createRoyalty,
        steps: learnMorePlaceholder,
      ),
      init: _createRoyalty,
    ),
  ];

  return templates;
}
