import 'package:flutter/cupertino.dart';

class LoaderProvider with ChangeNotifier {
  bool _loader = false;
  bool get loader => _loader;

  void setLoader(bool active) {
    _loader = active;
    notifyListeners();
  }
}
