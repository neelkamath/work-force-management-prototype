import 'package:flutter/material.dart';

import 'tasks.dart';

class _ProjectListTile extends StatelessWidget {
  final String _company;
  final String _project;
  final DateTime _dateTime;

  _ProjectListTile(String company, String project, int year, int month, int day)
      : _company = company,
        _project = project,
        _dateTime = DateTime(year, month, day);

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Text('<$_company logo>'),
        title: Text(_project),
        trailing: Text(_dateTime.toString()),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Tasks(_project),
              ),
            ),
      );
}

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: ListView(
        children: <Widget>[
          _ProjectListTile('Google', 'Upgrade doors', 2018, 2, 3),
          _ProjectListTile('Google', 'Replace wallpapers', 2018, 7, 6),
          _ProjectListTile('Accenture', 'Install CCTV cameras', 2018, 9, 7),
        ],
      ),
    );
  }
}
