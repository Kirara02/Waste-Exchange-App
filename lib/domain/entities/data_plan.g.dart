// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataPlanImpl _$$DataPlanImplFromJson(Map<String, dynamic> json) =>
    _$DataPlanImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      expired: json['expired'] as String,
      desc: json['desc'] as String?,
    );

Map<String, dynamic> _$$DataPlanImplToJson(_$DataPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'expired': instance.expired,
      'desc': instance.desc,
    };
