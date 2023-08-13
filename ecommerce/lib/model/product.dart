// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Product {
  String id;

  String name;
  String description;
  double price;
  String image;
  String bundle;
  double rating;
  Product(
      {required this.rating,
      required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.bundle});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rating': rating,
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'bundle': bundle,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      rating: map['rating'] as double,
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      image: map['imageUrl'] as String,
      bundle: map['bundle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
