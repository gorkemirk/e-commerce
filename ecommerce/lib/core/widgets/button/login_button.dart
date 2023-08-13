import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/textstyles.dart';
import 'package:ecommerce/feature/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class ButtonLoginWidget extends ConsumerWidget {
  Function()? onPressed;
  String text;
  ButtonLoginWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            shadowColor: ColorConstant.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: ColorConstant.primaryColor),
        onPressed: onPressed,
        child: SizedBox(
            height: 48,
            child: Center(
              child: Consumer(builder: (context, ref, child) {
                return ref.watch(loginProvider)
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        text,
                        style: TextStyleConstant.buttonTextStyle,
                      );
              }),
            )));
  }
}
