import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/state/date_provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _dateState = Provider.of<DateProvider>(context);
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => _dateState.prevDay(context),
                icon: const Icon(Icons.arrow_back_ios)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => _dateState.today(context),
                icon: const Icon(
                  Icons.home_outlined,
                  size: 30.0,
                )),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => _dateState.nextDay(context),
                icon: const Icon(Icons.arrow_forward_ios)),
            label: ''),
      ],
    );
  }
}
