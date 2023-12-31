import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/product/image/image_items.dart';
import 'package:oxford_vocabulary_app/product/language/language_items.dart';
import 'package:oxford_vocabulary_app/screens/signup.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/widgets/circular_button_without_splash.dart';
import 'package:oxford_vocabulary_app/widgets/email_input.dart';
import 'package:oxford_vocabulary_app/widgets/horizontal_line_with_text.dart';
import 'package:oxford_vocabulary_app/widgets/password_input.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

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

  void onSubmit() async {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();

    firebaseService.signIn(
        email: _email, password: _password, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: kHorizontalPadding,
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      child: SvgPicture.asset(ImageItems.signIn),
                    ),
                    AuthEmailInput(
                      onSaved: onEmailSaved,
                    ),
                    _gap(),
                    AuthPasswordInput(
                      onSaved: onPasswordSaved,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            LanguageItems.forgotPasswordText,
                            style: kSmallTextStyle,
                          ),
                        )
                      ],
                    ),
                    CircularButtonWithoutSplash(
                      buttonText: LanguageItems.signInText,
                      topMargin: 10,
                      filled: true,
                      fillColorInHex: kPrimaryColor,
                      onTap: onSubmit,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const HorizontalLineWithText(
                        title: "or",
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: firebaseService.signInWithGoogle,
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        margin: const EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: const Color(kPrimaryColor),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/vectors/google.svg",
                              width: 20,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              LanguageItems.googleAuthText,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Color(kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircularButtonWithoutSplash(
                      buttonText: LanguageItems.createAccountText,
                      topMargin: 10,
                      filled: false,
                      fillColorInHex: kPrimaryColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const SignupScreen(),
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
      ),
    );
  }

  SizedBox _gap() => const SizedBox(height: 16);
}
