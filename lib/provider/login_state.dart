import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool isLogin = false;


  void tryLogin (bool tryLogin) {
    isLogin = tryLogin;
    notifyListeners();
  }
}
