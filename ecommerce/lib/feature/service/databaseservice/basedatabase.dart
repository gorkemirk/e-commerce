import '../../../model/product.dart';

abstract class BaseDatabase {
  Future<bool> createNewUser({required String uid});
  Future<List<String>?> getAllCategories();
  Future<List<Product>?> getProductsByCategory({required String category});
  Future<List<Product>?> getUserBasket({required String uid});
  Future<List<Product>?> getUserFavorites({required String uid});
  Future<bool> addProductToBasket(
      {required String uid, required Product product});
  Future<bool> addProductToFavorites(
      {required String uid, required Product product});
}
