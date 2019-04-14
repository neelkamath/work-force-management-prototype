import 'package:flutter/material.dart';

import 'projects.dart';

class LogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final anything = 'Enter anything';
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: anything,
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your username';
              }
            },
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your password';
              }
            },
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: anything,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Projects(),
                      ));
                }
              },
              child: Text('Log in'),
            ),
          ),
        ],
      ),
    );
  }
}
