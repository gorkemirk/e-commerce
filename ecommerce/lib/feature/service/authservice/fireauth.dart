import 'package:ecommerce/feature/service/authservice/baseauth.dart';
import 'package:ecommerce/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;

class FireAuth extends BaseAuth {
  @override
  Future<UserModel?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user.user != null) {
        return UserModel(id: user.user!.uid);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("SignIn metotda hata oluştu: $e");
      return null;
    }
  }
}
