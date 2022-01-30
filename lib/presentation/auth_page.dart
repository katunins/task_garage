import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/model/user.dart';
import 'package:task_garage/domain/state/date_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/domain/state/user_provider.dart';
import 'package:task_garage/presentation/widgets/code_input.dart';

import '../helper.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider _userState = Provider.of<UserProvider>(context);
    DateProvider _dateState = Provider.of<DateProvider>(context);

    void onFilled(String code) async {
      try {
        User? user = await _userState.authUser(code);
        if (user != null) {
          _dateState.today(context);
        }
      } catch (error) {
      showMyDialog(context: context, content: const Text('Попробуйте еще раз'));
      }
    }

    return MaterialApp(
      color: Colors.deepOrange,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Авторизация'))),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Введите код',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              codeInputWidget(onFilled)
            ],
          ),
        ),
      ),
    );
  }
}
