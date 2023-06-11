import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';


class AddProjectPage extends StatefulWidget
{
  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}
final appBarData = AppBarCustomData(
  title: "Add new Project",
  icons: [],
  iconColor: Colors.white,
  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  showAvatar: false,
  backgroundColor: AppTheme.darkYellow,
  leadIcon: Icons.arrow_back,
  avatarImagePath: '', toolbarHeight: 200,
);
class _AddProjectPageState extends State<AddProjectPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
            appBar: AppBarCustom(data: appBarData),
            body: buildBody(),

        )

        );

  }
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 25.0),

    );
  }
}