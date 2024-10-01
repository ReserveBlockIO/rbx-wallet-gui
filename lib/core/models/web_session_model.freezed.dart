// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebSessionModel _$WebSessionModelFromJson(Map<String, dynamic> json) {
  return _WebSessionModel.fromJson(json);
}

/// @nodoc
mixin _$WebSessionModel {
  Keypair? get keypair => throw _privateConstructorUsedError;
  RaKeypair? get raKeypair => throw _privateConstructorUsedError;
  BtcWebAccount? get btcKeypair => throw _privateConstructorUsedError;
  double? get balance => throw _privateConstructorUsedError;
  double? get balanceTotal => throw _privateConstructorUsedError;
  double? get balanceLocked => throw _privateConstructorUsedError;
  double? get raBalance => throw _privateConstructorUsedError;
  double? get raBalanceTotal => throw _privateConstructorUsedError;
  double? get raBalanceLocked => throw _privateConstructorUsedError;
  String? get adnr =>
      throw _privateConstructorUsedError; // @Default(false) bool usingRa,
  WalletType get selectedWalletType => throw _privateConstructorUsedError;
  bool get raActivated => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  String get timezoneName => throw _privateConstructorUsedError;
  bool get rememberMe => throw _privateConstructorUsedError;
  int get currentRbxWalletIndex => throw _privateConstructorUsedError;
  int get currentRaWalletIndex => throw _privateConstructorUsedError;
  int get currentBtcWalletIndex => throw _privateConstructorUsedError;
  BtcWebBalanceInfo? get btcBalanceInfo => throw _privateConstructorUsedError;
  bool get ready => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebSessionModelCopyWith<WebSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSessionModelCopyWith<$Res> {
  factory $WebSessionModelCopyWith(
          WebSessionModel value, $Res Function(WebSessionModel) then) =
      _$WebSessionModelCopyWithImpl<$Res, WebSessionModel>;
  @useResult
  $Res call(
      {Keypair? keypair,
      RaKeypair? raKeypair,
      BtcWebAccount? btcKeypair,
      double? balance,
      double? balanceTotal,
      double? balanceLocked,
      double? raBalance,
      double? raBalanceTotal,
      double? raBalanceLocked,
      String? adnr,
      WalletType selectedWalletType,
      bool raActivated,
      bool isAuthenticated,
      String timezoneName,
      bool rememberMe,
      int currentRbxWalletIndex,
      int currentRaWalletIndex,
      int currentBtcWalletIndex,
      BtcWebBalanceInfo? btcBalanceInfo,
      bool ready});

  $KeypairCopyWith<$Res>? get keypair;
  $RaKeypairCopyWith<$Res>? get raKeypair;
  $BtcWebAccountCopyWith<$Res>? get btcKeypair;
  $BtcWebBalanceInfoCopyWith<$Res>? get btcBalanceInfo;
}

/// @nodoc
class _$WebSessionModelCopyWithImpl<$Res, $Val extends WebSessionModel>
    implements $WebSessionModelCopyWith<$Res> {
  _$WebSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keypair = freezed,
    Object? raKeypair = freezed,
    Object? btcKeypair = freezed,
    Object? balance = freezed,
    Object? balanceTotal = freezed,
    Object? balanceLocked = freezed,
    Object? raBalance = freezed,
    Object? raBalanceTotal = freezed,
    Object? raBalanceLocked = freezed,
    Object? adnr = freezed,
    Object? selectedWalletType = null,
    Object? raActivated = null,
    Object? isAuthenticated = null,
    Object? timezoneName = null,
    Object? rememberMe = null,
    Object? currentRbxWalletIndex = null,
    Object? currentRaWalletIndex = null,
    Object? currentBtcWalletIndex = null,
    Object? btcBalanceInfo = freezed,
    Object? ready = null,
  }) {
    return _then(_value.copyWith(
      keypair: freezed == keypair
          ? _value.keypair
          : keypair // ignore: cast_nullable_to_non_nullable
              as Keypair?,
      raKeypair: freezed == raKeypair
          ? _value.raKeypair
          : raKeypair // ignore: cast_nullable_to_non_nullable
              as RaKeypair?,
      btcKeypair: freezed == btcKeypair
          ? _value.btcKeypair
          : btcKeypair // ignore: cast_nullable_to_non_nullable
              as BtcWebAccount?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceTotal: freezed == balanceTotal
          ? _value.balanceTotal
          : balanceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceLocked: freezed == balanceLocked
          ? _value.balanceLocked
          : balanceLocked // ignore: cast_nullable_to_non_nullable
              as double?,
      raBalance: freezed == raBalance
          ? _value.raBalance
          : raBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      raBalanceTotal: freezed == raBalanceTotal
          ? _value.raBalanceTotal
          : raBalanceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      raBalanceLocked: freezed == raBalanceLocked
          ? _value.raBalanceLocked
          : raBalanceLocked // ignore: cast_nullable_to_non_nullable
              as double?,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedWalletType: null == selectedWalletType
          ? _value.selectedWalletType
          : selectedWalletType // ignore: cast_nullable_to_non_nullable
              as WalletType,
      raActivated: null == raActivated
          ? _value.raActivated
          : raActivated // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      timezoneName: null == timezoneName
          ? _value.timezoneName
          : timezoneName // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRbxWalletIndex: null == currentRbxWalletIndex
          ? _value.currentRbxWalletIndex
          : currentRbxWalletIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentRaWalletIndex: null == currentRaWalletIndex
          ? _value.currentRaWalletIndex
          : currentRaWalletIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentBtcWalletIndex: null == currentBtcWalletIndex
          ? _value.currentBtcWalletIndex
          : currentBtcWalletIndex // ignore: cast_nullable_to_non_nullable
              as int,
      btcBalanceInfo: freezed == btcBalanceInfo
          ? _value.btcBalanceInfo
          : btcBalanceInfo // ignore: cast_nullable_to_non_nullable
              as BtcWebBalanceInfo?,
      ready: null == ready
          ? _value.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KeypairCopyWith<$Res>? get keypair {
    if (_value.keypair == null) {
      return null;
    }

    return $KeypairCopyWith<$Res>(_value.keypair!, (value) {
      return _then(_value.copyWith(keypair: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RaKeypairCopyWith<$Res>? get raKeypair {
    if (_value.raKeypair == null) {
      return null;
    }

    return $RaKeypairCopyWith<$Res>(_value.raKeypair!, (value) {
      return _then(_value.copyWith(raKeypair: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BtcWebAccountCopyWith<$Res>? get btcKeypair {
    if (_value.btcKeypair == null) {
      return null;
    }

    return $BtcWebAccountCopyWith<$Res>(_value.btcKeypair!, (value) {
      return _then(_value.copyWith(btcKeypair: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BtcWebBalanceInfoCopyWith<$Res>? get btcBalanceInfo {
    if (_value.btcBalanceInfo == null) {
      return null;
    }

    return $BtcWebBalanceInfoCopyWith<$Res>(_value.btcBalanceInfo!, (value) {
      return _then(_value.copyWith(btcBalanceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WebSessionModelCopyWith<$Res>
    implements $WebSessionModelCopyWith<$Res> {
  factory _$$_WebSessionModelCopyWith(
          _$_WebSessionModel value, $Res Function(_$_WebSessionModel) then) =
      __$$_WebSessionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Keypair? keypair,
      RaKeypair? raKeypair,
      BtcWebAccount? btcKeypair,
      double? balance,
      double? balanceTotal,
      double? balanceLocked,
      double? raBalance,
      double? raBalanceTotal,
      double? raBalanceLocked,
      String? adnr,
      WalletType selectedWalletType,
      bool raActivated,
      bool isAuthenticated,
      String timezoneName,
      bool rememberMe,
      int currentRbxWalletIndex,
      int currentRaWalletIndex,
      int currentBtcWalletIndex,
      BtcWebBalanceInfo? btcBalanceInfo,
      bool ready});

  @override
  $KeypairCopyWith<$Res>? get keypair;
  @override
  $RaKeypairCopyWith<$Res>? get raKeypair;
  @override
  $BtcWebAccountCopyWith<$Res>? get btcKeypair;
  @override
  $BtcWebBalanceInfoCopyWith<$Res>? get btcBalanceInfo;
}

/// @nodoc
class __$$_WebSessionModelCopyWithImpl<$Res>
    extends _$WebSessionModelCopyWithImpl<$Res, _$_WebSessionModel>
    implements _$$_WebSessionModelCopyWith<$Res> {
  __$$_WebSessionModelCopyWithImpl(
      _$_WebSessionModel _value, $Res Function(_$_WebSessionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keypair = freezed,
    Object? raKeypair = freezed,
    Object? btcKeypair = freezed,
    Object? balance = freezed,
    Object? balanceTotal = freezed,
    Object? balanceLocked = freezed,
    Object? raBalance = freezed,
    Object? raBalanceTotal = freezed,
    Object? raBalanceLocked = freezed,
    Object? adnr = freezed,
    Object? selectedWalletType = null,
    Object? raActivated = null,
    Object? isAuthenticated = null,
    Object? timezoneName = null,
    Object? rememberMe = null,
    Object? currentRbxWalletIndex = null,
    Object? currentRaWalletIndex = null,
    Object? currentBtcWalletIndex = null,
    Object? btcBalanceInfo = freezed,
    Object? ready = null,
  }) {
    return _then(_$_WebSessionModel(
      keypair: freezed == keypair
          ? _value.keypair
          : keypair // ignore: cast_nullable_to_non_nullable
              as Keypair?,
      raKeypair: freezed == raKeypair
          ? _value.raKeypair
          : raKeypair // ignore: cast_nullable_to_non_nullable
              as RaKeypair?,
      btcKeypair: freezed == btcKeypair
          ? _value.btcKeypair
          : btcKeypair // ignore: cast_nullable_to_non_nullable
              as BtcWebAccount?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceTotal: freezed == balanceTotal
          ? _value.balanceTotal
          : balanceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceLocked: freezed == balanceLocked
          ? _value.balanceLocked
          : balanceLocked // ignore: cast_nullable_to_non_nullable
              as double?,
      raBalance: freezed == raBalance
          ? _value.raBalance
          : raBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      raBalanceTotal: freezed == raBalanceTotal
          ? _value.raBalanceTotal
          : raBalanceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      raBalanceLocked: freezed == raBalanceLocked
          ? _value.raBalanceLocked
          : raBalanceLocked // ignore: cast_nullable_to_non_nullable
              as double?,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedWalletType: null == selectedWalletType
          ? _value.selectedWalletType
          : selectedWalletType // ignore: cast_nullable_to_non_nullable
              as WalletType,
      raActivated: null == raActivated
          ? _value.raActivated
          : raActivated // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      timezoneName: null == timezoneName
          ? _value.timezoneName
          : timezoneName // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRbxWalletIndex: null == currentRbxWalletIndex
          ? _value.currentRbxWalletIndex
          : currentRbxWalletIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentRaWalletIndex: null == currentRaWalletIndex
          ? _value.currentRaWalletIndex
          : currentRaWalletIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentBtcWalletIndex: null == currentBtcWalletIndex
          ? _value.currentBtcWalletIndex
          : currentBtcWalletIndex // ignore: cast_nullable_to_non_nullable
              as int,
      btcBalanceInfo: freezed == btcBalanceInfo
          ? _value.btcBalanceInfo
          : btcBalanceInfo // ignore: cast_nullable_to_non_nullable
              as BtcWebBalanceInfo?,
      ready: null == ready
          ? _value.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebSessionModel extends _WebSessionModel {
  _$_WebSessionModel(
      {this.keypair,
      this.raKeypair,
      this.btcKeypair,
      this.balance,
      this.balanceTotal,
      this.balanceLocked,
      this.raBalance,
      this.raBalanceTotal,
      this.raBalanceLocked,
      this.adnr,
      this.selectedWalletType = WalletType.rbx,
      this.raActivated = false,
      this.isAuthenticated = false,
      this.timezoneName = "America/Los_Angeles",
      this.rememberMe = false,
      this.currentRbxWalletIndex = 0,
      this.currentRaWalletIndex = 0,
      this.currentBtcWalletIndex = 0,
      this.btcBalanceInfo,
      this.ready = false})
      : super._();

  factory _$_WebSessionModel.fromJson(Map<String, dynamic> json) =>
      _$$_WebSessionModelFromJson(json);

  @override
  final Keypair? keypair;
  @override
  final RaKeypair? raKeypair;
  @override
  final BtcWebAccount? btcKeypair;
  @override
  final double? balance;
  @override
  final double? balanceTotal;
  @override
  final double? balanceLocked;
  @override
  final double? raBalance;
  @override
  final double? raBalanceTotal;
  @override
  final double? raBalanceLocked;
  @override
  final String? adnr;
// @Default(false) bool usingRa,
  @override
  @JsonKey()
  final WalletType selectedWalletType;
  @override
  @JsonKey()
  final bool raActivated;
  @override
  @JsonKey()
  final bool isAuthenticated;
  @override
  @JsonKey()
  final String timezoneName;
  @override
  @JsonKey()
  final bool rememberMe;
  @override
  @JsonKey()
  final int currentRbxWalletIndex;
  @override
  @JsonKey()
  final int currentRaWalletIndex;
  @override
  @JsonKey()
  final int currentBtcWalletIndex;
  @override
  final BtcWebBalanceInfo? btcBalanceInfo;
  @override
  @JsonKey()
  final bool ready;

  @override
  String toString() {
    return 'WebSessionModel(keypair: $keypair, raKeypair: $raKeypair, btcKeypair: $btcKeypair, balance: $balance, balanceTotal: $balanceTotal, balanceLocked: $balanceLocked, raBalance: $raBalance, raBalanceTotal: $raBalanceTotal, raBalanceLocked: $raBalanceLocked, adnr: $adnr, selectedWalletType: $selectedWalletType, raActivated: $raActivated, isAuthenticated: $isAuthenticated, timezoneName: $timezoneName, rememberMe: $rememberMe, currentRbxWalletIndex: $currentRbxWalletIndex, currentRaWalletIndex: $currentRaWalletIndex, currentBtcWalletIndex: $currentBtcWalletIndex, btcBalanceInfo: $btcBalanceInfo, ready: $ready)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebSessionModel &&
            (identical(other.keypair, keypair) || other.keypair == keypair) &&
            (identical(other.raKeypair, raKeypair) ||
                other.raKeypair == raKeypair) &&
            (identical(other.btcKeypair, btcKeypair) ||
                other.btcKeypair == btcKeypair) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.balanceTotal, balanceTotal) ||
                other.balanceTotal == balanceTotal) &&
            (identical(other.balanceLocked, balanceLocked) ||
                other.balanceLocked == balanceLocked) &&
            (identical(other.raBalance, raBalance) ||
                other.raBalance == raBalance) &&
            (identical(other.raBalanceTotal, raBalanceTotal) ||
                other.raBalanceTotal == raBalanceTotal) &&
            (identical(other.raBalanceLocked, raBalanceLocked) ||
                other.raBalanceLocked == raBalanceLocked) &&
            (identical(other.adnr, adnr) || other.adnr == adnr) &&
            (identical(other.selectedWalletType, selectedWalletType) ||
                other.selectedWalletType == selectedWalletType) &&
            (identical(other.raActivated, raActivated) ||
                other.raActivated == raActivated) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.timezoneName, timezoneName) ||
                other.timezoneName == timezoneName) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe) &&
            (identical(other.currentRbxWalletIndex, currentRbxWalletIndex) ||
                other.currentRbxWalletIndex == currentRbxWalletIndex) &&
            (identical(other.currentRaWalletIndex, currentRaWalletIndex) ||
                other.currentRaWalletIndex == currentRaWalletIndex) &&
            (identical(other.currentBtcWalletIndex, currentBtcWalletIndex) ||
                other.currentBtcWalletIndex == currentBtcWalletIndex) &&
            (identical(other.btcBalanceInfo, btcBalanceInfo) ||
                other.btcBalanceInfo == btcBalanceInfo) &&
            (identical(other.ready, ready) || other.ready == ready));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        keypair,
        raKeypair,
        btcKeypair,
        balance,
        balanceTotal,
        balanceLocked,
        raBalance,
        raBalanceTotal,
        raBalanceLocked,
        adnr,
        selectedWalletType,
        raActivated,
        isAuthenticated,
        timezoneName,
        rememberMe,
        currentRbxWalletIndex,
        currentRaWalletIndex,
        currentBtcWalletIndex,
        btcBalanceInfo,
        ready
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebSessionModelCopyWith<_$_WebSessionModel> get copyWith =>
      __$$_WebSessionModelCopyWithImpl<_$_WebSessionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebSessionModelToJson(
      this,
    );
  }
}

abstract class _WebSessionModel extends WebSessionModel {
  factory _WebSessionModel(
      {final Keypair? keypair,
      final RaKeypair? raKeypair,
      final BtcWebAccount? btcKeypair,
      final double? balance,
      final double? balanceTotal,
      final double? balanceLocked,
      final double? raBalance,
      final double? raBalanceTotal,
      final double? raBalanceLocked,
      final String? adnr,
      final WalletType selectedWalletType,
      final bool raActivated,
      final bool isAuthenticated,
      final String timezoneName,
      final bool rememberMe,
      final int currentRbxWalletIndex,
      final int currentRaWalletIndex,
      final int currentBtcWalletIndex,
      final BtcWebBalanceInfo? btcBalanceInfo,
      final bool ready}) = _$_WebSessionModel;
  _WebSessionModel._() : super._();

  factory _WebSessionModel.fromJson(Map<String, dynamic> json) =
      _$_WebSessionModel.fromJson;

  @override
  Keypair? get keypair;
  @override
  RaKeypair? get raKeypair;
  @override
  BtcWebAccount? get btcKeypair;
  @override
  double? get balance;
  @override
  double? get balanceTotal;
  @override
  double? get balanceLocked;
  @override
  double? get raBalance;
  @override
  double? get raBalanceTotal;
  @override
  double? get raBalanceLocked;
  @override
  String? get adnr;
  @override // @Default(false) bool usingRa,
  WalletType get selectedWalletType;
  @override
  bool get raActivated;
  @override
  bool get isAuthenticated;
  @override
  String get timezoneName;
  @override
  bool get rememberMe;
  @override
  int get currentRbxWalletIndex;
  @override
  int get currentRaWalletIndex;
  @override
  int get currentBtcWalletIndex;
  @override
  BtcWebBalanceInfo? get btcBalanceInfo;
  @override
  bool get ready;
  @override
  @JsonKey(ignore: true)
  _$$_WebSessionModelCopyWith<_$_WebSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
