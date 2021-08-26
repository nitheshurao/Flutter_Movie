import 'dart:convert';

class CaltelogModels {
//singleton
  static final catModel = CaltelogModels._internal();

  CaltelogModels._internal();

  factory CaltelogModels() => catModel;

  static List<Item> items = [];
}

class Item {
  final int id;
  final String name;
  // final num price;
  // final String color;
  final String image;

  Item(this.id, this.name, this.image);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      // 'price': price,
      // 'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'],
      map['name'],
      // map['price'],
      // map['color'],
      map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name,  image: $image)';
  }
}
