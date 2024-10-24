import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../providers/create_smart_contract_provider.dart';
import '../providers/draft_smart_contracts_provider.dart';
import '../providers/my_smart_contracts_provider.dart';

class SmartContractDraftsScreen extends BaseScreen {
  const SmartContractDraftsScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("My Smart Contracts"),
      actions: [
        IconButton(
            onPressed: () {
              ref.read(mySmartContractsProvider.notifier).load();
              ref.read(draftsSmartContractProvider.notifier).load();
            },
            icon: const Icon(Icons.refresh))
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(draftsSmartContractProvider);

    if (_model.isEmpty) {
      return const Center(
        child: Text("No Smart Contracts Drafts Found"),
      );
    }
    return ListView.builder(
      itemCount: _model.length,
      itemBuilder: (context, index) {
        final sc = _model[index];
        return ListTile(
          leading: sc.primaryAsset != null && sc.primaryAsset!.isImage
              ? Image.file(
                  sc.primaryAsset!.file,
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.document_scanner),
          title: Text(sc.name),
          subtitle: Text(
            sc.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            ref.read(createSmartContractProvider.notifier).setSmartContract(sc);
            Navigator.of(context).pop();
            // Navigator.of(context).pop();
            // AutoRouter.of(context)
            //     .push(SmartContractCreatorContainerScreenRoute());
          },
        );
      },
    );
  }
}
