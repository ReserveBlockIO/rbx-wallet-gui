import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';

import '../providers/web_token_detail_provider.dart';

class WebTokenDetailScreen extends BaseScreen {
  final String scId;
  const WebTokenDetailScreen({super.key, @PathParam("scId") required this.scId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webTokenDetailProvider(scId));

    return data.when(
      loading: () => CenteredLoader(),
      error: (e, _) => Center(
        child: Text(e.toString()),
      ),
      data: (tokenDetail) {
        if (tokenDetail == null) {
          return Text("Not Found.");
        }

        return Text(tokenDetail.token.name);
      },
    );
  }
}
