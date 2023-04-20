// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_book_app/domain/model/book_model.dart';

class BookResponseDto {
  final String kind;
  final int totalItems;
  final List<Book> items;
  BookResponseDto({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kind': kind,
      'totalItems': totalItems,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory BookResponseDto.fromMap(Map<String, dynamic> map) {
    return BookResponseDto(
      kind: map['kind'] as String,
      totalItems: map['totalItems'] as int,
      items: List<Book>.from(
        (map['items'] as List).map<Book>(
          (x) => Book.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookResponseDto.fromJson(String source) => BookResponseDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
