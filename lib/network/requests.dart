import 'package:json_annotation/json_annotation.dart';

part 'requests.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "proficiency")
  String? proficiency;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  RegisterRequest({
    required this.name,
    required this.proficiency,
    required this.phoneNumber,
  });

  
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
