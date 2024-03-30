import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/screens/tokenize_btc_screen.dart';

import '../providers/tokenized_bitcoin_list_provider.dart';

class TokenizeBtcListScreen extends BaseScreen {
  const TokenizeBtcListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text("Tokenized Bitcoins"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: AppButton(
            label: "Tokenize BTC",
            variant: AppColorVariant.Btc,
            icon: FontAwesomeIcons.bitcoin,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TokenizeBtcScreen(),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final tokens = ref.watch(tokenizedBitcoinListProvider);
    if (tokens.isEmpty) {
      return Center(
        child: Text("You don't have any tokenized bitcoin"),
      );
    }
    return ListView.builder(
      itemCount: tokens.length,
      itemBuilder: (context, index) {
        final token = tokens[index];

        return ListTile(
          title: Text(token.tokenName),
        );
      },
    );
  }
}
