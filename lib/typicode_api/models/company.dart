import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(explicitToJson: true)
class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String? name;
  String? catchPhrase;
  String? bs;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
