import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Epub {
  bool? isAvailable;
  String? acsTokenLink;
  String? downloadLink;
  Epub({
    this.isAvailable,
    this.acsTokenLink,
    this.downloadLink,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isAvailable': isAvailable,
      'acsTokenLink': acsTokenLink,
      'downloadLink': downloadLink,
    };
  }

  factory Epub.fromMap(Map<String, dynamic> map) {
    return Epub(
      isAvailable: map['isAvailable'] != null ? map['isAvailable'] as bool : null,
      acsTokenLink: map['acsTokenLink'] != null ? map['acsTokenLink'] as String : null,
      downloadLink: map['downloadLink'] != null ? map['downloadLink'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Epub.fromJson(String source) => Epub.fromMap(json.decode(source) as Map<String, dynamic>);
}
