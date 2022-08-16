import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(name: 'name', includeIfNull: false)
  String? name;
  @JsonKey(name: 'state', includeIfNull: false)
  String? state;
  @JsonKey(name: 'country', includeIfNull: false)
  String? country;
  @JsonKey(name: 'countryCode', includeIfNull: false)
  String? countryCode;

  Address({
    this.name,
    this.state,
    this.country,
    this.countryCode,
  });
  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
