import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/model/model.dart';

// you must open_closed principle
class ListViewCustom extends StatelessWidget {
  final List<dynamic> data;

  const ListViewCustom(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        String itemText = '';
        IconData? itemIcon; // Nullable itemIcon variable

        if (item is Project) {
          itemText = item.name;
          itemIcon = Icons.work; // Set the icon for projects
        } else if (item is Task) {
          itemText = item.name;
          itemIcon = Icons.check_circle; // Set the icon for tasks
        }

        return ListTile(
          leading: Icon(itemIcon), // Use nullable itemIcon
          title: Text(itemText),
          onTap: () {
            // Handle list item tap
          },
        );
      },
    );
  }
}
