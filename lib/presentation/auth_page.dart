import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/model/task_list.dart';
import 'package:task_garage/domain/model/user.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';
import 'package:task_garage/domain/state/user_provider.dart';
import 'package:task_garage/presentation/widgets/code_input.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider _userState = Provider.of<UserProvider>(context);
    TaskListProvider taskListState = Provider.of<TaskListProvider>(context, listen: false);

    void onFilled(String code) async {
      try {
        User? user = await _userState.authUser(code);
      } catch (error) {
        showMyDialog(context);
        // AlertDialog(title: const Text('Ошибка'), content: Text(error.toString()));
      }
      // _taskListState.getTaskList(TaskListRequest(date: getStringDate(DateTime.now()), userId: user.id));
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
