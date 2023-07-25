import 'package:flutter/material.dart';

import '../Database/spbase.dart';

class TokenProvider extends ChangeNotifier {
  String get token => BaseCache.getInstance().get("");
  setToken(String token) {
    BaseCache.getInstance().setString("", token);
  }
}