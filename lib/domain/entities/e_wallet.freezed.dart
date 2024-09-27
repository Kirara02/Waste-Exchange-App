// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EWallet _$EWalletFromJson(Map<String, dynamic> json) {
  return _EWallet.fromJson(json);
}

/// @nodoc
mixin _$EWallet {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EWalletCopyWith<EWallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EWalletCopyWith<$Res> {
  factory $EWalletCopyWith(EWallet value, $Res Function(EWallet) then) =
      _$EWalletCopyWithImpl<$Res, EWallet>;
  @useResult
  $Res call({int id, String name, String iconPath});
}

/// @nodoc
class _$EWalletCopyWithImpl<$Res, $Val extends EWallet>
    implements $EWalletCopyWith<$Res> {
  _$EWalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconPath = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EWalletImplCopyWith<$Res> implements $EWalletCopyWith<$Res> {
  factory _$$EWalletImplCopyWith(
          _$EWalletImpl value, $Res Function(_$EWalletImpl) then) =
      __$$EWalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String iconPath});
}

/// @nodoc
class __$$EWalletImplCopyWithImpl<$Res>
    extends _$EWalletCopyWithImpl<$Res, _$EWalletImpl>
    implements _$$EWalletImplCopyWith<$Res> {
  __$$EWalletImplCopyWithImpl(
      _$EWalletImpl _value, $Res Function(_$EWalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconPath = null,
  }) {
    return _then(_$EWalletImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EWalletImpl implements _EWallet {
  _$EWalletImpl({required this.id, required this.name, required this.iconPath});

  factory _$EWalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$EWalletImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String iconPath;

  @override
  String toString() {
    return 'EWallet(id: $id, name: $name, iconPath: $iconPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EWalletImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EWalletImplCopyWith<_$EWalletImpl> get copyWith =>
      __$$EWalletImplCopyWithImpl<_$EWalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EWalletImplToJson(
      this,
    );
  }
}

abstract class _EWallet implements EWallet {
  factory _EWallet(
      {required final int id,
      required final String name,
      required final String iconPath}) = _$EWalletImpl;

  factory _EWallet.fromJson(Map<String, dynamic> json) = _$EWalletImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get iconPath;
  @override
  @JsonKey(ignore: true)
  _$$EWalletImplCopyWith<_$EWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
