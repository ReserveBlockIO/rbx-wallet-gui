import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../components/token_topic_form.dart';

class CreateTokenTopicScreen extends BaseScreen {
  final String scId;
  final String address;
  const CreateTokenTopicScreen({
    Key? key,
    @PathParam('scId') required this.scId,
    @PathParam('address') required this.address,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Create Token Topic"),
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return TokenTopicForm(
      scId: scId,
      address: address,
    );
  }
}
