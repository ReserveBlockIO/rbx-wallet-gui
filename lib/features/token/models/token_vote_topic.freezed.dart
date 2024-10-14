// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_vote_topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenVoteTopic _$TokenVoteTopicFromJson(Map<String, dynamic> json) {
  return _TokenVoteTopic.fromJson(json);
}

/// @nodoc
mixin _$TokenVoteTopic {
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicUID")
  String get topicUid => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicName")
  String get topicName => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicDescription")
  String get topicDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "MinimumVoteRequirement")
  int get minimumVoteRequirement => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenHolderCount")
  int get tokenHolderCount => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicCreateDate")
  int get topicCreateDate => throw _privateConstructorUsedError;
  @JsonKey(name: "VotingEndDate")
  int get votingEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: "BlockHeight")
  int get blockHeight => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteYes")
  int get voteYes => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteNo")
  int get voteNo => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalVotes")
  double get totalVotes => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentVotesYes")
  double get percentVotesYes => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentVotesNo")
  double get percentVotesNo => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentInFavor")
  double get percentInFavor => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentAgainst")
  double get percentAgainst => throw _privateConstructorUsedError;
  List<WebTokenVoteTopicVoteDataItem>? get webVoteList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenVoteTopicCopyWith<TokenVoteTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenVoteTopicCopyWith<$Res> {
  factory $TokenVoteTopicCopyWith(
          TokenVoteTopic value, $Res Function(TokenVoteTopic) then) =
      _$TokenVoteTopicCopyWithImpl<$Res, TokenVoteTopic>;
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContractUID") String smartContractUid,
      @JsonKey(name: "TopicUID") String topicUid,
      @JsonKey(name: "TopicName") String topicName,
      @JsonKey(name: "TopicDescription") String topicDescription,
      @JsonKey(name: "MinimumVoteRequirement") int minimumVoteRequirement,
      @JsonKey(name: "TokenHolderCount") int tokenHolderCount,
      @JsonKey(name: "TopicCreateDate") int topicCreateDate,
      @JsonKey(name: "VotingEndDate") int votingEndDate,
      @JsonKey(name: "BlockHeight") int blockHeight,
      @JsonKey(name: "VoteYes") int voteYes,
      @JsonKey(name: "VoteNo") int voteNo,
      @JsonKey(name: "TotalVotes") double totalVotes,
      @JsonKey(name: "PercentVotesYes") double percentVotesYes,
      @JsonKey(name: "PercentVotesNo") double percentVotesNo,
      @JsonKey(name: "PercentInFavor") double percentInFavor,
      @JsonKey(name: "PercentAgainst") double percentAgainst,
      List<WebTokenVoteTopicVoteDataItem>? webVoteList});
}

/// @nodoc
class _$TokenVoteTopicCopyWithImpl<$Res, $Val extends TokenVoteTopic>
    implements $TokenVoteTopicCopyWith<$Res> {
  _$TokenVoteTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? topicName = null,
    Object? topicDescription = null,
    Object? minimumVoteRequirement = null,
    Object? tokenHolderCount = null,
    Object? topicCreateDate = null,
    Object? votingEndDate = null,
    Object? blockHeight = null,
    Object? voteYes = null,
    Object? voteNo = null,
    Object? totalVotes = null,
    Object? percentVotesYes = null,
    Object? percentVotesNo = null,
    Object? percentInFavor = null,
    Object? percentAgainst = null,
    Object? webVoteList = freezed,
  }) {
    return _then(_value.copyWith(
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      topicDescription: null == topicDescription
          ? _value.topicDescription
          : topicDescription // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as int,
      tokenHolderCount: null == tokenHolderCount
          ? _value.tokenHolderCount
          : tokenHolderCount // ignore: cast_nullable_to_non_nullable
              as int,
      topicCreateDate: null == topicCreateDate
          ? _value.topicCreateDate
          : topicCreateDate // ignore: cast_nullable_to_non_nullable
              as int,
      votingEndDate: null == votingEndDate
          ? _value.votingEndDate
          : votingEndDate // ignore: cast_nullable_to_non_nullable
              as int,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      voteYes: null == voteYes
          ? _value.voteYes
          : voteYes // ignore: cast_nullable_to_non_nullable
              as int,
      voteNo: null == voteNo
          ? _value.voteNo
          : voteNo // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as double,
      percentVotesYes: null == percentVotesYes
          ? _value.percentVotesYes
          : percentVotesYes // ignore: cast_nullable_to_non_nullable
              as double,
      percentVotesNo: null == percentVotesNo
          ? _value.percentVotesNo
          : percentVotesNo // ignore: cast_nullable_to_non_nullable
              as double,
      percentInFavor: null == percentInFavor
          ? _value.percentInFavor
          : percentInFavor // ignore: cast_nullable_to_non_nullable
              as double,
      percentAgainst: null == percentAgainst
          ? _value.percentAgainst
          : percentAgainst // ignore: cast_nullable_to_non_nullable
              as double,
      webVoteList: freezed == webVoteList
          ? _value.webVoteList
          : webVoteList // ignore: cast_nullable_to_non_nullable
              as List<WebTokenVoteTopicVoteDataItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenVoteTopicCopyWith<$Res>
    implements $TokenVoteTopicCopyWith<$Res> {
  factory _$$_TokenVoteTopicCopyWith(
          _$_TokenVoteTopic value, $Res Function(_$_TokenVoteTopic) then) =
      __$$_TokenVoteTopicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContractUID") String smartContractUid,
      @JsonKey(name: "TopicUID") String topicUid,
      @JsonKey(name: "TopicName") String topicName,
      @JsonKey(name: "TopicDescription") String topicDescription,
      @JsonKey(name: "MinimumVoteRequirement") int minimumVoteRequirement,
      @JsonKey(name: "TokenHolderCount") int tokenHolderCount,
      @JsonKey(name: "TopicCreateDate") int topicCreateDate,
      @JsonKey(name: "VotingEndDate") int votingEndDate,
      @JsonKey(name: "BlockHeight") int blockHeight,
      @JsonKey(name: "VoteYes") int voteYes,
      @JsonKey(name: "VoteNo") int voteNo,
      @JsonKey(name: "TotalVotes") double totalVotes,
      @JsonKey(name: "PercentVotesYes") double percentVotesYes,
      @JsonKey(name: "PercentVotesNo") double percentVotesNo,
      @JsonKey(name: "PercentInFavor") double percentInFavor,
      @JsonKey(name: "PercentAgainst") double percentAgainst,
      List<WebTokenVoteTopicVoteDataItem>? webVoteList});
}

/// @nodoc
class __$$_TokenVoteTopicCopyWithImpl<$Res>
    extends _$TokenVoteTopicCopyWithImpl<$Res, _$_TokenVoteTopic>
    implements _$$_TokenVoteTopicCopyWith<$Res> {
  __$$_TokenVoteTopicCopyWithImpl(
      _$_TokenVoteTopic _value, $Res Function(_$_TokenVoteTopic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? topicName = null,
    Object? topicDescription = null,
    Object? minimumVoteRequirement = null,
    Object? tokenHolderCount = null,
    Object? topicCreateDate = null,
    Object? votingEndDate = null,
    Object? blockHeight = null,
    Object? voteYes = null,
    Object? voteNo = null,
    Object? totalVotes = null,
    Object? percentVotesYes = null,
    Object? percentVotesNo = null,
    Object? percentInFavor = null,
    Object? percentAgainst = null,
    Object? webVoteList = freezed,
  }) {
    return _then(_$_TokenVoteTopic(
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      topicDescription: null == topicDescription
          ? _value.topicDescription
          : topicDescription // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as int,
      tokenHolderCount: null == tokenHolderCount
          ? _value.tokenHolderCount
          : tokenHolderCount // ignore: cast_nullable_to_non_nullable
              as int,
      topicCreateDate: null == topicCreateDate
          ? _value.topicCreateDate
          : topicCreateDate // ignore: cast_nullable_to_non_nullable
              as int,
      votingEndDate: null == votingEndDate
          ? _value.votingEndDate
          : votingEndDate // ignore: cast_nullable_to_non_nullable
              as int,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      voteYes: null == voteYes
          ? _value.voteYes
          : voteYes // ignore: cast_nullable_to_non_nullable
              as int,
      voteNo: null == voteNo
          ? _value.voteNo
          : voteNo // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as double,
      percentVotesYes: null == percentVotesYes
          ? _value.percentVotesYes
          : percentVotesYes // ignore: cast_nullable_to_non_nullable
              as double,
      percentVotesNo: null == percentVotesNo
          ? _value.percentVotesNo
          : percentVotesNo // ignore: cast_nullable_to_non_nullable
              as double,
      percentInFavor: null == percentInFavor
          ? _value.percentInFavor
          : percentInFavor // ignore: cast_nullable_to_non_nullable
              as double,
      percentAgainst: null == percentAgainst
          ? _value.percentAgainst
          : percentAgainst // ignore: cast_nullable_to_non_nullable
              as double,
      webVoteList: freezed == webVoteList
          ? _value._webVoteList
          : webVoteList // ignore: cast_nullable_to_non_nullable
              as List<WebTokenVoteTopicVoteDataItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenVoteTopic extends _TokenVoteTopic {
  _$_TokenVoteTopic(
      {@JsonKey(name: "SmartContractUID")
          required this.smartContractUid,
      @JsonKey(name: "TopicUID")
          required this.topicUid,
      @JsonKey(name: "TopicName")
          required this.topicName,
      @JsonKey(name: "TopicDescription")
          required this.topicDescription,
      @JsonKey(name: "MinimumVoteRequirement")
          required this.minimumVoteRequirement,
      @JsonKey(name: "TokenHolderCount")
          required this.tokenHolderCount,
      @JsonKey(name: "TopicCreateDate")
          required this.topicCreateDate,
      @JsonKey(name: "VotingEndDate")
          required this.votingEndDate,
      @JsonKey(name: "BlockHeight")
          required this.blockHeight,
      @JsonKey(name: "VoteYes")
          required this.voteYes,
      @JsonKey(name: "VoteNo")
          required this.voteNo,
      @JsonKey(name: "TotalVotes")
          required this.totalVotes,
      @JsonKey(name: "PercentVotesYes")
          required this.percentVotesYes,
      @JsonKey(name: "PercentVotesNo")
          required this.percentVotesNo,
      @JsonKey(name: "PercentInFavor")
          required this.percentInFavor,
      @JsonKey(name: "PercentAgainst")
          required this.percentAgainst,
      final List<WebTokenVoteTopicVoteDataItem>? webVoteList})
      : _webVoteList = webVoteList,
        super._();

  factory _$_TokenVoteTopic.fromJson(Map<String, dynamic> json) =>
      _$$_TokenVoteTopicFromJson(json);

  @override
  @JsonKey(name: "SmartContractUID")
  final String smartContractUid;
  @override
  @JsonKey(name: "TopicUID")
  final String topicUid;
  @override
  @JsonKey(name: "TopicName")
  final String topicName;
  @override
  @JsonKey(name: "TopicDescription")
  final String topicDescription;
  @override
  @JsonKey(name: "MinimumVoteRequirement")
  final int minimumVoteRequirement;
  @override
  @JsonKey(name: "TokenHolderCount")
  final int tokenHolderCount;
  @override
  @JsonKey(name: "TopicCreateDate")
  final int topicCreateDate;
  @override
  @JsonKey(name: "VotingEndDate")
  final int votingEndDate;
  @override
  @JsonKey(name: "BlockHeight")
  final int blockHeight;
  @override
  @JsonKey(name: "VoteYes")
  final int voteYes;
  @override
  @JsonKey(name: "VoteNo")
  final int voteNo;
  @override
  @JsonKey(name: "TotalVotes")
  final double totalVotes;
  @override
  @JsonKey(name: "PercentVotesYes")
  final double percentVotesYes;
  @override
  @JsonKey(name: "PercentVotesNo")
  final double percentVotesNo;
  @override
  @JsonKey(name: "PercentInFavor")
  final double percentInFavor;
  @override
  @JsonKey(name: "PercentAgainst")
  final double percentAgainst;
  final List<WebTokenVoteTopicVoteDataItem>? _webVoteList;
  @override
  List<WebTokenVoteTopicVoteDataItem>? get webVoteList {
    final value = _webVoteList;
    if (value == null) return null;
    if (_webVoteList is EqualUnmodifiableListView) return _webVoteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TokenVoteTopic(smartContractUid: $smartContractUid, topicUid: $topicUid, topicName: $topicName, topicDescription: $topicDescription, minimumVoteRequirement: $minimumVoteRequirement, tokenHolderCount: $tokenHolderCount, topicCreateDate: $topicCreateDate, votingEndDate: $votingEndDate, blockHeight: $blockHeight, voteYes: $voteYes, voteNo: $voteNo, totalVotes: $totalVotes, percentVotesYes: $percentVotesYes, percentVotesNo: $percentVotesNo, percentInFavor: $percentInFavor, percentAgainst: $percentAgainst, webVoteList: $webVoteList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenVoteTopic &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.topicUid, topicUid) ||
                other.topicUid == topicUid) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.topicDescription, topicDescription) ||
                other.topicDescription == topicDescription) &&
            (identical(other.minimumVoteRequirement, minimumVoteRequirement) ||
                other.minimumVoteRequirement == minimumVoteRequirement) &&
            (identical(other.tokenHolderCount, tokenHolderCount) ||
                other.tokenHolderCount == tokenHolderCount) &&
            (identical(other.topicCreateDate, topicCreateDate) ||
                other.topicCreateDate == topicCreateDate) &&
            (identical(other.votingEndDate, votingEndDate) ||
                other.votingEndDate == votingEndDate) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.voteYes, voteYes) || other.voteYes == voteYes) &&
            (identical(other.voteNo, voteNo) || other.voteNo == voteNo) &&
            (identical(other.totalVotes, totalVotes) ||
                other.totalVotes == totalVotes) &&
            (identical(other.percentVotesYes, percentVotesYes) ||
                other.percentVotesYes == percentVotesYes) &&
            (identical(other.percentVotesNo, percentVotesNo) ||
                other.percentVotesNo == percentVotesNo) &&
            (identical(other.percentInFavor, percentInFavor) ||
                other.percentInFavor == percentInFavor) &&
            (identical(other.percentAgainst, percentAgainst) ||
                other.percentAgainst == percentAgainst) &&
            const DeepCollectionEquality()
                .equals(other._webVoteList, _webVoteList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      smartContractUid,
      topicUid,
      topicName,
      topicDescription,
      minimumVoteRequirement,
      tokenHolderCount,
      topicCreateDate,
      votingEndDate,
      blockHeight,
      voteYes,
      voteNo,
      totalVotes,
      percentVotesYes,
      percentVotesNo,
      percentInFavor,
      percentAgainst,
      const DeepCollectionEquality().hash(_webVoteList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenVoteTopicCopyWith<_$_TokenVoteTopic> get copyWith =>
      __$$_TokenVoteTopicCopyWithImpl<_$_TokenVoteTopic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenVoteTopicToJson(
      this,
    );
  }
}

abstract class _TokenVoteTopic extends TokenVoteTopic {
  factory _TokenVoteTopic(
          {@JsonKey(name: "SmartContractUID")
              required final String smartContractUid,
          @JsonKey(name: "TopicUID")
              required final String topicUid,
          @JsonKey(name: "TopicName")
              required final String topicName,
          @JsonKey(name: "TopicDescription")
              required final String topicDescription,
          @JsonKey(name: "MinimumVoteRequirement")
              required final int minimumVoteRequirement,
          @JsonKey(name: "TokenHolderCount")
              required final int tokenHolderCount,
          @JsonKey(name: "TopicCreateDate")
              required final int topicCreateDate,
          @JsonKey(name: "VotingEndDate")
              required final int votingEndDate,
          @JsonKey(name: "BlockHeight")
              required final int blockHeight,
          @JsonKey(name: "VoteYes")
              required final int voteYes,
          @JsonKey(name: "VoteNo")
              required final int voteNo,
          @JsonKey(name: "TotalVotes")
              required final double totalVotes,
          @JsonKey(name: "PercentVotesYes")
              required final double percentVotesYes,
          @JsonKey(name: "PercentVotesNo")
              required final double percentVotesNo,
          @JsonKey(name: "PercentInFavor")
              required final double percentInFavor,
          @JsonKey(name: "PercentAgainst")
              required final double percentAgainst,
          final List<WebTokenVoteTopicVoteDataItem>? webVoteList}) =
      _$_TokenVoteTopic;
  _TokenVoteTopic._() : super._();

  factory _TokenVoteTopic.fromJson(Map<String, dynamic> json) =
      _$_TokenVoteTopic.fromJson;

  @override
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid;
  @override
  @JsonKey(name: "TopicUID")
  String get topicUid;
  @override
  @JsonKey(name: "TopicName")
  String get topicName;
  @override
  @JsonKey(name: "TopicDescription")
  String get topicDescription;
  @override
  @JsonKey(name: "MinimumVoteRequirement")
  int get minimumVoteRequirement;
  @override
  @JsonKey(name: "TokenHolderCount")
  int get tokenHolderCount;
  @override
  @JsonKey(name: "TopicCreateDate")
  int get topicCreateDate;
  @override
  @JsonKey(name: "VotingEndDate")
  int get votingEndDate;
  @override
  @JsonKey(name: "BlockHeight")
  int get blockHeight;
  @override
  @JsonKey(name: "VoteYes")
  int get voteYes;
  @override
  @JsonKey(name: "VoteNo")
  int get voteNo;
  @override
  @JsonKey(name: "TotalVotes")
  double get totalVotes;
  @override
  @JsonKey(name: "PercentVotesYes")
  double get percentVotesYes;
  @override
  @JsonKey(name: "PercentVotesNo")
  double get percentVotesNo;
  @override
  @JsonKey(name: "PercentInFavor")
  double get percentInFavor;
  @override
  @JsonKey(name: "PercentAgainst")
  double get percentAgainst;
  @override
  List<WebTokenVoteTopicVoteDataItem>? get webVoteList;
  @override
  @JsonKey(ignore: true)
  _$$_TokenVoteTopicCopyWith<_$_TokenVoteTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

WebTokenVoteTopicVoteDataItem _$WebTokenVoteTopicVoteDataItemFromJson(
    Map<String, dynamic> json) {
  return _WebTokenVoteTopicVoteDataItem.fromJson(json);
}

/// @nodoc
mixin _$WebTokenVoteTopicVoteDataItem {
  String get address => throw _privateConstructorUsedError;
  bool get value => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebTokenVoteTopicVoteDataItemCopyWith<WebTokenVoteTopicVoteDataItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebTokenVoteTopicVoteDataItemCopyWith<$Res> {
  factory $WebTokenVoteTopicVoteDataItemCopyWith(
          WebTokenVoteTopicVoteDataItem value,
          $Res Function(WebTokenVoteTopicVoteDataItem) then) =
      _$WebTokenVoteTopicVoteDataItemCopyWithImpl<$Res,
          WebTokenVoteTopicVoteDataItem>;
  @useResult
  $Res call(
      {String address,
      bool value,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$WebTokenVoteTopicVoteDataItemCopyWithImpl<$Res,
        $Val extends WebTokenVoteTopicVoteDataItem>
    implements $WebTokenVoteTopicVoteDataItemCopyWith<$Res> {
  _$WebTokenVoteTopicVoteDataItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? value = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebTokenVoteTopicVoteDataItemCopyWith<$Res>
    implements $WebTokenVoteTopicVoteDataItemCopyWith<$Res> {
  factory _$$_WebTokenVoteTopicVoteDataItemCopyWith(
          _$_WebTokenVoteTopicVoteDataItem value,
          $Res Function(_$_WebTokenVoteTopicVoteDataItem) then) =
      __$$_WebTokenVoteTopicVoteDataItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      bool value,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$_WebTokenVoteTopicVoteDataItemCopyWithImpl<$Res>
    extends _$WebTokenVoteTopicVoteDataItemCopyWithImpl<$Res,
        _$_WebTokenVoteTopicVoteDataItem>
    implements _$$_WebTokenVoteTopicVoteDataItemCopyWith<$Res> {
  __$$_WebTokenVoteTopicVoteDataItemCopyWithImpl(
      _$_WebTokenVoteTopicVoteDataItem _value,
      $Res Function(_$_WebTokenVoteTopicVoteDataItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? value = null,
    Object? createdAt = null,
  }) {
    return _then(_$_WebTokenVoteTopicVoteDataItem(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebTokenVoteTopicVoteDataItem extends _WebTokenVoteTopicVoteDataItem {
  _$_WebTokenVoteTopicVoteDataItem(
      {required this.address,
      required this.value,
      @JsonKey(name: "created_at") required this.createdAt})
      : super._();

  factory _$_WebTokenVoteTopicVoteDataItem.fromJson(
          Map<String, dynamic> json) =>
      _$$_WebTokenVoteTopicVoteDataItemFromJson(json);

  @override
  final String address;
  @override
  final bool value;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'WebTokenVoteTopicVoteDataItem(address: $address, value: $value, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebTokenVoteTopicVoteDataItem &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, value, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebTokenVoteTopicVoteDataItemCopyWith<_$_WebTokenVoteTopicVoteDataItem>
      get copyWith => __$$_WebTokenVoteTopicVoteDataItemCopyWithImpl<
          _$_WebTokenVoteTopicVoteDataItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebTokenVoteTopicVoteDataItemToJson(
      this,
    );
  }
}

abstract class _WebTokenVoteTopicVoteDataItem
    extends WebTokenVoteTopicVoteDataItem {
  factory _WebTokenVoteTopicVoteDataItem(
          {required final String address,
          required final bool value,
          @JsonKey(name: "created_at") required final DateTime createdAt}) =
      _$_WebTokenVoteTopicVoteDataItem;
  _WebTokenVoteTopicVoteDataItem._() : super._();

  factory _WebTokenVoteTopicVoteDataItem.fromJson(Map<String, dynamic> json) =
      _$_WebTokenVoteTopicVoteDataItem.fromJson;

  @override
  String get address;
  @override
  bool get value;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_WebTokenVoteTopicVoteDataItemCopyWith<_$_WebTokenVoteTopicVoteDataItem>
      get copyWith => throw _privateConstructorUsedError;
}

WebTokenVoteTopicVoteData _$WebTokenVoteTopicVoteDataFromJson(
    Map<String, dynamic> json) {
  return _WebTokenVoteTopicVoteData.fromJson(json);
}

/// @nodoc
mixin _$WebTokenVoteTopicVoteData {
  List<WebTokenVoteTopicVoteDataItem> get votes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "vote_yes")
  int get voteYes => throw _privateConstructorUsedError;
  @JsonKey(name: "vote_no")
  int get voteNo => throw _privateConstructorUsedError;
  @JsonKey(name: "total_votes")
  int get totalVotes => throw _privateConstructorUsedError;
  @JsonKey(name: "percent_yes")
  double get percentYes => throw _privateConstructorUsedError;
  @JsonKey(name: "percent_no")
  double get percentNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebTokenVoteTopicVoteDataCopyWith<WebTokenVoteTopicVoteData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebTokenVoteTopicVoteDataCopyWith<$Res> {
  factory $WebTokenVoteTopicVoteDataCopyWith(WebTokenVoteTopicVoteData value,
          $Res Function(WebTokenVoteTopicVoteData) then) =
      _$WebTokenVoteTopicVoteDataCopyWithImpl<$Res, WebTokenVoteTopicVoteData>;
  @useResult
  $Res call(
      {List<WebTokenVoteTopicVoteDataItem> votes,
      @JsonKey(name: "vote_yes") int voteYes,
      @JsonKey(name: "vote_no") int voteNo,
      @JsonKey(name: "total_votes") int totalVotes,
      @JsonKey(name: "percent_yes") double percentYes,
      @JsonKey(name: "percent_no") double percentNo});
}

/// @nodoc
class _$WebTokenVoteTopicVoteDataCopyWithImpl<$Res,
        $Val extends WebTokenVoteTopicVoteData>
    implements $WebTokenVoteTopicVoteDataCopyWith<$Res> {
  _$WebTokenVoteTopicVoteDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? votes = null,
    Object? voteYes = null,
    Object? voteNo = null,
    Object? totalVotes = null,
    Object? percentYes = null,
    Object? percentNo = null,
  }) {
    return _then(_value.copyWith(
      votes: null == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<WebTokenVoteTopicVoteDataItem>,
      voteYes: null == voteYes
          ? _value.voteYes
          : voteYes // ignore: cast_nullable_to_non_nullable
              as int,
      voteNo: null == voteNo
          ? _value.voteNo
          : voteNo // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int,
      percentYes: null == percentYes
          ? _value.percentYes
          : percentYes // ignore: cast_nullable_to_non_nullable
              as double,
      percentNo: null == percentNo
          ? _value.percentNo
          : percentNo // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebTokenVoteTopicVoteDataCopyWith<$Res>
    implements $WebTokenVoteTopicVoteDataCopyWith<$Res> {
  factory _$$_WebTokenVoteTopicVoteDataCopyWith(
          _$_WebTokenVoteTopicVoteData value,
          $Res Function(_$_WebTokenVoteTopicVoteData) then) =
      __$$_WebTokenVoteTopicVoteDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WebTokenVoteTopicVoteDataItem> votes,
      @JsonKey(name: "vote_yes") int voteYes,
      @JsonKey(name: "vote_no") int voteNo,
      @JsonKey(name: "total_votes") int totalVotes,
      @JsonKey(name: "percent_yes") double percentYes,
      @JsonKey(name: "percent_no") double percentNo});
}

/// @nodoc
class __$$_WebTokenVoteTopicVoteDataCopyWithImpl<$Res>
    extends _$WebTokenVoteTopicVoteDataCopyWithImpl<$Res,
        _$_WebTokenVoteTopicVoteData>
    implements _$$_WebTokenVoteTopicVoteDataCopyWith<$Res> {
  __$$_WebTokenVoteTopicVoteDataCopyWithImpl(
      _$_WebTokenVoteTopicVoteData _value,
      $Res Function(_$_WebTokenVoteTopicVoteData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? votes = null,
    Object? voteYes = null,
    Object? voteNo = null,
    Object? totalVotes = null,
    Object? percentYes = null,
    Object? percentNo = null,
  }) {
    return _then(_$_WebTokenVoteTopicVoteData(
      votes: null == votes
          ? _value._votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<WebTokenVoteTopicVoteDataItem>,
      voteYes: null == voteYes
          ? _value.voteYes
          : voteYes // ignore: cast_nullable_to_non_nullable
              as int,
      voteNo: null == voteNo
          ? _value.voteNo
          : voteNo // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int,
      percentYes: null == percentYes
          ? _value.percentYes
          : percentYes // ignore: cast_nullable_to_non_nullable
              as double,
      percentNo: null == percentNo
          ? _value.percentNo
          : percentNo // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebTokenVoteTopicVoteData extends _WebTokenVoteTopicVoteData {
  _$_WebTokenVoteTopicVoteData(
      {required final List<WebTokenVoteTopicVoteDataItem> votes,
      @JsonKey(name: "vote_yes") required this.voteYes,
      @JsonKey(name: "vote_no") required this.voteNo,
      @JsonKey(name: "total_votes") required this.totalVotes,
      @JsonKey(name: "percent_yes") required this.percentYes,
      @JsonKey(name: "percent_no") required this.percentNo})
      : _votes = votes,
        super._();

  factory _$_WebTokenVoteTopicVoteData.fromJson(Map<String, dynamic> json) =>
      _$$_WebTokenVoteTopicVoteDataFromJson(json);

  final List<WebTokenVoteTopicVoteDataItem> _votes;
  @override
  List<WebTokenVoteTopicVoteDataItem> get votes {
    if (_votes is EqualUnmodifiableListView) return _votes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_votes);
  }

  @override
  @JsonKey(name: "vote_yes")
  final int voteYes;
  @override
  @JsonKey(name: "vote_no")
  final int voteNo;
  @override
  @JsonKey(name: "total_votes")
  final int totalVotes;
  @override
  @JsonKey(name: "percent_yes")
  final double percentYes;
  @override
  @JsonKey(name: "percent_no")
  final double percentNo;

  @override
  String toString() {
    return 'WebTokenVoteTopicVoteData(votes: $votes, voteYes: $voteYes, voteNo: $voteNo, totalVotes: $totalVotes, percentYes: $percentYes, percentNo: $percentNo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebTokenVoteTopicVoteData &&
            const DeepCollectionEquality().equals(other._votes, _votes) &&
            (identical(other.voteYes, voteYes) || other.voteYes == voteYes) &&
            (identical(other.voteNo, voteNo) || other.voteNo == voteNo) &&
            (identical(other.totalVotes, totalVotes) ||
                other.totalVotes == totalVotes) &&
            (identical(other.percentYes, percentYes) ||
                other.percentYes == percentYes) &&
            (identical(other.percentNo, percentNo) ||
                other.percentNo == percentNo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_votes),
      voteYes,
      voteNo,
      totalVotes,
      percentYes,
      percentNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebTokenVoteTopicVoteDataCopyWith<_$_WebTokenVoteTopicVoteData>
      get copyWith => __$$_WebTokenVoteTopicVoteDataCopyWithImpl<
          _$_WebTokenVoteTopicVoteData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebTokenVoteTopicVoteDataToJson(
      this,
    );
  }
}

abstract class _WebTokenVoteTopicVoteData extends WebTokenVoteTopicVoteData {
  factory _WebTokenVoteTopicVoteData(
          {required final List<WebTokenVoteTopicVoteDataItem> votes,
          @JsonKey(name: "vote_yes") required final int voteYes,
          @JsonKey(name: "vote_no") required final int voteNo,
          @JsonKey(name: "total_votes") required final int totalVotes,
          @JsonKey(name: "percent_yes") required final double percentYes,
          @JsonKey(name: "percent_no") required final double percentNo}) =
      _$_WebTokenVoteTopicVoteData;
  _WebTokenVoteTopicVoteData._() : super._();

  factory _WebTokenVoteTopicVoteData.fromJson(Map<String, dynamic> json) =
      _$_WebTokenVoteTopicVoteData.fromJson;

  @override
  List<WebTokenVoteTopicVoteDataItem> get votes;
  @override
  @JsonKey(name: "vote_yes")
  int get voteYes;
  @override
  @JsonKey(name: "vote_no")
  int get voteNo;
  @override
  @JsonKey(name: "total_votes")
  int get totalVotes;
  @override
  @JsonKey(name: "percent_yes")
  double get percentYes;
  @override
  @JsonKey(name: "percent_no")
  double get percentNo;
  @override
  @JsonKey(ignore: true)
  _$$_WebTokenVoteTopicVoteDataCopyWith<_$_WebTokenVoteTopicVoteData>
      get copyWith => throw _privateConstructorUsedError;
}

WebTokenVoteTopic _$WebTokenVoteTopicFromJson(Map<String, dynamic> json) {
  return _WebTokenVoteTopic.fromJson(json);
}

/// @nodoc
mixin _$WebTokenVoteTopic {
  @JsonKey(name: "sc_identifier")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "topic_id")
  String get topicUid => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get topicName => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get topicDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "vote_requirement")
  double get minimumVoteRequirement => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get topicCreateDate => throw _privateConstructorUsedError;
  @JsonKey(name: "voting_ends_at")
  DateTime get votingEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: "vote_data")
  WebTokenVoteTopicVoteData get voteData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebTokenVoteTopicCopyWith<WebTokenVoteTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebTokenVoteTopicCopyWith<$Res> {
  factory $WebTokenVoteTopicCopyWith(
          WebTokenVoteTopic value, $Res Function(WebTokenVoteTopic) then) =
      _$WebTokenVoteTopicCopyWithImpl<$Res, WebTokenVoteTopic>;
  @useResult
  $Res call(
      {@JsonKey(name: "sc_identifier") String smartContractUid,
      @JsonKey(name: "topic_id") String topicUid,
      @JsonKey(name: "name") String topicName,
      @JsonKey(name: "description") String topicDescription,
      @JsonKey(name: "vote_requirement") double minimumVoteRequirement,
      @JsonKey(name: "created_at") DateTime topicCreateDate,
      @JsonKey(name: "voting_ends_at") DateTime votingEndDate,
      @JsonKey(name: "vote_data") WebTokenVoteTopicVoteData voteData});

  $WebTokenVoteTopicVoteDataCopyWith<$Res> get voteData;
}

/// @nodoc
class _$WebTokenVoteTopicCopyWithImpl<$Res, $Val extends WebTokenVoteTopic>
    implements $WebTokenVoteTopicCopyWith<$Res> {
  _$WebTokenVoteTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? topicName = null,
    Object? topicDescription = null,
    Object? minimumVoteRequirement = null,
    Object? topicCreateDate = null,
    Object? votingEndDate = null,
    Object? voteData = null,
  }) {
    return _then(_value.copyWith(
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      topicDescription: null == topicDescription
          ? _value.topicDescription
          : topicDescription // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      topicCreateDate: null == topicCreateDate
          ? _value.topicCreateDate
          : topicCreateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      votingEndDate: null == votingEndDate
          ? _value.votingEndDate
          : votingEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      voteData: null == voteData
          ? _value.voteData
          : voteData // ignore: cast_nullable_to_non_nullable
              as WebTokenVoteTopicVoteData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WebTokenVoteTopicVoteDataCopyWith<$Res> get voteData {
    return $WebTokenVoteTopicVoteDataCopyWith<$Res>(_value.voteData, (value) {
      return _then(_value.copyWith(voteData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WebTokenVoteTopicCopyWith<$Res>
    implements $WebTokenVoteTopicCopyWith<$Res> {
  factory _$$_WebTokenVoteTopicCopyWith(_$_WebTokenVoteTopic value,
          $Res Function(_$_WebTokenVoteTopic) then) =
      __$$_WebTokenVoteTopicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "sc_identifier") String smartContractUid,
      @JsonKey(name: "topic_id") String topicUid,
      @JsonKey(name: "name") String topicName,
      @JsonKey(name: "description") String topicDescription,
      @JsonKey(name: "vote_requirement") double minimumVoteRequirement,
      @JsonKey(name: "created_at") DateTime topicCreateDate,
      @JsonKey(name: "voting_ends_at") DateTime votingEndDate,
      @JsonKey(name: "vote_data") WebTokenVoteTopicVoteData voteData});

  @override
  $WebTokenVoteTopicVoteDataCopyWith<$Res> get voteData;
}

/// @nodoc
class __$$_WebTokenVoteTopicCopyWithImpl<$Res>
    extends _$WebTokenVoteTopicCopyWithImpl<$Res, _$_WebTokenVoteTopic>
    implements _$$_WebTokenVoteTopicCopyWith<$Res> {
  __$$_WebTokenVoteTopicCopyWithImpl(
      _$_WebTokenVoteTopic _value, $Res Function(_$_WebTokenVoteTopic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? topicName = null,
    Object? topicDescription = null,
    Object? minimumVoteRequirement = null,
    Object? topicCreateDate = null,
    Object? votingEndDate = null,
    Object? voteData = null,
  }) {
    return _then(_$_WebTokenVoteTopic(
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      topicDescription: null == topicDescription
          ? _value.topicDescription
          : topicDescription // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      topicCreateDate: null == topicCreateDate
          ? _value.topicCreateDate
          : topicCreateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      votingEndDate: null == votingEndDate
          ? _value.votingEndDate
          : votingEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      voteData: null == voteData
          ? _value.voteData
          : voteData // ignore: cast_nullable_to_non_nullable
              as WebTokenVoteTopicVoteData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebTokenVoteTopic extends _WebTokenVoteTopic {
  _$_WebTokenVoteTopic(
      {@JsonKey(name: "sc_identifier") required this.smartContractUid,
      @JsonKey(name: "topic_id") required this.topicUid,
      @JsonKey(name: "name") required this.topicName,
      @JsonKey(name: "description") required this.topicDescription,
      @JsonKey(name: "vote_requirement") required this.minimumVoteRequirement,
      @JsonKey(name: "created_at") required this.topicCreateDate,
      @JsonKey(name: "voting_ends_at") required this.votingEndDate,
      @JsonKey(name: "vote_data") required this.voteData})
      : super._();

  factory _$_WebTokenVoteTopic.fromJson(Map<String, dynamic> json) =>
      _$$_WebTokenVoteTopicFromJson(json);

  @override
  @JsonKey(name: "sc_identifier")
  final String smartContractUid;
  @override
  @JsonKey(name: "topic_id")
  final String topicUid;
  @override
  @JsonKey(name: "name")
  final String topicName;
  @override
  @JsonKey(name: "description")
  final String topicDescription;
  @override
  @JsonKey(name: "vote_requirement")
  final double minimumVoteRequirement;
  @override
  @JsonKey(name: "created_at")
  final DateTime topicCreateDate;
  @override
  @JsonKey(name: "voting_ends_at")
  final DateTime votingEndDate;
  @override
  @JsonKey(name: "vote_data")
  final WebTokenVoteTopicVoteData voteData;

  @override
  String toString() {
    return 'WebTokenVoteTopic(smartContractUid: $smartContractUid, topicUid: $topicUid, topicName: $topicName, topicDescription: $topicDescription, minimumVoteRequirement: $minimumVoteRequirement, topicCreateDate: $topicCreateDate, votingEndDate: $votingEndDate, voteData: $voteData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebTokenVoteTopic &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.topicUid, topicUid) ||
                other.topicUid == topicUid) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.topicDescription, topicDescription) ||
                other.topicDescription == topicDescription) &&
            (identical(other.minimumVoteRequirement, minimumVoteRequirement) ||
                other.minimumVoteRequirement == minimumVoteRequirement) &&
            (identical(other.topicCreateDate, topicCreateDate) ||
                other.topicCreateDate == topicCreateDate) &&
            (identical(other.votingEndDate, votingEndDate) ||
                other.votingEndDate == votingEndDate) &&
            (identical(other.voteData, voteData) ||
                other.voteData == voteData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      smartContractUid,
      topicUid,
      topicName,
      topicDescription,
      minimumVoteRequirement,
      topicCreateDate,
      votingEndDate,
      voteData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebTokenVoteTopicCopyWith<_$_WebTokenVoteTopic> get copyWith =>
      __$$_WebTokenVoteTopicCopyWithImpl<_$_WebTokenVoteTopic>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebTokenVoteTopicToJson(
      this,
    );
  }
}

abstract class _WebTokenVoteTopic extends WebTokenVoteTopic {
  factory _WebTokenVoteTopic(
          {@JsonKey(name: "sc_identifier")
              required final String smartContractUid,
          @JsonKey(name: "topic_id")
              required final String topicUid,
          @JsonKey(name: "name")
              required final String topicName,
          @JsonKey(name: "description")
              required final String topicDescription,
          @JsonKey(name: "vote_requirement")
              required final double minimumVoteRequirement,
          @JsonKey(name: "created_at")
              required final DateTime topicCreateDate,
          @JsonKey(name: "voting_ends_at")
              required final DateTime votingEndDate,
          @JsonKey(name: "vote_data")
              required final WebTokenVoteTopicVoteData voteData}) =
      _$_WebTokenVoteTopic;
  _WebTokenVoteTopic._() : super._();

  factory _WebTokenVoteTopic.fromJson(Map<String, dynamic> json) =
      _$_WebTokenVoteTopic.fromJson;

  @override
  @JsonKey(name: "sc_identifier")
  String get smartContractUid;
  @override
  @JsonKey(name: "topic_id")
  String get topicUid;
  @override
  @JsonKey(name: "name")
  String get topicName;
  @override
  @JsonKey(name: "description")
  String get topicDescription;
  @override
  @JsonKey(name: "vote_requirement")
  double get minimumVoteRequirement;
  @override
  @JsonKey(name: "created_at")
  DateTime get topicCreateDate;
  @override
  @JsonKey(name: "voting_ends_at")
  DateTime get votingEndDate;
  @override
  @JsonKey(name: "vote_data")
  WebTokenVoteTopicVoteData get voteData;
  @override
  @JsonKey(ignore: true)
  _$$_WebTokenVoteTopicCopyWith<_$_WebTokenVoteTopic> get copyWith =>
      throw _privateConstructorUsedError;
}
