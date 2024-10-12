import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/centered_loader.dart';
import '../../wallet/components/wallet_selector.dart';
import '../components/topic_detail.dart';
import '../providers/topic_detail_provider.dart';

class TopicDetailScreen extends BaseScreen {
  final String topicUid;
  const TopicDetailScreen({Key? key, @PathParam("uid") required this.topicUid}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(topicDetailProvider(topicUid));

    return data.when(
      data: (topic) => topic != null
          ? AppBar(
              title: Text(topic.name),
              // actions: const [WalletSelector()],
              backgroundColor: Colors.black,
            )
          : AppBar(
              title: const Text("Error"),
            ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
      loading: () => AppBar(
        title: const Text(""),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(topicDetailProvider(topicUid));
    return data.when(
      data: (topic) => topic != null ? TopicDetail(topic) : const Center(child: Text("Error")),
      error: (_, __) => const Text("Error"),
      loading: () => const CenteredLoader(),
    );
  }
}
