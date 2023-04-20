import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReadingModes {
  bool? text;
  bool? image;
  ReadingModes({
    this.text,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'image': image,
    };
  }

  factory ReadingModes.fromMap(Map<String, dynamic> map) {
    return ReadingModes(
      text: map['text'] != null ? map['text'] as bool : null,
      image: map['image'] != null ? map['image'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadingModes.fromJson(String source) => ReadingModes.fromMap(json.decode(source) as Map<String, dynamic>);
}
