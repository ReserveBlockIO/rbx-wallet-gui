import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/back_to_home_button.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import '../../validator/providers/validator_list_provider.dart';
import '../../wallet/components/wallet_selector.dart';
import '../components/masternode_card.dart';
import '../components/node_card.dart';
import '../components/node_info_list.dart';
import '../providers/masternode_list_provider.dart';
import '../providers/node_list_provider.dart';

class NodeListScreen extends BaseScreen {
  const NodeListScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Validator Pool"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
      leading: BackToHomeButton(),
      // leading: IconButton(
      //   icon: const Icon(Icons.refresh),
      //   onPressed: () {
      //     ref.read(nodeListProvider.notifier).load();
      //   },
      // ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _searchProvider = ref.read(masternodeListProvider.notifier);
    final _searchModel = ref.watch(masternodeListProvider);

    final _validators = ref.watch(validatorListProvider);
    final _nodes = ref.read(nodeListProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _searchProvider.searchController,
                autofocus: true,
                onFieldSubmitted: (_) {
                  _searchProvider.search();
                },
                decoration: InputDecoration(
                  hintText: "Search by validator name...",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white70),
                    onPressed: () {
                      _searchProvider.clear();
                    },
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _searchProvider.search();
              },
              icon: const Icon(
                Icons.search,
              ),
            )
            // AppButton(
            //   label: "Search",
            //   // icon: Icons.search,
            //   type: AppButtonType.Text,
            //   variant: AppColorVariant.Info,
            //   onPressed: () {
            //     _searchProvider.search();
            //   },
            // ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "* Must be the name exactly",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 500),
          child: SingleChildScrollView(
            child: ListView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   childAspectRatio: 1,
              //   crossAxisSpacing: 8.0,
              //   mainAxisSpacing: 8.0,
              // ),
              shrinkWrap: true,
              itemCount: _searchModel.length,
              itemBuilder: (context, index) {
                final mn = _searchModel[index];

                return MasternodeCard(mn);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: NodeInfoList(),
        ),
        if (_validators.isNotEmpty)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Validator",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        if (_validators.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: _validators.length,
              itemBuilder: (context, index) {
                final w = _validators[index];

                final node = _nodes.firstWhereOrNull((n) => n.address == w.address);

                if (node != null) {
                  return NodeCard(node);
                }

                return ListTile(
                  title: Text(w.labelWithoutTruncation),
                  leading: w.isValidating
                      ? const AppBadge(
                          label: "Active",
                          variant: AppColorVariant.Success,
                        )
                      : const AppBadge(
                          label: "Inactive",
                          variant: AppColorVariant.Danger,
                        ),
                );
              },
            ),
          )
        // Expanded(
        //   child: Builder(
        //     builder: (context) {
        //       if (ref.read(validatorListProvider).isEmpty ||
        //           ref
        //               .read(validatorListProvider)
        //               .where((element) => element.isValidating)
        //               .toList()
        //               .isEmpty) {
        //         return Center(
        //           child:
        //               Text("You must be validating to view the Validator Pool"),
        //         );
        //       }
        //       return NodeList();
        //     },
        //   ),
        // ),
      ],
    );
  }
}
