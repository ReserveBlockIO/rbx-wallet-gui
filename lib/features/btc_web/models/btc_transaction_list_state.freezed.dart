// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_transaction_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BtcTransactionListState {
  bool get processing => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  List<BtcWebTransaction> get results => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BtcTransactionListStateCopyWith<BtcTransactionListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcTransactionListStateCopyWith<$Res> {
  factory $BtcTransactionListStateCopyWith(BtcTransactionListState value,
          $Res Function(BtcTransactionListState) then) =
      _$BtcTransactionListStateCopyWithImpl<$Res, BtcTransactionListState>;
  @useResult
  $Res call(
      {bool processing, bool canLoadMore, List<BtcWebTransaction> results});
}

/// @nodoc
class _$BtcTransactionListStateCopyWithImpl<$Res,
        $Val extends BtcTransactionListState>
    implements $BtcTransactionListStateCopyWith<$Res> {
  _$BtcTransactionListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processing = null,
    Object? canLoadMore = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      processing: null == processing
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<BtcWebTransaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcTransactionListStateCopyWith<$Res>
    implements $BtcTransactionListStateCopyWith<$Res> {
  factory _$$_BtcTransactionListStateCopyWith(_$_BtcTransactionListState value,
          $Res Function(_$_BtcTransactionListState) then) =
      __$$_BtcTransactionListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool processing, bool canLoadMore, List<BtcWebTransaction> results});
}

/// @nodoc
class __$$_BtcTransactionListStateCopyWithImpl<$Res>
    extends _$BtcTransactionListStateCopyWithImpl<$Res,
        _$_BtcTransactionListState>
    implements _$$_BtcTransactionListStateCopyWith<$Res> {
  __$$_BtcTransactionListStateCopyWithImpl(_$_BtcTransactionListState _value,
      $Res Function(_$_BtcTransactionListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processing = null,
    Object? canLoadMore = null,
    Object? results = null,
  }) {
    return _then(_$_BtcTransactionListState(
      processing: null == processing
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<BtcWebTransaction>,
    ));
  }
}

/// @nodoc

class _$_BtcTransactionListState extends _BtcTransactionListState {
  _$_BtcTransactionListState(
      {this.processing = false,
      this.canLoadMore = false,
      final List<BtcWebTransaction> results = const []})
      : _results = results,
        super._();

  @override
  @JsonKey()
  final bool processing;
  @override
  @JsonKey()
  final bool canLoadMore;
  final List<BtcWebTransaction> _results;
  @override
  @JsonKey()
  List<BtcWebTransaction> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'BtcTransactionListState(processing: $processing, canLoadMore: $canLoadMore, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcTransactionListState &&
            (identical(other.processing, processing) ||
                other.processing == processing) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode => Object.hash(runtimeType, processing, canLoadMore,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcTransactionListStateCopyWith<_$_BtcTransactionListState>
      get copyWith =>
          __$$_BtcTransactionListStateCopyWithImpl<_$_BtcTransactionListState>(
              this, _$identity);
}

abstract class _BtcTransactionListState extends BtcTransactionListState {
  factory _BtcTransactionListState(
      {final bool processing,
      final bool canLoadMore,
      final List<BtcWebTransaction> results}) = _$_BtcTransactionListState;
  _BtcTransactionListState._() : super._();

  @override
  bool get processing;
  @override
  bool get canLoadMore;
  @override
  List<BtcWebTransaction> get results;
  @override
  @JsonKey(ignore: true)
  _$$_BtcTransactionListStateCopyWith<_$_BtcTransactionListState>
      get copyWith => throw _privateConstructorUsedError;
}
