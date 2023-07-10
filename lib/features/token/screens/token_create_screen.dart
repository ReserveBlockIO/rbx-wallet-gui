import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/token/components/token_form.dart';

class TokenCreateScreen extends BaseScreen {
  const TokenCreateScreen({super.key})
      : super(
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black54,
      title: Text("Create Token"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: TokenForm(),
    ));
  }
}
