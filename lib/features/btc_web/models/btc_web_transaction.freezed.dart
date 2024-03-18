// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_web_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BtcWebTxInput _$BtcWebTxInputFromJson(Map<String, dynamic> json) {
  return _BtcWebTxInput.fromJson(json);
}

/// @nodoc
mixin _$BtcWebTxInput {
  @JsonKey(name: "prev_hash")
  String get prevHash => throw _privateConstructorUsedError;
  @JsonKey(name: "output_index")
  int get outputIndex => throw _privateConstructorUsedError;
  @JsonKey(name: "output_value")
  int get outputValue => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;
  List<String> get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: "script_type")
  String get scriptType => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  List<String> get witness => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWebTxInputCopyWith<BtcWebTxInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWebTxInputCopyWith<$Res> {
  factory $BtcWebTxInputCopyWith(
          BtcWebTxInput value, $Res Function(BtcWebTxInput) then) =
      _$BtcWebTxInputCopyWithImpl<$Res, BtcWebTxInput>;
  @useResult
  $Res call(
      {@JsonKey(name: "prev_hash") String prevHash,
      @JsonKey(name: "output_index") int outputIndex,
      @JsonKey(name: "output_value") int outputValue,
      int sequence,
      List<String> addresses,
      @JsonKey(name: "script_type") String scriptType,
      int age,
      List<String> witness});
}

/// @nodoc
class _$BtcWebTxInputCopyWithImpl<$Res, $Val extends BtcWebTxInput>
    implements $BtcWebTxInputCopyWith<$Res> {
  _$BtcWebTxInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prevHash = null,
    Object? outputIndex = null,
    Object? outputValue = null,
    Object? sequence = null,
    Object? addresses = null,
    Object? scriptType = null,
    Object? age = null,
    Object? witness = null,
  }) {
    return _then(_value.copyWith(
      prevHash: null == prevHash
          ? _value.prevHash
          : prevHash // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _value.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      outputValue: null == outputValue
          ? _value.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as int,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scriptType: null == scriptType
          ? _value.scriptType
          : scriptType // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      witness: null == witness
          ? _value.witness
          : witness // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcWebTxInputCopyWith<$Res>
    implements $BtcWebTxInputCopyWith<$Res> {
  factory _$$_BtcWebTxInputCopyWith(
          _$_BtcWebTxInput value, $Res Function(_$_BtcWebTxInput) then) =
      __$$_BtcWebTxInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "prev_hash") String prevHash,
      @JsonKey(name: "output_index") int outputIndex,
      @JsonKey(name: "output_value") int outputValue,
      int sequence,
      List<String> addresses,
      @JsonKey(name: "script_type") String scriptType,
      int age,
      List<String> witness});
}

/// @nodoc
class __$$_BtcWebTxInputCopyWithImpl<$Res>
    extends _$BtcWebTxInputCopyWithImpl<$Res, _$_BtcWebTxInput>
    implements _$$_BtcWebTxInputCopyWith<$Res> {
  __$$_BtcWebTxInputCopyWithImpl(
      _$_BtcWebTxInput _value, $Res Function(_$_BtcWebTxInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prevHash = null,
    Object? outputIndex = null,
    Object? outputValue = null,
    Object? sequence = null,
    Object? addresses = null,
    Object? scriptType = null,
    Object? age = null,
    Object? witness = null,
  }) {
    return _then(_$_BtcWebTxInput(
      prevHash: null == prevHash
          ? _value.prevHash
          : prevHash // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _value.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      outputValue: null == outputValue
          ? _value.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as int,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scriptType: null == scriptType
          ? _value.scriptType
          : scriptType // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      witness: null == witness
          ? _value._witness
          : witness // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWebTxInput extends _BtcWebTxInput {
  _$_BtcWebTxInput(
      {@JsonKey(name: "prev_hash") required this.prevHash,
      @JsonKey(name: "output_index") required this.outputIndex,
      @JsonKey(name: "output_value") required this.outputValue,
      required this.sequence,
      final List<String> addresses = const [],
      @JsonKey(name: "script_type") required this.scriptType,
      required this.age,
      final List<String> witness = const []})
      : _addresses = addresses,
        _witness = witness,
        super._();

  factory _$_BtcWebTxInput.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWebTxInputFromJson(json);

  @override
  @JsonKey(name: "prev_hash")
  final String prevHash;
  @override
  @JsonKey(name: "output_index")
  final int outputIndex;
  @override
  @JsonKey(name: "output_value")
  final int outputValue;
  @override
  final int sequence;
  final List<String> _addresses;
  @override
  @JsonKey()
  List<String> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  @JsonKey(name: "script_type")
  final String scriptType;
  @override
  final int age;
  final List<String> _witness;
  @override
  @JsonKey()
  List<String> get witness {
    if (_witness is EqualUnmodifiableListView) return _witness;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_witness);
  }

  @override
  String toString() {
    return 'BtcWebTxInput(prevHash: $prevHash, outputIndex: $outputIndex, outputValue: $outputValue, sequence: $sequence, addresses: $addresses, scriptType: $scriptType, age: $age, witness: $witness)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWebTxInput &&
            (identical(other.prevHash, prevHash) ||
                other.prevHash == prevHash) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.outputValue, outputValue) ||
                other.outputValue == outputValue) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.scriptType, scriptType) ||
                other.scriptType == scriptType) &&
            (identical(other.age, age) || other.age == age) &&
            const DeepCollectionEquality().equals(other._witness, _witness));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      prevHash,
      outputIndex,
      outputValue,
      sequence,
      const DeepCollectionEquality().hash(_addresses),
      scriptType,
      age,
      const DeepCollectionEquality().hash(_witness));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWebTxInputCopyWith<_$_BtcWebTxInput> get copyWith =>
      __$$_BtcWebTxInputCopyWithImpl<_$_BtcWebTxInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWebTxInputToJson(
      this,
    );
  }
}

abstract class _BtcWebTxInput extends BtcWebTxInput {
  factory _BtcWebTxInput(
      {@JsonKey(name: "prev_hash") required final String prevHash,
      @JsonKey(name: "output_index") required final int outputIndex,
      @JsonKey(name: "output_value") required final int outputValue,
      required final int sequence,
      final List<String> addresses,
      @JsonKey(name: "script_type") required final String scriptType,
      required final int age,
      final List<String> witness}) = _$_BtcWebTxInput;
  _BtcWebTxInput._() : super._();

  factory _BtcWebTxInput.fromJson(Map<String, dynamic> json) =
      _$_BtcWebTxInput.fromJson;

  @override
  @JsonKey(name: "prev_hash")
  String get prevHash;
  @override
  @JsonKey(name: "output_index")
  int get outputIndex;
  @override
  @JsonKey(name: "output_value")
  int get outputValue;
  @override
  int get sequence;
  @override
  List<String> get addresses;
  @override
  @JsonKey(name: "script_type")
  String get scriptType;
  @override
  int get age;
  @override
  List<String> get witness;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWebTxInputCopyWith<_$_BtcWebTxInput> get copyWith =>
      throw _privateConstructorUsedError;
}

BtcWebTxOutput _$BtcWebTxOutputFromJson(Map<String, dynamic> json) {
  return _BtcWebTxOutput.fromJson(json);
}

/// @nodoc
mixin _$BtcWebTxOutput {
  int get value => throw _privateConstructorUsedError;
  String get script => throw _privateConstructorUsedError;
  List<String> get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: "script_type")
  String get scriptType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWebTxOutputCopyWith<BtcWebTxOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWebTxOutputCopyWith<$Res> {
  factory $BtcWebTxOutputCopyWith(
          BtcWebTxOutput value, $Res Function(BtcWebTxOutput) then) =
      _$BtcWebTxOutputCopyWithImpl<$Res, BtcWebTxOutput>;
  @useResult
  $Res call(
      {int value,
      String script,
      List<String> addresses,
      @JsonKey(name: "script_type") String scriptType});
}

/// @nodoc
class _$BtcWebTxOutputCopyWithImpl<$Res, $Val extends BtcWebTxOutput>
    implements $BtcWebTxOutputCopyWith<$Res> {
  _$BtcWebTxOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? script = null,
    Object? addresses = null,
    Object? scriptType = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scriptType: null == scriptType
          ? _value.scriptType
          : scriptType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcWebTxOutputCopyWith<$Res>
    implements $BtcWebTxOutputCopyWith<$Res> {
  factory _$$_BtcWebTxOutputCopyWith(
          _$_BtcWebTxOutput value, $Res Function(_$_BtcWebTxOutput) then) =
      __$$_BtcWebTxOutputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int value,
      String script,
      List<String> addresses,
      @JsonKey(name: "script_type") String scriptType});
}

/// @nodoc
class __$$_BtcWebTxOutputCopyWithImpl<$Res>
    extends _$BtcWebTxOutputCopyWithImpl<$Res, _$_BtcWebTxOutput>
    implements _$$_BtcWebTxOutputCopyWith<$Res> {
  __$$_BtcWebTxOutputCopyWithImpl(
      _$_BtcWebTxOutput _value, $Res Function(_$_BtcWebTxOutput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? script = null,
    Object? addresses = null,
    Object? scriptType = null,
  }) {
    return _then(_$_BtcWebTxOutput(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scriptType: null == scriptType
          ? _value.scriptType
          : scriptType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWebTxOutput extends _BtcWebTxOutput {
  _$_BtcWebTxOutput(
      {required this.value,
      required this.script,
      final List<String> addresses = const [],
      @JsonKey(name: "script_type") required this.scriptType})
      : _addresses = addresses,
        super._();

  factory _$_BtcWebTxOutput.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWebTxOutputFromJson(json);

  @override
  final int value;
  @override
  final String script;
  final List<String> _addresses;
  @override
  @JsonKey()
  List<String> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  @JsonKey(name: "script_type")
  final String scriptType;

  @override
  String toString() {
    return 'BtcWebTxOutput(value: $value, script: $script, addresses: $addresses, scriptType: $scriptType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWebTxOutput &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.script, script) || other.script == script) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.scriptType, scriptType) ||
                other.scriptType == scriptType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, script,
      const DeepCollectionEquality().hash(_addresses), scriptType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWebTxOutputCopyWith<_$_BtcWebTxOutput> get copyWith =>
      __$$_BtcWebTxOutputCopyWithImpl<_$_BtcWebTxOutput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWebTxOutputToJson(
      this,
    );
  }
}

abstract class _BtcWebTxOutput extends BtcWebTxOutput {
  factory _BtcWebTxOutput(
          {required final int value,
          required final String script,
          final List<String> addresses,
          @JsonKey(name: "script_type") required final String scriptType}) =
      _$_BtcWebTxOutput;
  _BtcWebTxOutput._() : super._();

  factory _BtcWebTxOutput.fromJson(Map<String, dynamic> json) =
      _$_BtcWebTxOutput.fromJson;

  @override
  int get value;
  @override
  String get script;
  @override
  List<String> get addresses;
  @override
  @JsonKey(name: "script_type")
  String get scriptType;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWebTxOutputCopyWith<_$_BtcWebTxOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

BtcWebTransaction _$BtcWebTransactionFromJson(Map<String, dynamic> json) {
  return _BtcWebTransaction.fromJson(json);
}

/// @nodoc
mixin _$BtcWebTransaction {
  @JsonKey(name: "block_hash")
  String get blockHash => throw _privateConstructorUsedError;
  @JsonKey(name: "block_height")
  int get blockHeight => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  List<String> get addresses => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get fees => throw _privateConstructorUsedError;
  int get confirmations => throw _privateConstructorUsedError;
  DateTime? get confirmed => throw _privateConstructorUsedError;
  DateTime? get received => throw _privateConstructorUsedError;
  @JsonKey(name: "relayed_by")
  String? get relayedBy => throw _privateConstructorUsedError;
  List<BtcWebTxInput> get inputs => throw _privateConstructorUsedError;
  List<BtcWebTxOutput> get outputs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWebTransactionCopyWith<BtcWebTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWebTransactionCopyWith<$Res> {
  factory $BtcWebTransactionCopyWith(
          BtcWebTransaction value, $Res Function(BtcWebTransaction) then) =
      _$BtcWebTransactionCopyWithImpl<$Res, BtcWebTransaction>;
  @useResult
  $Res call(
      {@JsonKey(name: "block_hash") String blockHash,
      @JsonKey(name: "block_height") int blockHeight,
      String hash,
      List<String> addresses,
      int total,
      int fees,
      int confirmations,
      DateTime? confirmed,
      DateTime? received,
      @JsonKey(name: "relayed_by") String? relayedBy,
      List<BtcWebTxInput> inputs,
      List<BtcWebTxOutput> outputs});
}

/// @nodoc
class _$BtcWebTransactionCopyWithImpl<$Res, $Val extends BtcWebTransaction>
    implements $BtcWebTransactionCopyWith<$Res> {
  _$BtcWebTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockHash = null,
    Object? blockHeight = null,
    Object? hash = null,
    Object? addresses = null,
    Object? total = null,
    Object? fees = null,
    Object? confirmations = null,
    Object? confirmed = freezed,
    Object? received = freezed,
    Object? relayedBy = freezed,
    Object? inputs = null,
    Object? outputs = null,
  }) {
    return _then(_value.copyWith(
      blockHash: null == blockHash
          ? _value.blockHash
          : blockHash // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as int,
      confirmations: null == confirmations
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as int,
      confirmed: freezed == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      received: freezed == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      relayedBy: freezed == relayedBy
          ? _value.relayedBy
          : relayedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      inputs: null == inputs
          ? _value.inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<BtcWebTxInput>,
      outputs: null == outputs
          ? _value.outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as List<BtcWebTxOutput>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcWebTransactionCopyWith<$Res>
    implements $BtcWebTransactionCopyWith<$Res> {
  factory _$$_BtcWebTransactionCopyWith(_$_BtcWebTransaction value,
          $Res Function(_$_BtcWebTransaction) then) =
      __$$_BtcWebTransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "block_hash") String blockHash,
      @JsonKey(name: "block_height") int blockHeight,
      String hash,
      List<String> addresses,
      int total,
      int fees,
      int confirmations,
      DateTime? confirmed,
      DateTime? received,
      @JsonKey(name: "relayed_by") String? relayedBy,
      List<BtcWebTxInput> inputs,
      List<BtcWebTxOutput> outputs});
}

/// @nodoc
class __$$_BtcWebTransactionCopyWithImpl<$Res>
    extends _$BtcWebTransactionCopyWithImpl<$Res, _$_BtcWebTransaction>
    implements _$$_BtcWebTransactionCopyWith<$Res> {
  __$$_BtcWebTransactionCopyWithImpl(
      _$_BtcWebTransaction _value, $Res Function(_$_BtcWebTransaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockHash = null,
    Object? blockHeight = null,
    Object? hash = null,
    Object? addresses = null,
    Object? total = null,
    Object? fees = null,
    Object? confirmations = null,
    Object? confirmed = freezed,
    Object? received = freezed,
    Object? relayedBy = freezed,
    Object? inputs = null,
    Object? outputs = null,
  }) {
    return _then(_$_BtcWebTransaction(
      blockHash: null == blockHash
          ? _value.blockHash
          : blockHash // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as int,
      confirmations: null == confirmations
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as int,
      confirmed: freezed == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      received: freezed == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      relayedBy: freezed == relayedBy
          ? _value.relayedBy
          : relayedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      inputs: null == inputs
          ? _value._inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<BtcWebTxInput>,
      outputs: null == outputs
          ? _value._outputs
          : outputs // ignore: cast_nullable_to_non_nullable
              as List<BtcWebTxOutput>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWebTransaction extends _BtcWebTransaction {
  _$_BtcWebTransaction(
      {@JsonKey(name: "block_hash") required this.blockHash,
      @JsonKey(name: "block_height") required this.blockHeight,
      required this.hash,
      final List<String> addresses = const [],
      required this.total,
      required this.fees,
      this.confirmations = 0,
      this.confirmed,
      this.received,
      @JsonKey(name: "relayed_by") this.relayedBy,
      final List<BtcWebTxInput> inputs = const [],
      final List<BtcWebTxOutput> outputs = const []})
      : _addresses = addresses,
        _inputs = inputs,
        _outputs = outputs,
        super._();

  factory _$_BtcWebTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWebTransactionFromJson(json);

  @override
  @JsonKey(name: "block_hash")
  final String blockHash;
  @override
  @JsonKey(name: "block_height")
  final int blockHeight;
  @override
  final String hash;
  final List<String> _addresses;
  @override
  @JsonKey()
  List<String> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  final int total;
  @override
  final int fees;
  @override
  @JsonKey()
  final int confirmations;
  @override
  final DateTime? confirmed;
  @override
  final DateTime? received;
  @override
  @JsonKey(name: "relayed_by")
  final String? relayedBy;
  final List<BtcWebTxInput> _inputs;
  @override
  @JsonKey()
  List<BtcWebTxInput> get inputs {
    if (_inputs is EqualUnmodifiableListView) return _inputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputs);
  }

  final List<BtcWebTxOutput> _outputs;
  @override
  @JsonKey()
  List<BtcWebTxOutput> get outputs {
    if (_outputs is EqualUnmodifiableListView) return _outputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outputs);
  }

  @override
  String toString() {
    return 'BtcWebTransaction(blockHash: $blockHash, blockHeight: $blockHeight, hash: $hash, addresses: $addresses, total: $total, fees: $fees, confirmations: $confirmations, confirmed: $confirmed, received: $received, relayedBy: $relayedBy, inputs: $inputs, outputs: $outputs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWebTransaction &&
            (identical(other.blockHash, blockHash) ||
                other.blockHash == blockHash) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.confirmations, confirmations) ||
                other.confirmations == confirmations) &&
            (identical(other.confirmed, confirmed) ||
                other.confirmed == confirmed) &&
            (identical(other.received, received) ||
                other.received == received) &&
            (identical(other.relayedBy, relayedBy) ||
                other.relayedBy == relayedBy) &&
            const DeepCollectionEquality().equals(other._inputs, _inputs) &&
            const DeepCollectionEquality().equals(other._outputs, _outputs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      blockHash,
      blockHeight,
      hash,
      const DeepCollectionEquality().hash(_addresses),
      total,
      fees,
      confirmations,
      confirmed,
      received,
      relayedBy,
      const DeepCollectionEquality().hash(_inputs),
      const DeepCollectionEquality().hash(_outputs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWebTransactionCopyWith<_$_BtcWebTransaction> get copyWith =>
      __$$_BtcWebTransactionCopyWithImpl<_$_BtcWebTransaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWebTransactionToJson(
      this,
    );
  }
}

abstract class _BtcWebTransaction extends BtcWebTransaction {
  factory _BtcWebTransaction(
      {@JsonKey(name: "block_hash") required final String blockHash,
      @JsonKey(name: "block_height") required final int blockHeight,
      required final String hash,
      final List<String> addresses,
      required final int total,
      required final int fees,
      final int confirmations,
      final DateTime? confirmed,
      final DateTime? received,
      @JsonKey(name: "relayed_by") final String? relayedBy,
      final List<BtcWebTxInput> inputs,
      final List<BtcWebTxOutput> outputs}) = _$_BtcWebTransaction;
  _BtcWebTransaction._() : super._();

  factory _BtcWebTransaction.fromJson(Map<String, dynamic> json) =
      _$_BtcWebTransaction.fromJson;

  @override
  @JsonKey(name: "block_hash")
  String get blockHash;
  @override
  @JsonKey(name: "block_height")
  int get blockHeight;
  @override
  String get hash;
  @override
  List<String> get addresses;
  @override
  int get total;
  @override
  int get fees;
  @override
  int get confirmations;
  @override
  DateTime? get confirmed;
  @override
  DateTime? get received;
  @override
  @JsonKey(name: "relayed_by")
  String? get relayedBy;
  @override
  List<BtcWebTxInput> get inputs;
  @override
  List<BtcWebTxOutput> get outputs;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWebTransactionCopyWith<_$_BtcWebTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
