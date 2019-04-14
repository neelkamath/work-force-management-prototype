import 'package:flutter/material.dart';

import 'log_in.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Work Force Management'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: LogIn(),
        ),
      ),
    ));
