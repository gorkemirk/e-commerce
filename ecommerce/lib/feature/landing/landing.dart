import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../base_bottom_nav_bar_scaffold/base_bottom_nav_bar.dart';
import '../login/login.dart';
import 'landing_viewmodel.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(currentUserProvider) == null
        ? const LoginView()
        : const BaseScaffodBottomNavBar();
  }
}
