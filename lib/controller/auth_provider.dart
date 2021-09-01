import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isSignInPassVisible = true;
  bool _isSignUpPassVisible = true;

  bool get isSignInPassVisible => _isSignInPassVisible;

  bool get isSignUpPassVisible => _isSignUpPassVisible;

  /// UI Handling
  void changeSignInPassVisibility() {
    _isSignInPassVisible = !_isSignInPassVisible;
    notifyListeners();
  }

  void changeSignUpPassVisibility() {
    _isSignUpPassVisible = !_isSignUpPassVisible;
    notifyListeners();
  }
}
