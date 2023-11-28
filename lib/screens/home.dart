import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("home");

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text("Log out"),
        ),
      ),
    );
  }
}
