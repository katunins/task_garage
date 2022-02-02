import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_garage/domain/state/app_provider.dart';
import 'package:task_garage/domain/state/date_provider.dart';
import 'package:task_garage/domain/state/task_list_provider.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateProvider _dateState = context.watch<DateProvider>();
    AppProvider _appState = context.read<AppProvider>();
    TaskListProvider _taskListState = context.read<TaskListProvider>();

    var _searchController = TextEditingController();

    void _clearSearchField (){
      _searchController.clear();
      _taskListState.clearSearchFilter();
    }


    void _setSearchField (String text){
      _taskListState.setSearchFilter(text);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (context.watch<AppProvider>().isSearchMode)
          Expanded(
            child: TextField(
              controller: _searchController,
              textAlignVertical: TextAlignVertical.center,
              autofocus: true,
              // showCursor: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                fillColor: Colors.white70,
                filled: true,
                suffixIcon: IconButton(
                  onPressed: _clearSearchField,
                  icon: const Icon(Icons.clear, size: 14.0,),
                ),
              ),
              onChanged: _setSearchField,
            ),
          )
        else
          TextButton(
              onPressed: () => _dateState.showPicker(context),
              child: Text('${_dateState.stringDate}, ${_dateState.weekDay}',
                  style: const TextStyle(fontSize: 18, color: Colors.white))),
        IconButton(
          onPressed: _appState.switchIsSearchMode,
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
