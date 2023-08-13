import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../landing/landing_viewmodel.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          ref.read(currentUserProvider.notifier).changeUser(null);
        },
        child: const Text('Logout'));
  }
}
