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
mixin _$WebBtcTransactionListState {
  bool get processing => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  List<BtcWebTransaction> get results => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebBtcTransactionListStateCopyWith<WebBtcTransactionListState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebBtcTransactionListStateCopyWith<$Res> {
  factory $WebBtcTransactionListStateCopyWith(WebBtcTransactionListState value,
          $Res Function(WebBtcTransactionListState) then) =
      _$WebBtcTransactionListStateCopyWithImpl<$Res,
          WebBtcTransactionListState>;
  @useResult
  $Res call(
      {bool processing, bool canLoadMore, List<BtcWebTransaction> results});
}

/// @nodoc
class _$WebBtcTransactionListStateCopyWithImpl<$Res,
        $Val extends WebBtcTransactionListState>
    implements $WebBtcTransactionListStateCopyWith<$Res> {
  _$WebBtcTransactionListStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_WebBtcTransactionListStateCopyWith<$Res>
    implements $WebBtcTransactionListStateCopyWith<$Res> {
  factory _$$_WebBtcTransactionListStateCopyWith(
          _$_WebBtcTransactionListState value,
          $Res Function(_$_WebBtcTransactionListState) then) =
      __$$_WebBtcTransactionListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool processing, bool canLoadMore, List<BtcWebTransaction> results});
}

/// @nodoc
class __$$_WebBtcTransactionListStateCopyWithImpl<$Res>
    extends _$WebBtcTransactionListStateCopyWithImpl<$Res,
        _$_WebBtcTransactionListState>
    implements _$$_WebBtcTransactionListStateCopyWith<$Res> {
  __$$_WebBtcTransactionListStateCopyWithImpl(
      _$_WebBtcTransactionListState _value,
      $Res Function(_$_WebBtcTransactionListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processing = null,
    Object? canLoadMore = null,
    Object? results = null,
  }) {
    return _then(_$_WebBtcTransactionListState(
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

class _$_WebBtcTransactionListState extends _WebBtcTransactionListState {
  _$_WebBtcTransactionListState(
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
    return 'WebBtcTransactionListState(processing: $processing, canLoadMore: $canLoadMore, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebBtcTransactionListState &&
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
  _$$_WebBtcTransactionListStateCopyWith<_$_WebBtcTransactionListState>
      get copyWith => __$$_WebBtcTransactionListStateCopyWithImpl<
          _$_WebBtcTransactionListState>(this, _$identity);
}

abstract class _WebBtcTransactionListState extends WebBtcTransactionListState {
  factory _WebBtcTransactionListState(
      {final bool processing,
      final bool canLoadMore,
      final List<BtcWebTransaction> results}) = _$_WebBtcTransactionListState;
  _WebBtcTransactionListState._() : super._();

  @override
  bool get processing;
  @override
  bool get canLoadMore;
  @override
  List<BtcWebTransaction> get results;
  @override
  @JsonKey(ignore: true)
  _$$_WebBtcTransactionListStateCopyWith<_$_WebBtcTransactionListState>
      get copyWith => throw _privateConstructorUsedError;
}
