
import 'package:json_annotation/json_annotation.dart';
part 'authentication.g.dart';

@JsonSerializable()
class Authentication {

  final String accessToken;

  Authentication(this.accessToken);

  factory Authentication.fromJson(Map<String, dynamic> json) => _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);
}