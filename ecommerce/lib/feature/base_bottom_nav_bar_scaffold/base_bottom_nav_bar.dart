import 'package:ecommerce/core/constants/bottomnavbaritems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/colors.dart';
import 'base_bottom_scaffold_viewmodel.dart';

class BaseScaffodBottomNavBar extends ConsumerStatefulWidget {
  const BaseScaffodBottomNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BaseScaffodBottomNavBarState();
}

class _BaseScaffodBottomNavBarState
    extends ConsumerState<BaseScaffodBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(color: ColorConstant.greyColor),
          unselectedItemColor: ColorConstant.greyColor,
          selectedIconTheme: IconThemeData(color: ColorConstant.primaryColor),
          selectedItemColor: ColorConstant.primaryColor,
          items: BottomNavBarItems.items,
          currentIndex: ref.watch(bottomNavBarProvider),
          onTap: (index) {
            ref.read(bottomNavBarProvider.notifier).changeSelectedPage(index);
          },
        ),
        body: BottomNavBarItems.pages[ref.watch(bottomNavBarProvider)]);
  }
}
