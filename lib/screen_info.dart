import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class InfoScreen extends StatefulWidget {
  final UserGroup userGroup;

  InfoScreen({required this.userGroup});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _employeesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.userGroup.name;
    _employeesController.text = widget.userGroup.description;
  }
  
  @override
  Widget build(BuildContext context) {
    UserGroup userGroup = widget.userGroup;

    return Scaffold(
      appBar: AppBar(
        title: Text('Info: ' + userGroup.name),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name group',
                ),
              ),
              TextFormField(
                controller: _employeesController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        userGroup.name = _nameController.text;
                        userGroup.description = _employeesController.text;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Saved')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
