// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      name: json['name'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('state', instance.state);
  writeNotNull('country', instance.country);
  writeNotNull('countryCode', instance.countryCode);
  return val;
}
