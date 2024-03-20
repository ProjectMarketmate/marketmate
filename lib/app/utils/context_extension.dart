import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void navigateReplaceAll(Widget page) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  void navigatePush(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void navigateReplace(Widget page) {
    Navigator.of(this).pop();
    navigatePush(page);
  }

  void showMessage(String message) {
    //close all snackbars
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showErrorMessage(String errorMessage) {
    showMessage(errorMessage);
    // You can also customize the error message appearance or handle it differently.
  }
}
