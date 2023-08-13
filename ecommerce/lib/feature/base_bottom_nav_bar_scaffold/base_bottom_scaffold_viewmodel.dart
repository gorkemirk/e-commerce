import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarProvider =
    StateNotifierProvider<BottomNavBarViewModel, int>((ref) {
  return BottomNavBarViewModel();
});

class BottomNavBarViewModel extends StateNotifier<int> {
  BottomNavBarViewModel() : super(0);

  void changeSelectedPage(int index) {
    state = index;
  }
}
