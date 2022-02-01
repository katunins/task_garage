import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/state/app_provider.dart';
import 'package:task_garage/domain/state/date_provider.dart';
import 'package:task_garage/presentation/widgets/loader.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateProvider _dateState = context.watch<DateProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Loader(),
        TextButton(
            onPressed: () => _dateState.showPicker(context),
            child: Text('${_dateState.stringDate}, ${_dateState.weekDay}',
                style: const TextStyle(fontSize: 18, color: Colors.white))),
      ],
    );
  }
}
