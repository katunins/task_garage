import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AppProvider(){
    _prefs.then((SharedPreferences prefs){
      _showFinishedTasks = prefs.getBool('showFinishedTasks') ?? false;
    });
  }

  bool _loader = false;
  late bool _showFinishedTasks;

  bool get loader => _loader;
  bool get showFinishedTasks => _showFinishedTasks;

  void switchShowFinishedTasks (){
    _showFinishedTasks = !_showFinishedTasks;
    _prefs.then((SharedPreferences prefs) => prefs.setBool('showFinishedTasks', _showFinishedTasks));
    notifyListeners();
  }

  void setLoader(bool active) {
    _loader = active;
    notifyListeners();
  }
}
