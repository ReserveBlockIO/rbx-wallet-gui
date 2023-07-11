import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/token/components/token_card.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import 'package:rbx_wallet/features/token/providers/token_list_provider.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import 'manage_token_navigator.dart';

class ManageTokenGrid extends BaseComponent {
  const ManageTokenGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final TokenListModel _model = ref.watch(tokenListProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: ManageTokenNavigator(),
        ),
        Expanded(
          child: Builder(builder: (context) {
            if (!_model.data.results.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "No Tokens",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AppButton(
                      label: "Create Token",
                      variant: AppColorVariant.Success,
                      onPressed: () {
                        AutoRouter.of(context).push(TokenCreateScreenRoute());
                      },
                    ),
                  ],
                ),
              );
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: BreakPoints.useMobileLayout(context) ? 1 : 3,
                childAspectRatio: 1,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _model.data.results.length,
              itemBuilder: (context, index) {
                final nft = _model.data.results[index];

                return TokenCard(nft: nft);
                // return NftCard(
                //   key: Key(nft.id),
                //   nft,
                //   manageOnPress: minted,
                // );
              },
            );
          }),
        ),
      ],
    );
  }
}
