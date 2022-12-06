import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      actions: [
        SignedOutAction((context) => Navigator.of(context).pushNamed('/home')),
      ],
      appBar: AppBar(
        title: const Text('Profile'),
      ),
    );
  }
}
