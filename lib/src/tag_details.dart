import 'package:json_annotation/json_annotation.dart';

part 'tag_details.g.dart';

@JsonSerializable(anyMap: true)
class TagDetails {
  String? description;
  String? name;

  TagDetails({
    this.description,
    this.name,
  });

  factory TagDetails.fromJson(Map json) => _$TagDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TagDetailsToJson(this);
}
