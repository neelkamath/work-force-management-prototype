import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  final bool _isStarting;

  Status(bool isStarting) : _isStarting = isStarting;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('${_isStarting ? 'Starting' : 'Ending'} Task'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.pop(context, _isStarting),
              child: Text(
                  'Confirm task has been ${_isStarting ? 'started' : 'ended'}'),
            ),
          ],
        ),
      );
}
