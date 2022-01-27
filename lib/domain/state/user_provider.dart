import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:task_garage/domain/model/user.dart';
import 'package:task_garage/domain/repository/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {

  // UserProvider(this._userRepository);
  late SharedPreferences _prefs;

  UserProvider(this._userRepository) {
    SharedPreferences.getInstance().then((prefs) => _prefs = prefs);
  }

  final UserRepository _userRepository;

  User? _user;

  User? get user => _user;


  Future<User?> authUser(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final User? user = await _userRepository.authUser(code: code);
    _user = user;
    prefs.setString('user', jsonEncode(user));
    notifyListeners();
    return user;
  }
}
