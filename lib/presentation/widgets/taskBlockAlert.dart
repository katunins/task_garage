import 'package:flutter/material.dart';

class TaskBlockAlertWidget extends StatefulWidget {
  const TaskBlockAlertWidget({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _TaskBlockAlertWidgetState createState() => _TaskBlockAlertWidgetState();
}

class _TaskBlockAlertWidgetState extends State<TaskBlockAlertWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const Center(child: Text("Блокировка задачи")),
      content: Column(
        // mainAxisSize: MainAxisSize.min,
        // children: [
        //   Form(
        //     key: _formKey,
        //     child: TextFormField(
        //       style: const TextStyle(fontSize: 13.0),
        //       autofocus: true,
        //       decoration: const InputDecoration(
        //         hintText: 'Опишите причину блокировки задачи',
        //         filled: true,
        //         fillColor: Color.fromRGBO(240, 240, 240, 1),
        //         border: InputBorder.none,
        //       ),
        //       // textAlign: TextAlign.center,
        //       maxLines: 5,
        //       scrollPadding: const EdgeInsets.all(20.0),
        //       onSaved: (message) {
        //         context.read<Data>().toBlockTask(id: widget.id, message: message ?? '');
        //         Navigator.of(context, rootNavigator: true).pop('dialog');
        //       },
        //     ),
        //   )
        // ],
      ),
      actionsOverflowButtonSpacing: 120,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            _formKey.currentState?.save();
          },
          child: const Text('Заблокировать'),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          child: const Text('Отменить'),
        ),
      ],
    );
  }
}
