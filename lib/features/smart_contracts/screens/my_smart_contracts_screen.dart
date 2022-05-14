import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/draft_smart_contracts_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/my_smart_contracts_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class MySmartContractsScreen extends BaseScreen {
  const MySmartContractsScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("My Smart Contracts"),
      leading: IconButton(
        onPressed: () async {
          AutoRouter.of(context).pop();
        },
        icon: Icon(Icons.close),
      ),
      actions: [
        IconButton(
            onPressed: () {
              ref.read(mySmartContractsProvider.notifier).load();
              ref.read(draftsSmartContractProvider.notifier).load();
            },
            icon: Icon(Icons.refresh))
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            tabs: [
              Tab(
                child: Text("Drafts"),
              ),
              Tab(
                child: Text("Compiled"),
              ),
            ],
          ),
          Expanded(
              child: TabBarView(
            children: [
              _DraftList(),
              _CompiledList(),
            ],
          ))
        ],
      ),
    );
  }
}

class _DraftList extends BaseComponent {
  const _DraftList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(draftsSmartContractProvider.notifier);
    final _model = ref.watch(draftsSmartContractProvider);

    if (_model.isEmpty) {
      return Center(
        child: Text("No Smart Contracts Drafts Found"),
      );
    }
    return ListView.builder(
      itemCount: _model.length,
      itemBuilder: (context, index) {
        final sc = _model[index];
        return ListTile(
          leading: Icon(Icons.document_scanner_sharp),
          title: Text(sc.name),
          subtitle: Text(
            sc.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(Icons.chevron_right),
          onTap: () async {
            ref.read(createSmartContractProvider.notifier).setSmartContract(sc);

            AutoRouter.of(context)
                .push(SmartContractCreatorContainerScreenRoute());
          },
        );
      },
    );
  }
}

class _CompiledList extends BaseComponent {
  const _CompiledList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(mySmartContractsProvider.notifier);
    final _model = ref.watch(mySmartContractsProvider);

    if (_model.isEmpty) {
      return Center(
        child: Text("No Smart Contracts Found"),
      );
    }
    return ListView.builder(
      itemCount: _model.length,
      itemBuilder: (context, index) {
        final sc = _model[index];
        return ListTile(
          leading: Icon(Icons.document_scanner_sharp),
          title: Text(sc.name),
          subtitle: Text(sc.id),
          trailing: Icon(Icons.chevron_right),
          onTap: () async {
            final wallets = ref.read(walletListProvider);
            final details = await SmartContractService().retrieve(sc.id);
            if (details == null) {
              Toast.error();
              return;
            }
            final smartContract = SmartContract.fromCompiled(details, wallets);
            ref
                .read(createSmartContractProvider.notifier)
                .setSmartContract(smartContract);
            AutoRouter.of(context)
                .push(SmartContractCreatorContainerScreenRoute());
          },
        );
      },
    );
  }
}
