// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceAddress _$PlaceAddressFromJson(Map<String, dynamic> json) => PlaceAddress(
      placeId: json['place_id'] as String?,
      osmId: json['osm_id'] as String?,
      osmType: json['osm_type'] as String?,
      licence: json['licence'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      boundingBox: (json['boundingbox'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      type: json['type'] as String?,
      displayName: json['display_name'] as String?,
      displayPlace: json['display_place'] as String?,
      displayAddress: json['display_address'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceAddressToJson(PlaceAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('place_id', instance.placeId);
  writeNotNull('osm_id', instance.osmId);
  writeNotNull('osm_type', instance.osmType);
  writeNotNull('licence', instance.licence);
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('boundingbox', instance.boundingBox);
  writeNotNull('type', instance.type);
  writeNotNull('display_name', instance.displayName);
  writeNotNull('display_place', instance.displayPlace);
  writeNotNull('display_address', instance.displayAddress);
  writeNotNull('address', instance.address);
  return val;
}
