import 'package:json_annotation/json_annotation.dart';
import 'address.dart';
part 'place_address.g.dart';

/*
add part + @JsonSerializable() and use flutter pub run build_runner build
 */
@JsonSerializable()
class PlaceAddress {
  @JsonKey(name: 'place_id', includeIfNull: false)
  final String? placeId;

  @JsonKey(name: 'osm_id', includeIfNull: false)
  final String? osmId;

  @JsonKey(name: 'osm_type', includeIfNull: false)
  final String? osmType;

  @JsonKey(name: 'licence', includeIfNull: false)
  final String? licence;

  @JsonKey(name: 'lat', includeIfNull: false)
  final String? lat;

  @JsonKey(name: 'lon', includeIfNull: false)
  final String? lon;

  @JsonKey(name: 'boundingbox', includeIfNull: false)
  final List<String>? boundingBox;

  @JsonKey(name: 'type', includeIfNull: false)
  final String? type;

  @JsonKey(name: 'display_name', includeIfNull: false)
  final String? displayName;

  @JsonKey(name: 'display_place', includeIfNull: false)
  final String? displayPlace;

  @JsonKey(name: 'display_address', includeIfNull: false)
  final String? displayAddress;

  @JsonKey(name: 'address', includeIfNull: false)
  final Address? address;

  PlaceAddress({
    this.placeId,
    this.osmId,
    this.osmType,
    this.licence,
    this.lat,
    this.lon,
    this.boundingBox,
    this.type,
    this.displayName,
    this.displayPlace,
    this.displayAddress,
    this.address,
  });
  factory PlaceAddress.fromJson(Map<String, dynamic> json) => _$PlaceAddressFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceAddressToJson(this);
}
