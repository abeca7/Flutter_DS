import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class ActionsScreen extends StatefulWidget {
  final UserGroup userGroup;

  ActionsScreen({required this.userGroup});

  @override
  _ActionsScreenState createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  late UserGroup userGroup;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actions: ' + userGroup.name),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            for (int i = 0; i < userGroup.actions.length; i++)
              CheckboxListTile(
                title: Text(userGroup.actions[i]),
                value: userGroup.actionsState[i],
                onChanged: (bool? value) {
                  setState(() {
                    userGroup.actionsState[i] = value!;
                  });
                },
              ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Saved')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



