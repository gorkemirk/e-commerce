import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/feature/service/databaseservice/basedatabase.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class FireDatabase extends BaseDatabase {
  @override
  Future<bool> addProductToBasket(
      {required String uid, required Product product}) {
    // TODO: implement addProductToBasket
    throw UnimplementedError();
  }

  @override
  Future<bool> addProductToFavorites(
      {required String uid, required Product product}) {
    // TODO: implement addProductToFavorites
    throw UnimplementedError();
  }

  @override
  Future<bool> createNewUser({required String uid}) {
    // TODO: implement createNewUser
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> getAllCategories() async {
    try {
      var value = await _firestore.collection("categories").get();
      List<String>? categories = ((value.docs[0].data()["categories"]) as List)
          .map((e) => e as String)
          .toList();
      return categories;
    } catch (e) {
      debugPrint("${e.toString()} :getAllCategories metodunda hata");
      return null;
    }
  }

  @override
  Future<List<Product>?> getProductsByCategory(
      {required String category}) async {
    try {
      var value = await _firestore
          .collection("products")
          .where("category", arrayContains: category)
          .get();
      List<Product>? categories =
          value.docs.map((e) => Product.fromMap(e.data())).toList();
      return categories;
    } catch (e) {
      debugPrint("${e.toString()} :getAllCategories metodunda hata");
      return null;
    }
  }

  @override
  Future<List<Product>?> getUserBasket({required String uid}) {
    // TODO: implement getUserBasket
    throw UnimplementedError();
  }

  @override
  Future<List<Product>?> getUserFavorites({required String uid}) {
    // TODO: implement getUserFavorites
    throw UnimplementedError();
  }
}
