import 'package:exercise_flutter_acs/screen_action.dart';
import 'package:exercise_flutter_acs/screen_info.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class ScreenGroup extends StatelessWidget {
  final UserGroup userGroup;

  ScreenGroup({required this.userGroup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Group " + userGroup.name),

      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildTile(context, Icons.description, 'Info'),
            _buildTile(context, Icons.calendar_month, 'Schedule'),
            _buildTile(context, Icons.room_preferences_sharp, 'Actions'),
            _buildTile(context, Icons.holiday_village, 'Places'),
            _buildTile(context, Icons.manage_accounts, 'Users'),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String label) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(icon, color: Colors.white, size: 50), // Ajusta este valor para cambiar el tamaño del icono.
                onPressed: () {
                  if (label == 'Info') {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InfoScreen(userGroup: userGroup)),
                    );
                  }
                  if (label == 'Actions') {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ActionsScreen(userGroup: userGroup)),
                    );
                  }
                },
              ),
              Text(label, style: TextStyle(color: Colors.white, fontSize: 40)),
            ],
          ),
        ),
      ),
    );
  }
}
