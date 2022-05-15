import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract_template.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/my_smart_contracts_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

class TemplateChooserScreen extends BaseScreen {
  const TemplateChooserScreen({Key? key}) : super(key: key);

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
    ;
    final templates = [
      SmartContractTemplate(
        name: "Basic NFT",
        description: "Lorem ipsum",
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
        name: "Evolving NFT",
        description: "Lorem ipsum",
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
        name: "Royalty NFT",
        description: "Lorem ipsum dollar",
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

    return ListView.builder(
      itemCount: templates.length,
      itemBuilder: (context, index) {
        final template = templates[index];
        return ListTile(
          leading: Icon(Icons.document_scanner_sharp),
          title: Text(template.name),
          subtitle: Text(template.description),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            _provider.clearSmartContract();
            template.init();
            AutoRouter.of(context)
                .push(SmartContractCreatorContainerScreenRoute());
          },
        );
      },
    );
  }
}
