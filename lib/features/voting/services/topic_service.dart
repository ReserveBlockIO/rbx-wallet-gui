import 'dart:convert';

import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/voting/models/new_topic.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';

class TopicService extends BaseService {
  TopicService() : super(apiBasePathOverride: "/voapi/VOV1");

  Future<Topic?> retrieve(String uid) async {
    try {
      final response = await getText("/GetTopicDetails/$uid");
      final item = jsonDecode(response);

      return Topic.fromJson(item);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<List<Topic>> _list(String path) async {
    try {
      final response = await getText(path);
      final items = jsonDecode(response);

      final List<Topic> topics = [];
      for (final item in items) {
        topics.add(Topic.fromJson(item));
      }
      return items;
    } catch (e, st) {
      print(e);
      print(st);
      return [];
    }
  }

  Future<List<Topic>> all() async {
    return await _list("/GetAllTopics");
  }

  Future<List<Topic>> active() async {
    return await _list("/GetActiveTopics");
  }

  Future<List<Topic>> inactive() async {
    return await _list("/GetInactiveTopics");
  }

  Future<List<Topic>> hasVoted() async {
    return await _list("/GetVotedOnTopics");
  }

  Future<List<Topic>> notVoted() async {
    return await _list("/GetNonVotedOnTopics");
  }

  Future<List<Topic>> mine() async {
    return await _list("/GetMyTopics");
  }

  Future<List<Topic>> search(String query) async {
    return await _list("/GetSearchTopics/$query");
  }

  Future<bool> create(NewTopic topic) async {
    try {
      await postJson("/PostNewTopic", params: topic.toJson());
      return true;
    } catch (e, st) {
      print(e);
      print(st);
      return false;
    }
  }
}
