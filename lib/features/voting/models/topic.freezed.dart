// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$TopicCopyWithImpl<$Res>;
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
class _$TopicCopyWithImpl<$Res> implements $TopicCopyWith<$Res> {
  _$TopicCopyWithImpl(this._value, this._then);

  final Topic _value;
  // ignore: unused_field
  final $Res Function(Topic) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? ownerAddress = freezed,
    Object? ownerSignature = freezed,
    Object? adjudicatorAddress = freezed,
    Object? blockHeight = freezed,
    Object? validatorCount = freezed,
    Object? adjudicatorSignature = freezed,
    Object? createdAt = freezed,
    Object? endsAt = freezed,
    Object? voterType = freezed,
    Object? category = freezed,
    Object? yesVotes = freezed,
    Object? noVotes = freezed,
    Object? totalVotes = freezed,
    Object? yesPercent = freezed,
    Object? noPercent = freezed,
    Object? percentInFavor = freezed,
    Object? percentAgainst = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: ownerAddress == freezed
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ownerSignature: ownerSignature == freezed
          ? _value.ownerSignature
          : ownerSignature // ignore: cast_nullable_to_non_nullable
              as String,
      adjudicatorAddress: adjudicatorAddress == freezed
          ? _value.adjudicatorAddress
          : adjudicatorAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      blockHeight: blockHeight == freezed
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      validatorCount: validatorCount == freezed
          ? _value.validatorCount
          : validatorCount // ignore: cast_nullable_to_non_nullable
              as int,
      adjudicatorSignature: adjudicatorSignature == freezed
          ? _value.adjudicatorSignature
          : adjudicatorSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: endsAt == freezed
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      voterType: voterType == freezed
          ? _value.voterType
          : voterType // ignore: cast_nullable_to_non_nullable
              as TopicVoterType,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as VoteTopicCategory,
      yesVotes: yesVotes == freezed
          ? _value.yesVotes
          : yesVotes // ignore: cast_nullable_to_non_nullable
              as int,
      noVotes: noVotes == freezed
          ? _value.noVotes
          : noVotes // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: totalVotes == freezed
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int,
      yesPercent: yesPercent == freezed
          ? _value.yesPercent
          : yesPercent // ignore: cast_nullable_to_non_nullable
              as double,
      noPercent: noPercent == freezed
          ? _value.noPercent
          : noPercent // ignore: cast_nullable_to_non_nullable
              as double,
      percentInFavor: percentInFavor == freezed
          ? _value.percentInFavor
          : percentInFavor // ignore: cast_nullable_to_non_nullable
              as double,
      percentAgainst: percentAgainst == freezed
          ? _value.percentAgainst
          : percentAgainst // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_TopicCopyWith<$Res> implements $TopicCopyWith<$Res> {
  factory _$$_TopicCopyWith(_$_Topic value, $Res Function(_$_Topic) then) =
      __$$_TopicCopyWithImpl<$Res>;
  @override
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
class __$$_TopicCopyWithImpl<$Res> extends _$TopicCopyWithImpl<$Res>
    implements _$$_TopicCopyWith<$Res> {
  __$$_TopicCopyWithImpl(_$_Topic _value, $Res Function(_$_Topic) _then)
      : super(_value, (v) => _then(v as _$_Topic));

  @override
  _$_Topic get _value => super._value as _$_Topic;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? ownerAddress = freezed,
    Object? ownerSignature = freezed,
    Object? adjudicatorAddress = freezed,
    Object? blockHeight = freezed,
    Object? validatorCount = freezed,
    Object? adjudicatorSignature = freezed,
    Object? createdAt = freezed,
    Object? endsAt = freezed,
    Object? voterType = freezed,
    Object? category = freezed,
    Object? yesVotes = freezed,
    Object? noVotes = freezed,
    Object? totalVotes = freezed,
    Object? yesPercent = freezed,
    Object? noPercent = freezed,
    Object? percentInFavor = freezed,
    Object? percentAgainst = freezed,
  }) {
    return _then(_$_Topic(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: ownerAddress == freezed
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ownerSignature: ownerSignature == freezed
          ? _value.ownerSignature
          : ownerSignature // ignore: cast_nullable_to_non_nullable
              as String,
      adjudicatorAddress: adjudicatorAddress == freezed
          ? _value.adjudicatorAddress
          : adjudicatorAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      blockHeight: blockHeight == freezed
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      validatorCount: validatorCount == freezed
          ? _value.validatorCount
          : validatorCount // ignore: cast_nullable_to_non_nullable
              as int,
      adjudicatorSignature: adjudicatorSignature == freezed
          ? _value.adjudicatorSignature
          : adjudicatorSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: endsAt == freezed
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      voterType: voterType == freezed
          ? _value.voterType
          : voterType // ignore: cast_nullable_to_non_nullable
              as TopicVoterType,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as VoteTopicCategory,
      yesVotes: yesVotes == freezed
          ? _value.yesVotes
          : yesVotes // ignore: cast_nullable_to_non_nullable
              as int,
      noVotes: noVotes == freezed
          ? _value.noVotes
          : noVotes // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: totalVotes == freezed
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int,
      yesPercent: yesPercent == freezed
          ? _value.yesPercent
          : yesPercent // ignore: cast_nullable_to_non_nullable
              as double,
      noPercent: noPercent == freezed
          ? _value.noPercent
          : noPercent // ignore: cast_nullable_to_non_nullable
              as double,
      percentInFavor: percentInFavor == freezed
          ? _value.percentInFavor
          : percentInFavor // ignore: cast_nullable_to_non_nullable
              as double,
      percentAgainst: percentAgainst == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.ownerAddress, ownerAddress) &&
            const DeepCollectionEquality()
                .equals(other.ownerSignature, ownerSignature) &&
            const DeepCollectionEquality()
                .equals(other.adjudicatorAddress, adjudicatorAddress) &&
            const DeepCollectionEquality()
                .equals(other.blockHeight, blockHeight) &&
            const DeepCollectionEquality()
                .equals(other.validatorCount, validatorCount) &&
            const DeepCollectionEquality()
                .equals(other.adjudicatorSignature, adjudicatorSignature) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.endsAt, endsAt) &&
            const DeepCollectionEquality().equals(other.voterType, voterType) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.yesVotes, yesVotes) &&
            const DeepCollectionEquality().equals(other.noVotes, noVotes) &&
            const DeepCollectionEquality()
                .equals(other.totalVotes, totalVotes) &&
            const DeepCollectionEquality()
                .equals(other.yesPercent, yesPercent) &&
            const DeepCollectionEquality().equals(other.noPercent, noPercent) &&
            const DeepCollectionEquality()
                .equals(other.percentInFavor, percentInFavor) &&
            const DeepCollectionEquality()
                .equals(other.percentAgainst, percentAgainst));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(uid),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(description),
        const DeepCollectionEquality().hash(ownerAddress),
        const DeepCollectionEquality().hash(ownerSignature),
        const DeepCollectionEquality().hash(adjudicatorAddress),
        const DeepCollectionEquality().hash(blockHeight),
        const DeepCollectionEquality().hash(validatorCount),
        const DeepCollectionEquality().hash(adjudicatorSignature),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(endsAt),
        const DeepCollectionEquality().hash(voterType),
        const DeepCollectionEquality().hash(category),
        const DeepCollectionEquality().hash(yesVotes),
        const DeepCollectionEquality().hash(noVotes),
        const DeepCollectionEquality().hash(totalVotes),
        const DeepCollectionEquality().hash(yesPercent),
        const DeepCollectionEquality().hash(noPercent),
        const DeepCollectionEquality().hash(percentInFavor),
        const DeepCollectionEquality().hash(percentAgainst)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_TopicCopyWith<_$_Topic> get copyWith =>
      __$$_TopicCopyWithImpl<_$_Topic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopicToJson(this);
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
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TopicUID")
  String get uid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TopicName")
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TopicDescription")
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TopicOwnerAddress")
  String get ownerAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TopicOwnerSignature")
  String get ownerSignature => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "AdjudicatorAddress")
  String? get adjudicatorAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "BlockHeight")
  int get blockHeight => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "ValidatorCount")
  int get validatorCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "AdjudicatorSignature")
  String? get adjudicatorSignature => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TopicCreateDate")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "VotingEndDate")
  DateTime get endsAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "VoterType", fromJson: voterTypeFromJson)
  TopicVoterType get voterType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "VoteTopicCategory", fromJson: voteTopicCategoryFromJson)
  VoteTopicCategory get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "VoteYes")
  int get yesVotes => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "VoteNo")
  int get noVotes => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TotalVotes", fromJson: totalVoteFromJson)
  int get totalVotes => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "PercentVotesYes")
  double get yesPercent => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "PercentVotesNo")
  double get noPercent => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "PercentInFavor")
  double get percentInFavor => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "PercentAgainst")
  double get percentAgainst => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TopicCopyWith<_$_Topic> get copyWith =>
      throw _privateConstructorUsedError;
}
