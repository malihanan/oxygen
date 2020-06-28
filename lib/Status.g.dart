// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    json['name'],
    json['age'],
  )
    ..credits = json['credits'] as int
    ..tankChain = (json['tankChain'] as List)
        .map((e) => Tank.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'credits': instance.credits,
      'tankChain': instance.tankChain,
    };

Tank _$TankFromJson(Map<String, dynamic> json) {
  return Tank(
    json['timeout'] as int,
    _$enumDecode(_$FlavorEnumMap, json['flavor']),
    json['richness'] as int,
  )..price = json['price'] as int;
}

Map<String, dynamic> _$TankToJson(Tank instance) => <String, dynamic>{
      'timeout': instance.timeout,
      'flavor': _$FlavorEnumMap[instance.flavor],
      'richness': instance.richness,
      'price': instance.price,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$FlavorEnumMap = {
  Flavor.Regular: 'Regular',
  Flavor.Chocolate: 'Chocolate',
  Flavor.Mint: 'Mint',
  Flavor.Strawberry: 'Strawberry',
  Flavor.Apple: 'Apple',
};
