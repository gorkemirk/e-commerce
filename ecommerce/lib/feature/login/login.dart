import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/images.dart';
import 'package:ecommerce/core/widgets/button/login_button.dart';
import 'package:ecommerce/feature/landing/landing_viewmodel.dart';
import 'package:ecommerce/feature/login/login_viewmodel.dart';
import 'package:ecommerce/feature/service/authservice/fireauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import '../../core/widgets/textfield/textfield.dart';
import '../../model/usermodel.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String _email = "";
String _password = "";

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: context.paddingNormal,
            child: ListView(
              children: [
                SizedBox(
                  height: context.dynamicHeight(0.06),
                ),
                Text(
                  "Login",
                  style: context.textTheme.headlineLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: context.dynamicHeight(0.08)),
                SizedBox(
                  height: context.dynamicHeight(0.4),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldCustomWidget(
                          label: "Email",
                          validator: (value) =>
                              value!.isEmpty ? "Email cannot be empty" : null,
                          onSaved: (value) => _email = value!,
                        ),
                        TextFieldCustomWidget(
                          label: "Password",
                          validator: (value) => value!.isEmpty
                              ? "Password cannot be empty"
                              : null,
                          onSaved: (value) => _password = value!,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              "Forgot your password? ",
                              style: context.textTheme.labelLarge
                                  ?.copyWith(letterSpacing: 0.6),
                            ),
                            Icon(Icons.arrow_forward,
                                size: 16, color: ColorConstant.primaryColor)
                          ],
                        ),
                        SizedBox(height: context.dynamicHeight(0.02)),
                        ButtonLoginWidget(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                ref.read(loginProvider.notifier).change(true);
                                UserModel? currentUser = await FireAuth()
                                    .signInWithEmailAndPassword(
                                        email: _email, password: _password);
                                ref
                                    .read(currentUserProvider.notifier)
                                    .changeUser(currentUser);
                                debugPrint(_email);
                                debugPrint(_password);
                                ref.read(loginProvider.notifier).change(false);
                              } else {
                                _formKey.currentState!.reset();
                              }
                            },
                            text: "LOGIN"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: context.dynamicHeight(0.14)),
                Center(
                  child: Column(
                    children: [
                      const Text("Or login with social account"),
                      SizedBox(height: context.dynamicHeight(0.02)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Image.asset(
                                  ImageConstant.googleImage,
                                  scale: 0.9,
                                ),
                              )),
                          const SizedBox(
                            width: 16,
                          ),
                          Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Image.asset(
                                  ImageConstant.facebookImage,
                                  scale: 0.9,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
