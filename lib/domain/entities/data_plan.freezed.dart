// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataPlan _$DataPlanFromJson(Map<String, dynamic> json) {
  return _DataPlan.fromJson(json);
}

/// @nodoc
mixin _$DataPlan {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get expired => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataPlanCopyWith<DataPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPlanCopyWith<$Res> {
  factory $DataPlanCopyWith(DataPlan value, $Res Function(DataPlan) then) =
      _$DataPlanCopyWithImpl<$Res, DataPlan>;
  @useResult
  $Res call({int id, String name, double price, String expired, String? desc});
}

/// @nodoc
class _$DataPlanCopyWithImpl<$Res, $Val extends DataPlan>
    implements $DataPlanCopyWith<$Res> {
  _$DataPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? expired = null,
    Object? desc = freezed,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      expired: null == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as String,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataPlanImplCopyWith<$Res>
    implements $DataPlanCopyWith<$Res> {
  factory _$$DataPlanImplCopyWith(
          _$DataPlanImpl value, $Res Function(_$DataPlanImpl) then) =
      __$$DataPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, double price, String expired, String? desc});
}

/// @nodoc
class __$$DataPlanImplCopyWithImpl<$Res>
    extends _$DataPlanCopyWithImpl<$Res, _$DataPlanImpl>
    implements _$$DataPlanImplCopyWith<$Res> {
  __$$DataPlanImplCopyWithImpl(
      _$DataPlanImpl _value, $Res Function(_$DataPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? expired = null,
    Object? desc = freezed,
  }) {
    return _then(_$DataPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      expired: null == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as String,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataPlanImpl implements _DataPlan {
  _$DataPlanImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.expired,
      this.desc});

  factory _$DataPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataPlanImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double price;
  @override
  final String expired;
  @override
  final String? desc;

  @override
  String toString() {
    return 'DataPlan(id: $id, name: $name, price: $price, expired: $expired, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.expired, expired) || other.expired == expired) &&
            (identical(other.desc, desc) || other.desc == desc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, expired, desc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPlanImplCopyWith<_$DataPlanImpl> get copyWith =>
      __$$DataPlanImplCopyWithImpl<_$DataPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataPlanImplToJson(
      this,
    );
  }
}

abstract class _DataPlan implements DataPlan {
  factory _DataPlan(
      {required final int id,
      required final String name,
      required final double price,
      required final String expired,
      final String? desc}) = _$DataPlanImpl;

  factory _DataPlan.fromJson(Map<String, dynamic> json) =
      _$DataPlanImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get price;
  @override
  String get expired;
  @override
  String? get desc;
  @override
  @JsonKey(ignore: true)
  _$$DataPlanImplCopyWith<_$DataPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
