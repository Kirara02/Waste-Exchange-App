// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditImpl _$$CreditImplFromJson(Map<String, dynamic> json) => _$CreditImpl(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$CreditImplToJson(_$CreditImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'price': instance.price,
    };
