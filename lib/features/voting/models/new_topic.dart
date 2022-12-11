import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';

part 'new_topic.freezed.dart';
part 'new_topic.g.dart';

enum VotingDays {
  Thirty,
  Sixty,
  Ninety,
  OneHundredEighty,
}

votingDaysToJson(VotingDays value) {
  switch (value) {
    case VotingDays.Thirty:
      return 30;
    case VotingDays.Sixty:
      return 60;
    case VotingDays.Ninety:
      return 90;
    case VotingDays.OneHundredEighty:
      return 180;
  }
}

categoryToJson(VoteTopicCategory value) {
  return value.index;
}

@freezed
class NewTopic with _$NewTopic {
  const NewTopic._();

  factory NewTopic({
    @JsonKey(name: "TopicName") required String name,
    @JsonKey(name: "TopicDescription") required String description,
    @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson) required VotingDays votingEndDays,
    @JsonKey(name: "VoteTopicCategory", toJson: categoryToJson) required VoteTopicCategory category,
  }) = _NewTopic;

  factory NewTopic.fromJson(Map<String, dynamic> json) => _$NewTopicFromJson(json);

  factory NewTopic.empty() {
    return NewTopic(
      name: "",
      description: "",
      votingEndDays: VotingDays.Thirty,
      category: VoteTopicCategory.General,
    );
  }
}
