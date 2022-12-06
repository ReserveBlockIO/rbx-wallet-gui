import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/voting/services/topic_service.dart';

final topicDetailProvider = FutureProvider.family<Topic?, String>((ref, String uid) async {
  return TopicService().retrieve(uid);
});
