import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../components/topic_form.dart';

class CreateTopicScreen extends BaseScreen {
  const CreateTopicScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Create Topic"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return TopicForm();
  }
}
