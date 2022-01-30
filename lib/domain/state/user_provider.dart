import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:task_garage/domain/model/user.dart';
import 'package:task_garage/domain/repository/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  UserProvider(this._userRepository) {
    _loadFromPrefs();
  }

  final UserRepository _userRepository;

  User? _user;

  User? get user => _user;


  _loadFromPrefs() async {
    _prefs.then((SharedPreferences prefs) {
      var mapUser = jsonDecode(prefs.getString('user') ?? '');
      _user = User(
          id: mapUser['id'], bitrixid: mapUser['bitrixid'], name: mapUser['name'], avatar: mapUser['avatar']);
      notifyListeners();
    });
  }

  _saveToPrefs() async {
    _prefs.then((SharedPreferences prefs) => prefs.setString('user', jsonEncode(_user?.toJson())));
  }

  Future<User?> authUser(String code) async {
    final User? user = await _userRepository.authUser(code: code);
    _user = user;
    _saveToPrefs();
    notifyListeners();
    return user;
  }
}
