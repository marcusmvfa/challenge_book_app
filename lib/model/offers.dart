// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_book_app/model/list_price.dart';

class Offers {
  int? finskyOfferType;
  ListPrice? listPrice;
  ListPrice? retailPrice;
  bool? giftable;
  Offers({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
    this.giftable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'finskyOfferType': finskyOfferType,
      'listPrice': listPrice?.toMap(),
      'retailPrice': retailPrice?.toMap(),
      'giftable': giftable,
    };
  }

  factory Offers.fromMap(Map<String, dynamic> map) {
    return Offers(
      finskyOfferType: map['finskyOfferType'] != null ? map['finskyOfferType'] as int : null,
      listPrice: map['listPrice'] != null ? ListPrice.fromMap(map['listPrice'] as Map<String, dynamic>) : null,
      retailPrice: map['retailPrice'] != null ? ListPrice.fromMap(map['retailPrice'] as Map<String, dynamic>) : null,
      giftable: map['giftable'] != null ? map['giftable'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Offers.fromJson(String source) => Offers.fromMap(json.decode(source) as Map<String, dynamic>);
}
