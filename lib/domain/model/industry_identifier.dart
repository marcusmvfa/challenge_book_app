import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class IndustryIdentifiers {
  String? type;
  String? identifier;
  IndustryIdentifiers({
    this.type,
    this.identifier,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'identifier': identifier,
    };
  }

  factory IndustryIdentifiers.fromMap(Map<String, dynamic> map) {
    return IndustryIdentifiers(
      type: map['type'] != null ? map['type'] as String : null,
      identifier: map['identifier'] != null ? map['identifier'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IndustryIdentifiers.fromJson(String source) => IndustryIdentifiers.fromMap(json.decode(source) as Map<String, dynamic>);
}
