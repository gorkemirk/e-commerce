import 'package:ecommerce/feature/service/databaseservice/basedatabase.dart';
import 'package:ecommerce/feature/service/databaseservice/firestoredatabase.dart';
import 'package:ecommerce/model/product.dart';

import '../locator/locator.dart';

// ignore: camel_case_types
enum Database { firestore, mysql }

class ProductRepository implements BaseDatabase {
  Database databaseType = Database.firestore;
  BaseDatabase databaseService = locator<FireDatabase>();
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
    if (databaseType == Database.firestore) {
      List<String>? categories = await databaseService.getAllCategories();
      return categories;
    } else {}
  }

  @override
  Future<List<Product>?> getProductsByCategory(
      {required String category}) async {
    if (databaseType == Database.firestore) {
      List<Product>? products =
          await databaseService.getProductsByCategory(category: category);
      return products;
    } else {}
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
