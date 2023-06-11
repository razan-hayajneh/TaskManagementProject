

import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                // Handle delete option
                // Call delete function or perform desired action
                Navigator.pop(context); // Close the dialog
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Update'),
              onTap: () {
                // Handle update option
                // Call update function or perform desired action
                Navigator.pop(context); // Close the dialog
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Invite Members'),
              onTap: () {
                // Handle invite members option
                // Call invite members function or perform desired action
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        ),
      );
    },
  );
}
