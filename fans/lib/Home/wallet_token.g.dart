// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletTokenImpl _$$WalletTokenImplFromJson(Map<String, dynamic> json) =>
    _$WalletTokenImpl(
      base: json['base'] as String? ?? '',
      quote: json['quote'] as String? ?? '',
      type: json['type'] as String? ?? '',
      lastPrice:
          const ObjectDecimalOrNullConverter().fromJson(json['lastPrice']),
      volume: const ObjectDecimalOrNullConverter().fromJson(json['volume']),
    );

Map<String, dynamic> _$$WalletTokenImplToJson(_$WalletTokenImpl instance) =>
    <String, dynamic>{
      'base': instance.base,
      'quote': instance.quote,
      'type': instance.type,
      'lastPrice':
          const ObjectDecimalOrNullConverter().toJson(instance.lastPrice),
      'volume': const ObjectDecimalOrNullConverter().toJson(instance.volume),
    };
