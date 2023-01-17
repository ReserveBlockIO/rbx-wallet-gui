import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../core/services/base_service.dart';
import '../models/new_topic.dart';
import '../models/topic.dart';
import 'vote_service.dart';

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
      final response = await getText(path, cleanPath: false);
      if (response.isEmpty) {
        return [];
      }
      final items = jsonDecode(response);

      final List<Topic> topics = [];
      for (final item in items) {
        topics.add(Topic.fromJson(item));
      }
      return topics;
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
    final myVotes = await VoteService().mine();
    final votedTopicUids = myVotes.map((v) => v.topicUid).toList();

    final _all = await all();
    return _all.where((t) => votedTopicUids.contains(t.uid)).toList();
  }

  Future<List<Topic>> notVoted() async {
    final myVotes = await VoteService().mine();
    final votedTopicUids = myVotes.map((v) => v.topicUid).toList();

    final _all = await all();
    return _all.where((t) => !votedTopicUids.contains(t.uid)).toList();
  }

  Future<List<Topic>> mine() async {
    return await _list("/GetMyTopics");
  }

  Future<List<Topic>> search(String query) async {
    return await _list("/GetSearchTopics/$query");
  }

  Future<bool> create(NewTopic topic) async {
    final payload = topic.toJson();
    debugPrint(jsonEncode(payload));

    try {
      final response = await postJson("/PostNewTopic", params: payload);

      if (response['data']?['Success'] == true) {
        return true;
      }
      return false;
    } catch (e, st) {
      print(e);
      print(st);
      return false;
    }
  }
}
