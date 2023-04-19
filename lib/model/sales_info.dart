// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_book_app/model/list_price.dart';
import 'package:flutter_book_app/model/offers.dart';

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  ListPrice? listPrice;
  ListPrice? retailPrice;
  String? buyLink;
  List<Offers>? offers;
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'saleability': saleability,
      'isEbook': isEbook,
      'listPrice': listPrice?.toMap(),
      'retailPrice': retailPrice?.toMap(),
      'buyLink': buyLink,
      'offers': offers?.map((x) => x.toMap()).toList(),
    };
  }

  factory SaleInfo.fromMap(Map<String, dynamic> map) {
    return SaleInfo(
      country: map['country'] != null ? map['country'] as String : null,
      saleability: map['saleability'] != null ? map['saleability'] as String : null,
      isEbook: map['isEbook'] != null ? map['isEbook'] as bool : null,
      listPrice: map['listPrice'] != null ? ListPrice.fromMap(map['listPrice'] as Map<String, dynamic>) : null,
      retailPrice: map['retailPrice'] != null ? ListPrice.fromMap(map['retailPrice'] as Map<String, dynamic>) : null,
      buyLink: map['buyLink'] != null ? map['buyLink'] as String : null,
      offers: map['offers'] != null
          ? List<Offers>.from(
              (map['offers'] as List<int>).map<Offers?>(
                (x) => Offers.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleInfo.fromJson(String source) => SaleInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
