// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class GroceryModel {
  final String itemName;
  final num itemPrice; // num
  final int totalQuantity;
  final IconData icon;
  GroceryModel({
    required this.itemName,
    required this.itemPrice,
    required this.totalQuantity,
    required this.icon,
  });
  

  GroceryModel copyWith({
    String? itemName,
    num? itemPrice,
    int? totalQuantity,
    IconData? icon,
  }) {
    return GroceryModel(
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemName': itemName,
      'itemPrice': itemPrice,
      'totalQuantity': totalQuantity,
      'icon': icon.codePoint,
    };
  }

  factory GroceryModel.fromMap(Map<String, dynamic> map) {
    return GroceryModel(
      itemName: map['itemName'] as String,
      itemPrice: map['itemPrice'] as num,
      totalQuantity: map['totalQuantity'] as int,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory GroceryModel.fromJson(String source) => GroceryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GroceryModel(itemName: $itemName, itemPrice: $itemPrice, totalQuantity: $totalQuantity, icon: $icon)';
  }

  @override
  bool operator ==(covariant GroceryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.itemName == itemName &&
      other.itemPrice == itemPrice &&
      other.totalQuantity == totalQuantity &&
      other.icon == icon;
  }

  @override
  int get hashCode {
    return itemName.hashCode ^
      itemPrice.hashCode ^
      totalQuantity.hashCode ^
      icon.hashCode;
  }
}
