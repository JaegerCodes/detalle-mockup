import 'dart:convert';

import 'dart:ui';
import 'package:color_parser/color_parser.dart';

class ProductsResponse {
  ProductsResponse({
    required this.itemList,
  });

  List<Item> itemList;

  factory ProductsResponse.fromJson(String str) =>
      ProductsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(itemList);

  factory ProductsResponse.fromMap(List<dynamic> json) => ProductsResponse(
        itemList: json.map((e) => Item.fromMap(e)).toList(),
      );
}

class Item {
  Item({
    required this.productId,
    required this.productName,
    required this.minPurchaseAmount,
    this.outfitPart,
    required this.presentations,
  });

  String productId;
  String productName;
  double minPurchaseAmount;
  String? outfitPart;
  List<Presentation> presentations;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        productId: json["productId"],
        productName: json["productName"],
        minPurchaseAmount: json["minPurchaseAmount"],
        outfitPart: json["outfitPart"],
        presentations: List<Presentation>.from(
            json["presentations"].map((x) => Presentation.fromMap(x))),
      );
}

class Presentation {
  Presentation({
    required this.price,
    this.color,
    required this.size,
    this.outfitPart,
    required this.imageUrls,
  });

  double price;
  Color? color;
  String size;
  String? outfitPart;
  List<String> imageUrls;

  factory Presentation.fromMap(Map<String, dynamic> json) => Presentation(
        price: json["price"],
        color: json["color"] == null
            ? null
            : ColorParser.hex(json["color"]).getColor(),
        size: json["size"] ?? "M",
        outfitPart: json["outfitPart"],
        imageUrls: List<String>.from(json["imageUrls"]),
      );
}

class ReferenceId {
  ReferenceId({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory ReferenceId.fromJson(String str) =>
      ReferenceId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReferenceId.fromMap(Map<String, dynamic> json) => ReferenceId(
        key: json["Key"],
        value: json["Value"],
      );

  Map<String, dynamic> toMap() => {
        "Key": key,
        "Value": value,
      };
}
