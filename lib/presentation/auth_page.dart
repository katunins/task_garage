import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/state/user_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    UserProvider _userState = Provider.of<UserProvider>(context);

    void signIn(code) {
      if (code == null || code == '') return;
      _userState.authUser(code);
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Авторизация')),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Введите код',
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                  scrollPadding: const EdgeInsets.all(20.0),
                  onSaved: (code) {
                    signIn(code);
                  },
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () => _formKey.currentState?.save(),
                  child: const Text('Войти'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
