import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/usermodel.dart';

final currentUserProvider =
    StateNotifierProvider<LandingViewModel, UserModel?>((ref) {
  return LandingViewModel();
});

class LandingViewModel extends StateNotifier<UserModel?> {
  LandingViewModel()
      : super(FirebaseAuth.instance.currentUser != null
            ? UserModel(id: FirebaseAuth.instance.currentUser!.uid)
            : null);

  void changeUser(UserModel? user) {
    state = user;
  }
}
