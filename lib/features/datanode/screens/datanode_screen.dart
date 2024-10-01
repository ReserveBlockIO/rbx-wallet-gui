import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../../wallet/components/wallet_selector.dart';

class DataNodeScreen extends BaseScreen {
  const DataNodeScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Datanode"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        "Activating soon.",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
