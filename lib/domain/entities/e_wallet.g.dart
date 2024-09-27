// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EWalletImpl _$$EWalletImplFromJson(Map<String, dynamic> json) =>
    _$EWalletImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      iconPath: json['iconPath'] as String,
    );

Map<String, dynamic> _$$EWalletImplToJson(_$EWalletImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconPath': instance.iconPath,
    };
