// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return _Topic.fromJson(json);
}

/// @nodoc
mixin _$Topic {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicUID")
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicName")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicDescription")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicOwnerAddress")
  String get ownerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicOwnerSignature")
  String get ownerSignature => throw _privateConstructorUsedError;
  @JsonKey(name: "AdjudicatorAddress")
  String? get adjudicatorAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "BlockHeight")
  int get blockHeight => throw _privateConstructorUsedError;
  @JsonKey(name: "ValidatorCount")
  int get validatorCount => throw _privateConstructorUsedError;
  @JsonKey(name: "AdjudicatorSignature")
  String? get adjudicatorSignature => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicCreateDate")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "VotingEndDate")
  DateTime get endsAt => throw _privateConstructorUsedError;
  @JsonKey(name: "VoterType", fromJson: voterTypeFromJson)
  TopicVoterType get voterType => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteTopicCategory", fromJson: voteTopicCategoryFromJson)
  VoteTopicCategory get category => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteYes")
  int get yesVotes => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteNo")
  int get noVotes => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalVotes", fromJson: totalVoteFromJson)
  int get totalVotes => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentVotesYes")
  double get yesPercent => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentVotesNo")
  double get noPercent => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentInFavor")
  double get percentInFavor => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentAgainst")
  double get percentAgainst => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicCopyWith<Topic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicCopyWith<$Res> {
  factory $TopicCopyWith(Topic value, $Res Function(Topic) then) =
      _$TopicCopyWithImpl<$Res, Topic>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id")
          int id,
      @JsonKey(name: "TopicUID")
          String uid,
      @JsonKey(name: "TopicName")
          String name,
      @JsonKey(name: "TopicDescription")
          String description,
      @JsonKey(name: "TopicOwnerAddress")
          String ownerAddress,
      @JsonKey(name: "TopicOwnerSignature")
          String ownerSignature,
      @JsonKey(name: "AdjudicatorAddress")
          String? adjudicatorAddress,
      @JsonKey(name: "BlockHeight")
          int blockHeight,
      @JsonKey(name: "ValidatorCount")
          int validatorCount,
      @JsonKey(name: "AdjudicatorSignature")
          String? adjudicatorSignature,
      @JsonKey(name: "TopicCreateDate")
          DateTime createdAt,
      @JsonKey(name: "VotingEndDate")
          DateTime endsAt,
      @JsonKey(name: "VoterType", fromJson: voterTypeFromJson)
          TopicVoterType voterType,
      @JsonKey(name: "VoteTopicCategory", fromJson: voteTopicCategoryFromJson)
          VoteTopicCategory category,
      @JsonKey(name: "VoteYes")
          int yesVotes,
      @JsonKey(name: "VoteNo")
          int noVotes,
      @JsonKey(name: "TotalVotes", fromJson: totalVoteFromJson)
          int totalVotes,
      @JsonKey(name: "PercentVotesYes")
          double yesPercent,
      @JsonKey(name: "PercentVotesNo")
          double noPercent,
      @JsonKey(name: "PercentInFavor")
          double percentInFavor,
      @JsonKey(name: "PercentAgainst")
          double percentAgainst});
}

/// @nodoc
class _$TopicCopyWithImpl<$Res, $Val extends Topic>
    implements $TopicCopyWith<$Res> {
  _$TopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? name = null,
    Object? description = null,
    Object? ownerAddress = null,
    Object? ownerSignature = null,
    Object? adjudicatorAddress = freezed,
    Object? blockHeight = null,
    Object? validatorCount = null,
    Object? adjudicatorSignature = freezed,
    Object? createdAt = null,
    Object? endsAt = null,
    Object? voterType = null,
    Object? category = null,
    Object? yesVotes = null,
    Object? noVotes = null,
    Object? totalVotes = null,
    Object? yesPercent = null,
    Object? noPercent = null,
    Object? percentInFavor = null,
    Object? percentAgainst = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ownerSignature: null == ownerSignature
          ? _value.ownerSignature
          : ownerSignature // ignore: cast_nullable_to_non_nullable
              as String,
      adjudicatorAddress: freezed == adjudicatorAddress
          ? _value.adjudicatorAddress
          : adjudicatorAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      validatorCount: null == validatorCount
          ? _value.validatorCount
          : validatorCount // ignore: cast_nullable_to_non_nullable
              as int,
      adjudicatorSignature: freezed == adjudicatorSignature
          ? _value.adjudicatorSignature
          : adjudicatorSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      voterType: null == voterType
          ? _value.voterType
          : voterType // ignore: cast_nullable_to_non_nullable
              as TopicVoterType,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as VoteTopicCategory,
      yesVotes: null == yesVotes
          ? _value.yesVotes
          : yesVotes // ignore: cast_nullable_to_non_nullable
              as int,
      noVotes: null == noVotes
          ? _value.noVotes
          : noVotes // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int,
      yesPercent: null == yesPercent
          ? _value.yesPercent
          : yesPercent // ignore: cast_nullable_to_non_nullable
              as double,
      noPercent: null == noPercent
          ? _value.noPercent
          : noPercent // ignore: cast_nullable_to_non_nullable
              as double,
      percentInFavor: null == percentInFavor
          ? _value.percentInFavor
          : percentInFavor // ignore: cast_nullable_to_non_nullable
              as double,
      percentAgainst: null == percentAgainst
          ? _value.percentAgainst
          : percentAgainst // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopicCopyWith<$Res> implements $TopicCopyWith<$Res> {
  factory _$$_TopicCopyWith(_$_Topic value, $Res Function(_$_Topic) then) =
      __$$_TopicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id")
          int id,
      @JsonKey(name: "TopicUID")
          String uid,
      @JsonKey(name: "TopicName")
          String name,
      @JsonKey(name: "TopicDescription")
          String description,
      @JsonKey(name: "TopicOwnerAddress")
          String ownerAddress,
      @JsonKey(name: "TopicOwnerSignature")
          String ownerSignature,
      @JsonKey(name: "AdjudicatorAddress")
          String? adjudicatorAddress,
      @JsonKey(name: "BlockHeight")
          int blockHeight,
      @JsonKey(name: "ValidatorCount")
          int validatorCount,
      @JsonKey(name: "AdjudicatorSignature")
          String? adjudicatorSignature,
      @JsonKey(name: "TopicCreateDate")
          DateTime createdAt,
      @JsonKey(name: "VotingEndDate")
          DateTime endsAt,
      @JsonKey(name: "VoterType", fromJson: voterTypeFromJson)
          TopicVoterType voterType,
      @JsonKey(name: "VoteTopicCategory", fromJson: voteTopicCategoryFromJson)
          VoteTopicCategory category,
      @JsonKey(name: "VoteYes")
          int yesVotes,
      @JsonKey(name: "VoteNo")
          int noVotes,
      @JsonKey(name: "TotalVotes", fromJson: totalVoteFromJson)
          int totalVotes,
      @JsonKey(name: "PercentVotesYes")
          double yesPercent,
      @JsonKey(name: "PercentVotesNo")
          double noPercent,
      @JsonKey(name: "PercentInFavor")
          double percentInFavor,
      @JsonKey(name: "PercentAgainst")
          double percentAgainst});
}

/// @nodoc
class __$$_TopicCopyWithImpl<$Res> extends _$TopicCopyWithImpl<$Res, _$_Topic>
    implements _$$_TopicCopyWith<$Res> {
  __$$_TopicCopyWithImpl(_$_Topic _value, $Res Function(_$_Topic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? name = null,
    Object? description = null,
    Object? ownerAddress = null,
    Object? ownerSignature = null,
    Object? adjudicatorAddress = freezed,
    Object? blockHeight = null,
    Object? validatorCount = null,
    Object? adjudicatorSignature = freezed,
    Object? createdAt = null,
    Object? endsAt = null,
    Object? voterType = null,
    Object? category = null,
    Object? yesVotes = null,
    Object? noVotes = null,
    Object? totalVotes = null,
    Object? yesPercent = null,
    Object? noPercent = null,
    Object? percentInFavor = null,
    Object? percentAgainst = null,
  }) {
    return _then(_$_Topic(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ownerSignature: null == ownerSignature
          ? _value.ownerSignature
          : ownerSignature // ignore: cast_nullable_to_non_nullable
              as String,
      adjudicatorAddress: freezed == adjudicatorAddress
          ? _value.adjudicatorAddress
          : adjudicatorAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      validatorCount: null == validatorCount
          ? _value.validatorCount
          : validatorCount // ignore: cast_nullable_to_non_nullable
              as int,
      adjudicatorSignature: freezed == adjudicatorSignature
          ? _value.adjudicatorSignature
          : adjudicatorSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      voterType: null == voterType
          ? _value.voterType
          : voterType // ignore: cast_nullable_to_non_nullable
              as TopicVoterType,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as VoteTopicCategory,
      yesVotes: null == yesVotes
          ? _value.yesVotes
          : yesVotes // ignore: cast_nullable_to_non_nullable
              as int,
      noVotes: null == noVotes
          ? _value.noVotes
          : noVotes // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int,
      yesPercent: null == yesPercent
          ? _value.yesPercent
          : yesPercent // ignore: cast_nullable_to_non_nullable
              as double,
      noPercent: null == noPercent
          ? _value.noPercent
          : noPercent // ignore: cast_nullable_to_non_nullable
              as double,
      percentInFavor: null == percentInFavor
          ? _value.percentInFavor
          : percentInFavor // ignore: cast_nullable_to_non_nullable
              as double,
      percentAgainst: null == percentAgainst
          ? _value.percentAgainst
          : percentAgainst // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Topic extends _Topic {
  _$_Topic(
      {@JsonKey(name: "Id")
          required this.id,
      @JsonKey(name: "TopicUID")
          required this.uid,
      @JsonKey(name: "TopicName")
          required this.name,
      @JsonKey(name: "TopicDescription")
          required this.description,
      @JsonKey(name: "TopicOwnerAddress")
          required this.ownerAddress,
      @JsonKey(name: "TopicOwnerSignature")
          required this.ownerSignature,
      @JsonKey(name: "AdjudicatorAddress")
          this.adjudicatorAddress,
      @JsonKey(name: "BlockHeight")
          required this.blockHeight,
      @JsonKey(name: "ValidatorCount")
          required this.validatorCount,
      @JsonKey(name: "AdjudicatorSignature")
          this.adjudicatorSignature,
      @JsonKey(name: "TopicCreateDate")
          required this.createdAt,
      @JsonKey(name: "VotingEndDate")
          required this.endsAt,
      @JsonKey(name: "VoterType", fromJson: voterTypeFromJson)
          required this.voterType,
      @JsonKey(name: "VoteTopicCategory", fromJson: voteTopicCategoryFromJson)
          required this.category,
      @JsonKey(name: "VoteYes")
          required this.yesVotes,
      @JsonKey(name: "VoteNo")
          required this.noVotes,
      @JsonKey(name: "TotalVotes", fromJson: totalVoteFromJson)
          required this.totalVotes,
      @JsonKey(name: "PercentVotesYes")
          required this.yesPercent,
      @JsonKey(name: "PercentVotesNo")
          required this.noPercent,
      @JsonKey(name: "PercentInFavor")
          required this.percentInFavor,
      @JsonKey(name: "PercentAgainst")
          required this.percentAgainst})
      : super._();

  factory _$_Topic.fromJson(Map<String, dynamic> json) =>
      _$$_TopicFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "TopicUID")
  final String uid;
  @override
  @JsonKey(name: "TopicName")
  final String name;
  @override
  @JsonKey(name: "TopicDescription")
  final String description;
  @override
  @JsonKey(name: "TopicOwnerAddress")
  final String ownerAddress;
  @override
  @JsonKey(name: "TopicOwnerSignature")
  final String ownerSignature;
  @override
  @JsonKey(name: "AdjudicatorAddress")
  final String? adjudicatorAddress;
  @override
  @JsonKey(name: "BlockHeight")
  final int blockHeight;
  @override
  @JsonKey(name: "ValidatorCount")
  final int validatorCount;
  @override
  @JsonKey(name: "AdjudicatorSignature")
  final String? adjudicatorSignature;
  @override
  @JsonKey(name: "TopicCreateDate")
  final DateTime createdAt;
  @override
  @JsonKey(name: "VotingEndDate")
  final DateTime endsAt;
  @override
  @JsonKey(name: "VoterType", fromJson: voterTypeFromJson)
  final TopicVoterType voterType;
  @override
  @JsonKey(name: "VoteTopicCategory", fromJson: voteTopicCategoryFromJson)
  final VoteTopicCategory category;
  @override
  @JsonKey(name: "VoteYes")
  final int yesVotes;
  @override
  @JsonKey(name: "VoteNo")
  final int noVotes;
  @override
  @JsonKey(name: "TotalVotes", fromJson: totalVoteFromJson)
  final int totalVotes;
  @override
  @JsonKey(name: "PercentVotesYes")
  final double yesPercent;
  @override
  @JsonKey(name: "PercentVotesNo")
  final double noPercent;
  @override
  @JsonKey(name: "PercentInFavor")
  final double percentInFavor;
  @override
  @JsonKey(name: "PercentAgainst")
  final double percentAgainst;

  @override
  String toString() {
    return 'Topic(id: $id, uid: $uid, name: $name, description: $description, ownerAddress: $ownerAddress, ownerSignature: $ownerSignature, adjudicatorAddress: $adjudicatorAddress, blockHeight: $blockHeight, validatorCount: $validatorCount, adjudicatorSignature: $adjudicatorSignature, createdAt: $createdAt, endsAt: $endsAt, voterType: $voterType, category: $category, yesVotes: $yesVotes, noVotes: $noVotes, totalVotes: $totalVotes, yesPercent: $yesPercent, noPercent: $noPercent, percentInFavor: $percentInFavor, percentAgainst: $percentAgainst)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Topic &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
            (identical(other.ownerSignature, ownerSignature) ||
                other.ownerSignature == ownerSignature) &&
            (identical(other.adjudicatorAddress, adjudicatorAddress) ||
                other.adjudicatorAddress == adjudicatorAddress) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.validatorCount, validatorCount) ||
                other.validatorCount == validatorCount) &&
            (identical(other.adjudicatorSignature, adjudicatorSignature) ||
                other.adjudicatorSignature == adjudicatorSignature) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.voterType, voterType) ||
                other.voterType == voterType) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.yesVotes, yesVotes) ||
                other.yesVotes == yesVotes) &&
            (identical(other.noVotes, noVotes) || other.noVotes == noVotes) &&
            (identical(other.totalVotes, totalVotes) ||
                other.totalVotes == totalVotes) &&
            (identical(other.yesPercent, yesPercent) ||
                other.yesPercent == yesPercent) &&
            (identical(other.noPercent, noPercent) ||
                other.noPercent == noPercent) &&
            (identical(other.percentInFavor, percentInFavor) ||
                other.percentInFavor == percentInFavor) &&
            (identical(other.percentAgainst, percentAgainst) ||
                other.percentAgainst == percentAgainst));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uid,
        name,
        description,
        ownerAddress,
        ownerSignature,
        adjudicatorAddress,
        blockHeight,
        validatorCount,
        adjudicatorSignature,
        createdAt,
        endsAt,
        voterType,
        category,
        yesVotes,
        noVotes,
        totalVotes,
        yesPercent,
        noPercent,
        percentInFavor,
        percentAgainst
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopicCopyWith<_$_Topic> get copyWith =>
      __$$_TopicCopyWithImpl<_$_Topic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopicToJson(
      this,
    );
  }
}

abstract class _Topic extends Topic {
  factory _Topic(
      {@JsonKey(name: "Id")
          required final int id,
      @JsonKey(name: "TopicUID")
          required final String uid,
      @JsonKey(name: "TopicName")
          required final String name,
      @JsonKey(name: "TopicDescription")
          required final String description,
      @JsonKey(name: "TopicOwnerAddress")
          required final String ownerAddress,
      @JsonKey(name: "TopicOwnerSignature")
          required final String ownerSignature,
      @JsonKey(name: "AdjudicatorAddress")
          final String? adjudicatorAddress,
      @JsonKey(name: "BlockHeight")
          required final int blockHeight,
      @JsonKey(name: "ValidatorCount")
          required final int validatorCount,
      @JsonKey(name: "AdjudicatorSignature")
          final String? adjudicatorSignature,
      @JsonKey(name: "TopicCreateDate")
          required final DateTime createdAt,
      @JsonKey(name: "VotingEndDate")
          required final DateTime endsAt,
      @JsonKey(name: "VoterType", fromJson: voterTypeFromJson)
          required final TopicVoterType voterType,
      @JsonKey(name: "VoteTopicCategory", fromJson: voteTopicCategoryFromJson)
          required final VoteTopicCategory category,
      @JsonKey(name: "VoteYes")
          required final int yesVotes,
      @JsonKey(name: "VoteNo")
          required final int noVotes,
      @JsonKey(name: "TotalVotes", fromJson: totalVoteFromJson)
          required final int totalVotes,
      @JsonKey(name: "PercentVotesYes")
          required final double yesPercent,
      @JsonKey(name: "PercentVotesNo")
          required final double noPercent,
      @JsonKey(name: "PercentInFavor")
          required final double percentInFavor,
      @JsonKey(name: "PercentAgainst")
          required final double percentAgainst}) = _$_Topic;
  _Topic._() : super._();

  factory _Topic.fromJson(Map<String, dynamic> json) = _$_Topic.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "TopicUID")
  String get uid;
  @override
  @JsonKey(name: "TopicName")
  String get name;
  @override
  @JsonKey(name: "TopicDescription")
  String get description;
  @override
  @JsonKey(name: "TopicOwnerAddress")
  String get ownerAddress;
  @override
  @JsonKey(name: "TopicOwnerSignature")
  String get ownerSignature;
  @override
  @JsonKey(name: "AdjudicatorAddress")
  String? get adjudicatorAddress;
  @override
  @JsonKey(name: "BlockHeight")
  int get blockHeight;
  @override
  @JsonKey(name: "ValidatorCount")
  int get validatorCount;
  @override
  @JsonKey(name: "AdjudicatorSignature")
  String? get adjudicatorSignature;
  @override
  @JsonKey(name: "TopicCreateDate")
  DateTime get createdAt;
  @override
  @JsonKey(name: "VotingEndDate")
  DateTime get endsAt;
  @override
  @JsonKey(name: "VoterType", fromJson: voterTypeFromJson)
  TopicVoterType get voterType;
  @override
  @JsonKey(name: "VoteTopicCategory", fromJson: voteTopicCategoryFromJson)
  VoteTopicCategory get category;
  @override
  @JsonKey(name: "VoteYes")
  int get yesVotes;
  @override
  @JsonKey(name: "VoteNo")
  int get noVotes;
  @override
  @JsonKey(name: "TotalVotes", fromJson: totalVoteFromJson)
  int get totalVotes;
  @override
  @JsonKey(name: "PercentVotesYes")
  double get yesPercent;
  @override
  @JsonKey(name: "PercentVotesNo")
  double get noPercent;
  @override
  @JsonKey(name: "PercentInFavor")
  double get percentInFavor;
  @override
  @JsonKey(name: "PercentAgainst")
  double get percentAgainst;
  @override
  @JsonKey(ignore: true)
  _$$_TopicCopyWith<_$_Topic> get copyWith =>
      throw _privateConstructorUsedError;
}
