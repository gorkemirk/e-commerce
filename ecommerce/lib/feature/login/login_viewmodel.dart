import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginViewModel, bool>((ref) {
  return LoginViewModel();
});

class LoginViewModel extends StateNotifier<bool> {
  LoginViewModel() : super(false);

  void change(bool newValue) {
    state = newValue;
  }
}
