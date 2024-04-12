import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/session_provider.dart';
import '../../../generated/assets.gen.dart';
import '../../smart_contracts/features/evolve/evolve.dart';
import '../../smart_contracts/features/evolve/evolve_phase.dart';
import '../../smart_contracts/features/royalty/royalty.dart';
import '../../smart_contracts/models/smart_contract.dart';
import '../../smart_contracts/models/smart_contract_template.dart';
import '../../smart_contracts/providers/create_smart_contract_provider.dart';
import '../components/learn_more_content.dart';

List<SmartContractTemplate> getSmartContractTemplates(
    BuildContext context, WidgetRef ref) {
  final _provider = ref.read(createSmartContractProvider.notifier);

  void _createBaseline() {
    final smartContract = SmartContract(
      owner: ref.read(sessionProvider).currentWallet!,
      name: "",
      description: "",
    );

    _provider.setSmartContract(smartContract);
  }

  void _createEvolving() {
    const evolve = Evolve(phases: [
      EvolvePhase(
        name: "",
        description: "",
      )
    ]);
    final smartContract = SmartContract(
        owner: ref.read(sessionProvider).currentWallet!,
        name: "",
        description: "",
        evolves: [evolve]);

    _provider.setSmartContract(smartContract);
  }

  void _createRoyalty() {
    final royalty = Royalty(
      amount: 0.05,
      type: RoyaltyType.percent,
      address: ref.read(sessionProvider).currentWallet!.address,
    );
    final smartContract = SmartContract(
      owner: ref.read(sessionProvider).currentWallet!,
      name: "",
      description: "",
      royalties: [royalty],
    );

    _provider.setSmartContract(smartContract);
  }

  final templates = [
    SmartContractTemplate(
      name: "Baseline Smart Contract",
      color: Theme.of(context).colorScheme.primary,
      description:
          "Create a baseline smart contract with an asset and metadata and mint it to the chain",
      images: [
        Assets.images.templateBasic1a.path,
        Assets.images.templateBasic2a.path,
        Assets.images.templateBasic3a.path,
      ],
      init: _createBaseline,
      learnMoreContent: LearnMoreContent(
        onCreate: _createBaseline,
        steps: [
          LearnMoreStep(
            title: "Metadata",
            description:
                "Start by providing the name, minter, and description of the smart contract.",
            imagePath: Assets.images.tutBasic1.path,
          ),
          LearnMoreStep(
            title: "Primary Asset",
            description:
                "Choose the primary asset for the smart contract. This can be an image, audio file, video, or any digital file.",
            imagePath: Assets.images.tutBasic2.path,
          ),
          LearnMoreStep(
            title: "Mint",
            description:
                "Click the compile button to generate the Trilliam code that represents the smart contract then click mint to deploy it to the chain.",
            imagePath: Assets.images.tutBasic3.path,
          ),
        ],
      ),
    ),
    SmartContractTemplate(
      name: "Evolving Smart Contract",
      description:
          "Generate a smart contract that can evolve based on time or on-chain variables",
      images: [
        Assets.images.templateEvolving1a.path,
        Assets.images.templateEvolving2a.path,
        Assets.images.templateEvolving3a.path,
      ],
      learnMoreContent: LearnMoreContent(
        onCreate: _createEvolving,
        steps: [
          LearnMoreStep(
            title: "Evolution Mode",
            description:
                "Decide whether you want the evolution to be controlled by the issuer or by the owner of the NFT.",
            imagePath: Assets.images.tutEvolve1.path,
          ),
          LearnMoreStep(
            title: "Evolution Type",
            description:
                "Configure whether you want the NFT to evolve automatically by date/time, block height, or only manually.",
            imagePath: Assets.images.tutEvolve2.path,
          ),
          LearnMoreStep(
            title: "Evolution Stages",
            description:
                "Create multiple evolution stages based on the variables provided previously. Give each stage a name, description and optionally override the asset.",
            imagePath: Assets.images.tutEvolve3.path,
          ),
        ],
      ),
      color: Theme.of(context).colorScheme.primary,
      init: _createEvolving,
    ),
    SmartContractTemplate(
      name: "Royalty Smart Contract",
      description:
          "Create a smart contract that includes a royalty that is enforced on-chain upon any trade",
      color: Theme.of(context).colorScheme.primary,
      images: [
        Assets.images.templateRoyalty1a.path,
        Assets.images.templateRoyalty2a.path,
        Assets.images.templateRoyalty3a.path,
      ],
      learnMoreContent: LearnMoreContent(
        onCreate: _createRoyalty,
        steps: [
          LearnMoreStep(
            title: "Royalty Type",
            description:
                "Choose either a flat fee or percentage based royalty enforced by the on the chain upon any trade.",
            imagePath: Assets.images.tutRoyalty1.path,
          ),
          LearnMoreStep(
            title: "Amount & Address",
            description:
                "Input the percentage amount to be paid to the VFX address defined in the next field.",
            imagePath: Assets.images.tutRoyalty2.path,
          ),
          LearnMoreStep(
            title: "Royalty Fee",
            description:
                "The fee is calculated from the sale proceeds and settled on transaction finality. For flat fees, the NFT can't be sold for less than the enforced royalty.",
            imagePath: Assets.images.tutRoyalty3.path,
          ),
        ],
      ),
      init: _createRoyalty,
    ),
  ];

  return templates;
}
