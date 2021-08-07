
import 'dart:convert';

class ProductsResponse {
    ProductsResponse({
        required this.body,
    });

    Body body;

    factory ProductsResponse.fromJson(String str) => ProductsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductsResponse.fromMap(Map<String, dynamic> json) => ProductsResponse(
        body: Body.fromMap(json["body"]),
    );

    Map<String, dynamic> toMap() => {
        "body": body.toMap(),
    };
}

class Body {
    Body({
        required this.hits,
    });

    Hits hits;

    factory Body.fromJson(String str) => Body.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Body.fromMap(Map<String, dynamic> json) => Body(
        hits: Hits.fromMap(json["hits"]),
    );

    Map<String, dynamic> toMap() => {
        "hits": hits.toMap(),
    };
}

class Hits {
    Hits({
        required this.hits,
    });

    List<Hit> hits;

    factory Hits.fromJson(String str) => Hits.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Hits.fromMap(Map<String, dynamic> json) => Hits(
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "hits": List<dynamic>.from(hits.map((x) => x.toMap())),
    };
}

class Hit {
    Hit({
        required this.source,
    });

    Source source;

    factory Hit.fromJson(String str) => Hit.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Hit.fromMap(Map<String, dynamic> json) => Hit(
        source: Source.fromMap(json["_source"]),
    );

    Map<String, dynamic> toMap() => {
        "_source": source.toMap(),
    };
}

class Source {
    Source({
        required this.items,
    });

    List<Item> items;

    factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Source.fromMap(Map<String, dynamic> json) => Source(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
    };
}

class Item {
    Item({
        required this.itemId,
        required this.name,
        required this.nameComplete,
        required this.complementName,
        required this.ean,
        required this.referenceId,
        required this.measurementUnit,
        required this.unitMultiplier,
        required this.modalType,
        required this.isKit,
        required this.images,
        required this.color,
        required this.talla,
    });

    String itemId;
    String name;
    String nameComplete;
    String complementName;
    String ean;
    List<ReferenceId> referenceId;
    String measurementUnit;
    int unitMultiplier;
    String modalType;
    bool isKit;
    List<Image> images;
    List<String> color;
    List<String> talla;

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        itemId: json["itemId"],
        name: json["name"],
        nameComplete: json["nameComplete"],
        complementName: json["complementName"],
        ean: json["ean"],
        referenceId: List<ReferenceId>.from(json["referenceId"].map((x) => ReferenceId.fromMap(x))),
        measurementUnit: json["measurementUnit"],
        unitMultiplier: json["unitMultiplier"],
        modalType: json["modalType"],
        isKit: json["isKit"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        color: List<String>.from(json["Color"].map((x) => x)),
        talla: List<String>.from(json["Talla"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "itemId": itemId,
        "name": name,
        "nameComplete": nameComplete,
        "complementName": complementName,
        "ean": ean,
        "referenceId": List<dynamic>.from(referenceId.map((x) => x.toMap())),
        "measurementUnit": measurementUnit,
        "unitMultiplier": unitMultiplier,
        "modalType": modalType,
        "isKit": isKit,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "Color": List<dynamic>.from(color.map((x) => x)),
        "Talla": List<dynamic>.from(talla.map((x) => x)),
    };
}

class Image {
    Image({
        required this.imageId,
        required this.imageLabel,
        required this.imageTag,
        required this.imageUrl,
        required this.imageText,
        required this.imageLastModified,
    });

    String imageId;
    String imageLabel;
    String imageTag;
    String imageUrl;
    String imageText;
    DateTime imageLastModified;

    factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Image.fromMap(Map<String, dynamic> json) => Image(
        imageId: json["imageId"],
        imageLabel: json["imageLabel"],
        imageTag: json["imageTag"],
        imageUrl: json["imageUrl"],
        imageText: json["imageText"],
        imageLastModified: DateTime.parse(json["imageLastModified"]),
    );

    Map<String, dynamic> toMap() => {
        "imageId": imageId,
        "imageLabel": imageLabel,
        "imageTag": imageTag,
        "imageUrl": imageUrl,
        "imageText": imageText,
        "imageLastModified": imageLastModified.toIso8601String(),
    };
}

class ReferenceId {
    ReferenceId({
        required this.key,
        required this.value,
    });

    String key;
    String value;

    factory ReferenceId.fromJson(String str) => ReferenceId.fromMap(json.decode(str));

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
