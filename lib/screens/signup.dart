import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/product/image/image_items.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/screens/signin.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/widgets/circular_button_without_splash.dart';
import 'package:oxford_vocabulary_app/widgets/email_input.dart';
import 'package:oxford_vocabulary_app/widgets/horizontal_line_with_text.dart';
import 'package:oxford_vocabulary_app/widgets/password_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  String _secondPassword = "";

  void onEmailSaved(String email) {
    setState(() {
      _email = email;
    });
  }

  void onPasswordSaved(String password) {
    setState(() {
      _password = password;
    });
  }

  void onSecondPasswordSaved(String password) {
    setState(() {
      _secondPassword = password;
    });
  }

  void onSubmit() async {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();

    firebaseService.signUp(
        email: _email, password: _password, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: kHorizontalPadding,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: SvgPicture.asset(ImageItems.signUp),
                  ),
                  AuthEmailInput(
                    onSaved: onEmailSaved,
                  ),
                  _gap(),
                  AuthPasswordInput(
                    onSaved: onPasswordSaved,
                  ),
                  _gap(),
                  AuthPasswordInput(
                    onSaved: onSecondPasswordSaved,
                    hintText: LanguageItems.confirmPasswordPlaceholder,
                  ),
                  _gap(),
                  if (_password != _secondPassword)
                    Align(
                      alignment: Alignment.centerLeft,
                      heightFactor: 0.4,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          alignment: Alignment.center,
                          iconColor: Colors.red,
                          disabledForegroundColor: Colors.red,
                        ),
                        onPressed: null,
                        icon: const Icon(
                          Icons.close_outlined,
                        ),
                        label: const Text("Passwords doesn't match!"),
                      ),
                    ),
                  _gap(),
                  CircularButtonWithoutSplash(
                    buttonText: LanguageItems.signUpText,
                    topMargin: 10,
                    filled: true,
                    fillColorInHex: kPrimaryColor,
                    onTap: onSubmit,
                  ),
                  const HorizontalLineWithText(
                    title: LanguageItems.alreadyHaveAccountText,
                  ),
                  CircularButtonWithoutSplash(
                    buttonText: LanguageItems.signInText,
                    topMargin: 10,
                    filled: false,
                    fillColorInHex: kPrimaryColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const SigninScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _gap() => const SizedBox(height: 16);
}
