import 'dart:math';

import 'package:flutter/material.dart';

import 'status.dart';

_TaskStatus _taskStatus = _TaskStatus.pending;

enum _TaskStatus { pending, ongoing, completed }

class _TaskDate extends StatelessWidget {
  final String _type;
  final DateTime _dateTime;

  _TaskDate(String type, int year, int month, int day)
      : _type = type,
        _dateTime = DateTime(year, month, day);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(_type),
        trailing: Text(_dateTime.toString()),
      );
}

class _TaskStatusListTile extends StatefulWidget {
  final bool _isStart;

  _TaskStatusListTile(bool isStart) : _isStart = isStart;

  @override
  State<StatefulWidget> createState() => _TaskStatusListTileState();
}

class _TaskStatusListTileState extends State<_TaskStatusListTile> {
  @override
  Widget build(BuildContext context) {
    String text;
    switch (_taskStatus) {
      case _TaskStatus.pending:
        text = '${widget._isStart ? 'Start' : 'End'} task';
        break;
      case _TaskStatus.ongoing:
        text = widget._isStart ? 'Update comment' : 'End task';
        break;
      case _TaskStatus.completed:
        text = 'Update comment';
    }

    return ListTile(
      title: FlatButton(
        onPressed: () => _navigateToStatus(context),
        child: Text(text),
        color: widget._isStart ? Colors.green : Colors.red,
      ),
    );
  }

  _navigateToStatus(BuildContext context) async {
    final hasStarted = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Status(widget._isStart),
        ));
    if (hasStarted == null) {
      // The user hasn't updated the task's status.
    } else if (hasStarted) {
      _taskStatus = _TaskStatus.ongoing;
    } else {
      _taskStatus = _TaskStatus.completed;
    }
    setState(null);
  }
}

class _DataPadding extends StatelessWidget {
  final String _data;

  _DataPadding(String data) : _data = data;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(_data),
      );
}

class _PersonListTile extends StatelessWidget {
  final String _name;

  _PersonListTile(String name) : _name = name;

  @override
  Widget build(BuildContext context) {
    final generator = Random(0);
    int number = 0;
    for (var _ = 0; _ < 10; _++) {
      number = (number * 10) + generator.nextInt(10);
    }

    return ListTile(
      title: Text(_name),
      trailing: Text(number.toString()),
    );
  }
}

class Task extends StatefulWidget {
  final String _task;

  Task(String task) : _task = task;

  @override
  State<StatefulWidget> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    String status;
    switch (_taskStatus) {
      case _TaskStatus.completed:
        status = 'Completed';
        break;
      case _TaskStatus.ongoing:
        status = 'Ongoing';
        break;
      case _TaskStatus.pending:
        status = 'Pending';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget._task} Details"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Status: $status'),
          ),
          Divider(),
          _TaskDate('Created', 2017, 3, 1),
          _TaskDate('Updated', 2017, 4, 2),
          _TaskDate('Due', 2017, 5, 2),
          Divider(),
          _TaskStatusListTile(true),
          _TaskStatusListTile(false),
          Divider(),
          _DataPadding('Managers Assigned'),
          _PersonListTile('Bob'),
          _PersonListTile('Harry'),
          _PersonListTile('Mary'),
          Divider(),
          _DataPadding('Workers Assigned'),
          _PersonListTile('Thomas'),
          _PersonListTile('Jordan'),
          _PersonListTile('Shane'),
          Divider(),
          _DataPadding('Locations Involved'),
          ListTile(
            title: Text('Paris Office'),
          ),
          ListTile(
            title: Text('L.A. South Office'),
          ),
          ListTile(
            title: Text('L.A. North Office'),
          ),
        ],
      ),
    );
  }
}
