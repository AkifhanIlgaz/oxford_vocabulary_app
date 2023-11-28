import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/configs/configs.dart';
import 'package:oxford_vocabulary_app/firebase_options.dart';
import 'package:oxford_vocabulary_app/screens/home.dart';
import 'package:oxford_vocabulary_app/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.signOut();

  runApp(const VocabularyApp());
}

class VocabularyApp extends StatelessWidget {
  const VocabularyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xffff4f18),
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: const AuthStream(),
    );
  }
}

class AuthStream extends StatelessWidget {
  const AuthStream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const SplashScreen();
          }
        });
  }
}

class ProjectColors {
  static final mainColor = Colors.amber[900];
  static const AuthBaseColor = Colors.grey;
}

class ProjectPaddings {
  static const ScreenHorizontalPadding = EdgeInsets.symmetric(horizontal: 28);
}

class ProjectRadiuses {
  static const SnackBarRadius = const Radius.circular(20);
}
