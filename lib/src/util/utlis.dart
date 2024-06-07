import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static Future<void> farmAddedMessage(String message, BuildContext context) {
    final fl = Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      message: message,
      backgroundColor: Colors.orange,
      reverseAnimationCurve: Curves.easeInOut,
      duration: const Duration(seconds: 3),
      messageColor: Colors.white,
      messageSize: 16,
      borderRadius: BorderRadius.circular(18),
      maxWidth: double.maxFinite,
    );
    return fl.show(context);
  }
}
