import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';

SnackBar customSnackBar({
  required String content,
  Duration duration = const Duration(seconds: 3),
}) {
  return SnackBar(
    content: Text(content),
    backgroundColor: const Color.fromARGB(255, 134, 29, 22),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: kSnackBarRadius,
      ),
    ),
    duration: duration,
  );
}
