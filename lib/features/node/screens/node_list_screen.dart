import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/node/components/masternode_card.dart';
import 'package:rbx_wallet/features/node/components/node_info_list.dart';
import 'package:rbx_wallet/features/node/components/node_list.dart';
import 'package:rbx_wallet/features/node/providers/masternode_list_provider.dart';
import 'package:rbx_wallet/features/node/providers/node_list_provider.dart';
import 'package:rbx_wallet/features/validator/providers/validator_list_provider.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

class NodeListScreen extends BaseScreen {
  const NodeListScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Validator Pool"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [WalletSelector()],
      leading: IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          ref.read(nodeListProvider.notifier).load();
        },
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _searchProvider = ref.read(masternodeListProvider.notifier);
    final _searchModel = ref.watch(masternodeListProvider);
    return Column(
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
                  hintText: "Search for validator...",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: Colors.white70),
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
              icon: Icon(
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
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 500),
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

        // Padding(
        //   padding: const EdgeInsets.only(bottom: 8.0),
        //   child: NodeInfoList(),
        // ),
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
