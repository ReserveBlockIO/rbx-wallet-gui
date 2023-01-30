// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'remote_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteInfoGui _$RemoteInfoGuiFromJson(Map<String, dynamic> json) {
  return _RemoteInfoGui.fromJson(json);
}

/// @nodoc
mixin _$RemoteInfoGui {
  String get version => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteInfoGuiCopyWith<RemoteInfoGui> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteInfoGuiCopyWith<$Res> {
  factory $RemoteInfoGuiCopyWith(
          RemoteInfoGui value, $Res Function(RemoteInfoGui) then) =
      _$RemoteInfoGuiCopyWithImpl<$Res>;
  $Res call({String version, String tag, String url, String date});
}

/// @nodoc
class _$RemoteInfoGuiCopyWithImpl<$Res>
    implements $RemoteInfoGuiCopyWith<$Res> {
  _$RemoteInfoGuiCopyWithImpl(this._value, this._then);

  final RemoteInfoGui _value;
  // ignore: unused_field
  final $Res Function(RemoteInfoGui) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? tag = freezed,
    Object? url = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RemoteInfoGuiCopyWith<$Res>
    implements $RemoteInfoGuiCopyWith<$Res> {
  factory _$$_RemoteInfoGuiCopyWith(
          _$_RemoteInfoGui value, $Res Function(_$_RemoteInfoGui) then) =
      __$$_RemoteInfoGuiCopyWithImpl<$Res>;
  @override
  $Res call({String version, String tag, String url, String date});
}

/// @nodoc
class __$$_RemoteInfoGuiCopyWithImpl<$Res>
    extends _$RemoteInfoGuiCopyWithImpl<$Res>
    implements _$$_RemoteInfoGuiCopyWith<$Res> {
  __$$_RemoteInfoGuiCopyWithImpl(
      _$_RemoteInfoGui _value, $Res Function(_$_RemoteInfoGui) _then)
      : super(_value, (v) => _then(v as _$_RemoteInfoGui));

  @override
  _$_RemoteInfoGui get _value => super._value as _$_RemoteInfoGui;

  @override
  $Res call({
    Object? version = freezed,
    Object? tag = freezed,
    Object? url = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_RemoteInfoGui(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemoteInfoGui extends _RemoteInfoGui {
  _$_RemoteInfoGui(
      {required this.version,
      required this.tag,
      required this.url,
      required this.date})
      : super._();

  factory _$_RemoteInfoGui.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteInfoGuiFromJson(json);

  @override
  final String version;
  @override
  final String tag;
  @override
  final String url;
  @override
  final String date;

  @override
  String toString() {
    return 'RemoteInfoGui(version: $version, tag: $tag, url: $url, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoteInfoGui &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.tag, tag) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(tag),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_RemoteInfoGuiCopyWith<_$_RemoteInfoGui> get copyWith =>
      __$$_RemoteInfoGuiCopyWithImpl<_$_RemoteInfoGui>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteInfoGuiToJson(this);
  }
}

abstract class _RemoteInfoGui extends RemoteInfoGui {
  factory _RemoteInfoGui(
      {required final String version,
      required final String tag,
      required final String url,
      required final String date}) = _$_RemoteInfoGui;
  _RemoteInfoGui._() : super._();

  factory _RemoteInfoGui.fromJson(Map<String, dynamic> json) =
      _$_RemoteInfoGui.fromJson;

  @override
  String get version => throw _privateConstructorUsedError;
  @override
  String get tag => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteInfoGuiCopyWith<_$_RemoteInfoGui> get copyWith =>
      throw _privateConstructorUsedError;
}

RemoteInfoCli _$RemoteInfoCliFromJson(Map<String, dynamic> json) {
  return _RemoteInfoCli.fromJson(json);
}

/// @nodoc
mixin _$RemoteInfoCli {
  String get version => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteInfoCliCopyWith<RemoteInfoCli> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteInfoCliCopyWith<$Res> {
  factory $RemoteInfoCliCopyWith(
          RemoteInfoCli value, $Res Function(RemoteInfoCli) then) =
      _$RemoteInfoCliCopyWithImpl<$Res>;
  $Res call({String version, String tag, String url, String date});
}

/// @nodoc
class _$RemoteInfoCliCopyWithImpl<$Res>
    implements $RemoteInfoCliCopyWith<$Res> {
  _$RemoteInfoCliCopyWithImpl(this._value, this._then);

  final RemoteInfoCli _value;
  // ignore: unused_field
  final $Res Function(RemoteInfoCli) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? tag = freezed,
    Object? url = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RemoteInfoCliCopyWith<$Res>
    implements $RemoteInfoCliCopyWith<$Res> {
  factory _$$_RemoteInfoCliCopyWith(
          _$_RemoteInfoCli value, $Res Function(_$_RemoteInfoCli) then) =
      __$$_RemoteInfoCliCopyWithImpl<$Res>;
  @override
  $Res call({String version, String tag, String url, String date});
}

/// @nodoc
class __$$_RemoteInfoCliCopyWithImpl<$Res>
    extends _$RemoteInfoCliCopyWithImpl<$Res>
    implements _$$_RemoteInfoCliCopyWith<$Res> {
  __$$_RemoteInfoCliCopyWithImpl(
      _$_RemoteInfoCli _value, $Res Function(_$_RemoteInfoCli) _then)
      : super(_value, (v) => _then(v as _$_RemoteInfoCli));

  @override
  _$_RemoteInfoCli get _value => super._value as _$_RemoteInfoCli;

  @override
  $Res call({
    Object? version = freezed,
    Object? tag = freezed,
    Object? url = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_RemoteInfoCli(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemoteInfoCli extends _RemoteInfoCli {
  _$_RemoteInfoCli(
      {required this.version,
      required this.tag,
      required this.url,
      required this.date})
      : super._();

  factory _$_RemoteInfoCli.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteInfoCliFromJson(json);

  @override
  final String version;
  @override
  final String tag;
  @override
  final String url;
  @override
  final String date;

  @override
  String toString() {
    return 'RemoteInfoCli(version: $version, tag: $tag, url: $url, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoteInfoCli &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.tag, tag) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(tag),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_RemoteInfoCliCopyWith<_$_RemoteInfoCli> get copyWith =>
      __$$_RemoteInfoCliCopyWithImpl<_$_RemoteInfoCli>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteInfoCliToJson(this);
  }
}

abstract class _RemoteInfoCli extends RemoteInfoCli {
  factory _RemoteInfoCli(
      {required final String version,
      required final String tag,
      required final String url,
      required final String date}) = _$_RemoteInfoCli;
  _RemoteInfoCli._() : super._();

  factory _RemoteInfoCli.fromJson(Map<String, dynamic> json) =
      _$_RemoteInfoCli.fromJson;

  @override
  String get version => throw _privateConstructorUsedError;
  @override
  String get tag => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteInfoCliCopyWith<_$_RemoteInfoCli> get copyWith =>
      throw _privateConstructorUsedError;
}

RemoteInfoSnapshot _$RemoteInfoSnapshotFromJson(Map<String, dynamic> json) {
  return _RemoteInfoSnapshot.fromJson(json);
}

/// @nodoc
mixin _$RemoteInfoSnapshot {
  int get height => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteInfoSnapshotCopyWith<RemoteInfoSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteInfoSnapshotCopyWith<$Res> {
  factory $RemoteInfoSnapshotCopyWith(
          RemoteInfoSnapshot value, $Res Function(RemoteInfoSnapshot) then) =
      _$RemoteInfoSnapshotCopyWithImpl<$Res>;
  $Res call({int height, String url, String date});
}

/// @nodoc
class _$RemoteInfoSnapshotCopyWithImpl<$Res>
    implements $RemoteInfoSnapshotCopyWith<$Res> {
  _$RemoteInfoSnapshotCopyWithImpl(this._value, this._then);

  final RemoteInfoSnapshot _value;
  // ignore: unused_field
  final $Res Function(RemoteInfoSnapshot) _then;

  @override
  $Res call({
    Object? height = freezed,
    Object? url = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RemoteInfoSnapshotCopyWith<$Res>
    implements $RemoteInfoSnapshotCopyWith<$Res> {
  factory _$$_RemoteInfoSnapshotCopyWith(_$_RemoteInfoSnapshot value,
          $Res Function(_$_RemoteInfoSnapshot) then) =
      __$$_RemoteInfoSnapshotCopyWithImpl<$Res>;
  @override
  $Res call({int height, String url, String date});
}

/// @nodoc
class __$$_RemoteInfoSnapshotCopyWithImpl<$Res>
    extends _$RemoteInfoSnapshotCopyWithImpl<$Res>
    implements _$$_RemoteInfoSnapshotCopyWith<$Res> {
  __$$_RemoteInfoSnapshotCopyWithImpl(
      _$_RemoteInfoSnapshot _value, $Res Function(_$_RemoteInfoSnapshot) _then)
      : super(_value, (v) => _then(v as _$_RemoteInfoSnapshot));

  @override
  _$_RemoteInfoSnapshot get _value => super._value as _$_RemoteInfoSnapshot;

  @override
  $Res call({
    Object? height = freezed,
    Object? url = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_RemoteInfoSnapshot(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemoteInfoSnapshot extends _RemoteInfoSnapshot {
  _$_RemoteInfoSnapshot(
      {required this.height, required this.url, required this.date})
      : super._();

  factory _$_RemoteInfoSnapshot.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteInfoSnapshotFromJson(json);

  @override
  final int height;
  @override
  final String url;
  @override
  final String date;

  @override
  String toString() {
    return 'RemoteInfoSnapshot(height: $height, url: $url, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoteInfoSnapshot &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_RemoteInfoSnapshotCopyWith<_$_RemoteInfoSnapshot> get copyWith =>
      __$$_RemoteInfoSnapshotCopyWithImpl<_$_RemoteInfoSnapshot>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteInfoSnapshotToJson(this);
  }
}

abstract class _RemoteInfoSnapshot extends RemoteInfoSnapshot {
  factory _RemoteInfoSnapshot(
      {required final int height,
      required final String url,
      required final String date}) = _$_RemoteInfoSnapshot;
  _RemoteInfoSnapshot._() : super._();

  factory _RemoteInfoSnapshot.fromJson(Map<String, dynamic> json) =
      _$_RemoteInfoSnapshot.fromJson;

  @override
  int get height => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteInfoSnapshotCopyWith<_$_RemoteInfoSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

RemoteInfo _$RemoteInfoFromJson(Map<String, dynamic> json) {
  return _RemoteInfo.fromJson(json);
}

/// @nodoc
mixin _$RemoteInfo {
  RemoteInfoGui get gui => throw _privateConstructorUsedError;
  RemoteInfoCli get cli => throw _privateConstructorUsedError;
  RemoteInfoSnapshot get snapshot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteInfoCopyWith<RemoteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteInfoCopyWith<$Res> {
  factory $RemoteInfoCopyWith(
          RemoteInfo value, $Res Function(RemoteInfo) then) =
      _$RemoteInfoCopyWithImpl<$Res>;
  $Res call(
      {RemoteInfoGui gui, RemoteInfoCli cli, RemoteInfoSnapshot snapshot});

  $RemoteInfoGuiCopyWith<$Res> get gui;
  $RemoteInfoCliCopyWith<$Res> get cli;
  $RemoteInfoSnapshotCopyWith<$Res> get snapshot;
}

/// @nodoc
class _$RemoteInfoCopyWithImpl<$Res> implements $RemoteInfoCopyWith<$Res> {
  _$RemoteInfoCopyWithImpl(this._value, this._then);

  final RemoteInfo _value;
  // ignore: unused_field
  final $Res Function(RemoteInfo) _then;

  @override
  $Res call({
    Object? gui = freezed,
    Object? cli = freezed,
    Object? snapshot = freezed,
  }) {
    return _then(_value.copyWith(
      gui: gui == freezed
          ? _value.gui
          : gui // ignore: cast_nullable_to_non_nullable
              as RemoteInfoGui,
      cli: cli == freezed
          ? _value.cli
          : cli // ignore: cast_nullable_to_non_nullable
              as RemoteInfoCli,
      snapshot: snapshot == freezed
          ? _value.snapshot
          : snapshot // ignore: cast_nullable_to_non_nullable
              as RemoteInfoSnapshot,
    ));
  }

  @override
  $RemoteInfoGuiCopyWith<$Res> get gui {
    return $RemoteInfoGuiCopyWith<$Res>(_value.gui, (value) {
      return _then(_value.copyWith(gui: value));
    });
  }

  @override
  $RemoteInfoCliCopyWith<$Res> get cli {
    return $RemoteInfoCliCopyWith<$Res>(_value.cli, (value) {
      return _then(_value.copyWith(cli: value));
    });
  }

  @override
  $RemoteInfoSnapshotCopyWith<$Res> get snapshot {
    return $RemoteInfoSnapshotCopyWith<$Res>(_value.snapshot, (value) {
      return _then(_value.copyWith(snapshot: value));
    });
  }
}

/// @nodoc
abstract class _$$_RemoteInfoCopyWith<$Res>
    implements $RemoteInfoCopyWith<$Res> {
  factory _$$_RemoteInfoCopyWith(
          _$_RemoteInfo value, $Res Function(_$_RemoteInfo) then) =
      __$$_RemoteInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {RemoteInfoGui gui, RemoteInfoCli cli, RemoteInfoSnapshot snapshot});

  @override
  $RemoteInfoGuiCopyWith<$Res> get gui;
  @override
  $RemoteInfoCliCopyWith<$Res> get cli;
  @override
  $RemoteInfoSnapshotCopyWith<$Res> get snapshot;
}

/// @nodoc
class __$$_RemoteInfoCopyWithImpl<$Res> extends _$RemoteInfoCopyWithImpl<$Res>
    implements _$$_RemoteInfoCopyWith<$Res> {
  __$$_RemoteInfoCopyWithImpl(
      _$_RemoteInfo _value, $Res Function(_$_RemoteInfo) _then)
      : super(_value, (v) => _then(v as _$_RemoteInfo));

  @override
  _$_RemoteInfo get _value => super._value as _$_RemoteInfo;

  @override
  $Res call({
    Object? gui = freezed,
    Object? cli = freezed,
    Object? snapshot = freezed,
  }) {
    return _then(_$_RemoteInfo(
      gui: gui == freezed
          ? _value.gui
          : gui // ignore: cast_nullable_to_non_nullable
              as RemoteInfoGui,
      cli: cli == freezed
          ? _value.cli
          : cli // ignore: cast_nullable_to_non_nullable
              as RemoteInfoCli,
      snapshot: snapshot == freezed
          ? _value.snapshot
          : snapshot // ignore: cast_nullable_to_non_nullable
              as RemoteInfoSnapshot,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemoteInfo extends _RemoteInfo {
  _$_RemoteInfo({required this.gui, required this.cli, required this.snapshot})
      : super._();

  factory _$_RemoteInfo.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteInfoFromJson(json);

  @override
  final RemoteInfoGui gui;
  @override
  final RemoteInfoCli cli;
  @override
  final RemoteInfoSnapshot snapshot;

  @override
  String toString() {
    return 'RemoteInfo(gui: $gui, cli: $cli, snapshot: $snapshot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoteInfo &&
            const DeepCollectionEquality().equals(other.gui, gui) &&
            const DeepCollectionEquality().equals(other.cli, cli) &&
            const DeepCollectionEquality().equals(other.snapshot, snapshot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gui),
      const DeepCollectionEquality().hash(cli),
      const DeepCollectionEquality().hash(snapshot));

  @JsonKey(ignore: true)
  @override
  _$$_RemoteInfoCopyWith<_$_RemoteInfo> get copyWith =>
      __$$_RemoteInfoCopyWithImpl<_$_RemoteInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteInfoToJson(this);
  }
}

abstract class _RemoteInfo extends RemoteInfo {
  factory _RemoteInfo(
      {required final RemoteInfoGui gui,
      required final RemoteInfoCli cli,
      required final RemoteInfoSnapshot snapshot}) = _$_RemoteInfo;
  _RemoteInfo._() : super._();

  factory _RemoteInfo.fromJson(Map<String, dynamic> json) =
      _$_RemoteInfo.fromJson;

  @override
  RemoteInfoGui get gui => throw _privateConstructorUsedError;
  @override
  RemoteInfoCli get cli => throw _privateConstructorUsedError;
  @override
  RemoteInfoSnapshot get snapshot => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteInfoCopyWith<_$_RemoteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
