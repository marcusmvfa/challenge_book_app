import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ListPrice {
  double? amount;
  String? currencyCode;
  ListPrice({
    this.amount,
    this.currencyCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'currencyCode': currencyCode,
    };
  }

  factory ListPrice.fromMap(Map<String, dynamic> map) {
    return ListPrice(
      amount: map['amount'] != null ? map['amount'] as double : null,
      currencyCode: map['currencyCode'] != null ? map['currencyCode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListPrice.fromJson(String source) => ListPrice.fromMap(json.decode(source) as Map<String, dynamic>);
}
