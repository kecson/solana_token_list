/// description : "token"
/// name : "tag"

class TagDetails {
  TagDetails({
    required this.description,
    required this.name,
  });

  TagDetails.fromJson(Map<String, dynamic> json) {
    description = json['description'] ?? '';
    name = json['name'] ?? '';
  }

  late String description;
  late String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['name'] = name;
    return map;
  }
}
