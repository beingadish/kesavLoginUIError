import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MAIL VERIFY"),
        ),
        body: Column(children: [
          const Text(
            "Please Verify Your Email",
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child: const Text(
              "Send Email",
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login/', (route) => false);
            },
            child: const Text(
              "If Verified , Click Here",
            ),
          ),
        ]));
  }
}
