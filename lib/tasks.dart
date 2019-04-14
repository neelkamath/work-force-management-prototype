import 'package:flutter/material.dart';

import 'task.dart';

class _TaskListTile extends StatelessWidget {
  final String _task;
  final DateTime _dateTime;

  _TaskListTile(String task, int year, int month, int day)
      : _task = task,
        _dateTime = DateTime(year, month, day);

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Text('<status>'),
        title: Text(_task),
        trailing: Text(_dateTime.toString()),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Task(_task),
              ),
            ),
      );
}

class Tasks extends StatelessWidget {
  final String _project;

  Tasks(String project) : _project = project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_project Tasks'),
      ),
      body: ListView(
        children: <Widget>[
          _TaskListTile('Do third floor', 2017, 8, 9),
          _TaskListTile('Near bathroom', 2017, 6, 5),
          _TaskListTile('The lobby', 2018, 8, 7),
        ],
      ),
    );
  }
}
