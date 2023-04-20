// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_book_app/domain/model/image_links.dart';
import 'package:flutter_book_app/domain/model/industry_identifier.dart';
import 'package:flutter_book_app/domain/model/panelization_summary.dart';
import 'package:flutter_book_app/domain/model/reading_modes.dart';

class VolumeInfo {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  num? averageRating;
  int? ratingsCount;

  VolumeInfo(
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.averageRating,
    this.ratingsCount,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'industryIdentifiers': industryIdentifiers?.map((x) => x.toMap()).toList(),
      'readingModes': readingModes?.toMap(),
      'pageCount': pageCount,
      'printType': printType,
      'categories': categories,
      'maturityRating': maturityRating,
      'allowAnonLogging': allowAnonLogging,
      'contentVersion': contentVersion,
      'panelizationSummary': panelizationSummary?.toMap(),
      'imageLinks': imageLinks?.toMap(),
      'language': language,
      'previewLink': previewLink,
      'infoLink': infoLink,
      'canonicalVolumeLink': canonicalVolumeLink,
      'averageRating': averageRating,
      'ratingsCount': ratingsCount,
    };
  }

  factory VolumeInfo.fromMap(Map<String, dynamic> map) {
    return VolumeInfo(
      map['title'] != null ? map['title'] as String : null,
      map['subtitle'] != null ? map['subtitle'] as String : null,
      map['authors'] != null ? List<String>.from(map['authors'] as List) : null,
      map['publisher'] != null ? map['publisher'] as String : null,
      map['publishedDate'] != null ? map['publishedDate'] as String : null,
      map['description'] != null ? map['description'] as String : null,
      map['industryIdentifiers'] != null
          ? List<IndustryIdentifiers>.from(
              (map['industryIdentifiers'] as List).map<IndustryIdentifiers?>(
                (x) => IndustryIdentifiers.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      map['readingModes'] != null ? ReadingModes.fromMap(map['readingModes'] as Map<String, dynamic>) : null,
      map['pageCount'] != null ? map['pageCount'] as int : null,
      map['printType'] != null ? map['printType'] as String : null,
      map['categories'] != null ? List<String>.from(map['categories'] as List) : null,
      map['maturityRating'] != null ? map['maturityRating'] as String : null,
      map['allowAnonLogging'] != null ? map['allowAnonLogging'] as bool : null,
      map['contentVersion'] != null ? map['contentVersion'] as String : null,
      map['panelizationSummary'] != null ? PanelizationSummary.fromMap(map['panelizationSummary'] as Map<String, dynamic>) : null,
      map['imageLinks'] != null ? ImageLinks.fromMap(map['imageLinks'] as Map<String, dynamic>) : null,
      map['language'] != null ? map['language'] as String : null,
      map['previewLink'] != null ? map['previewLink'] as String : null,
      map['infoLink'] != null ? map['infoLink'] as String : null,
      map['canonicalVolumeLink'] != null ? map['canonicalVolumeLink'] as String : null,
      map['averageRating'] != null ? map['averageRating'].toDouble() as double : null,
      map['ratingsCount'] != null ? map['ratingsCount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VolumeInfo.fromJson(String source) => VolumeInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
