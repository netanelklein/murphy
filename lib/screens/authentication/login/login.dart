import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        AuthStateChangeAction((context, state) {
          if (state is SignedIn || state is UserCreated) {
            var user = (state is SignedIn)
                ? state.user
                : (state as UserCreated).credential.user;
            if (user == null) {
              return;
            }
            if (state is UserCreated) {
              user.updateDisplayName(user.email!.split('@')[0]);
            }
            if (!user.emailVerified) {
              user.sendEmailVerification();
              const snackBar =
                  SnackBar(content: Text('Please verify your email address'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            Navigator.of(context).pushReplacementNamed('/home');
          }
        })
      ],
    );
  }
}
