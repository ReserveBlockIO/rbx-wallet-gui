import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/topic.dart';
import '../services/topic_service.dart';

final topicDetailProvider = FutureProvider.family<Topic?, String>((ref, String uid) async {
  return TopicService().retrieve(uid);
});
