import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/topic.dart';
import '../services/topic_service.dart';

class TopicSearchProvider extends StateNotifier<List<Topic>> {
  final Reader read;

  final TextEditingController controller = TextEditingController();

  TopicSearchProvider(this.read, [List<Topic> topics = const []]) : super(topics) {}

  Future<void> query(String query) async {
    final data = await TopicService().search(query);
    state = data;
  }

  void clear() {
    state = [];
    controller.text = "";
  }
}

final topicSearchProvider = StateNotifierProvider<TopicSearchProvider, List<Topic>>(
  (ref) => TopicSearchProvider(ref.read),
);
