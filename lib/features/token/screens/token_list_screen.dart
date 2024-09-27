import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/features/token/components/manage_token_grid.dart';
import 'package:rbx_wallet/features/token/components/token_list.dart';
import 'package:rbx_wallet/core/components/back_to_home_button.dart';

class TokenListScreen extends BaseScreen {
  const TokenListScreen({super.key})
      : super(
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black54,
      centerTitle: true,
      title: Text("Fungible Tokens"),
      leading: BackToHomeButton(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: AppButton(
            label: "Create Token",
            variant: AppColorVariant.Success,
            onPressed: () {
              AutoRouter.of(context).push(TokenCreateScreenRoute());
            },
          ),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return TokenList();
  }
}
