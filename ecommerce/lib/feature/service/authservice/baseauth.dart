import '../../../model/usermodel.dart';

abstract class BaseAuth {
  Future<UserModel?> signInWithEmailAndPassword(
      {required String email, required String password});
}
