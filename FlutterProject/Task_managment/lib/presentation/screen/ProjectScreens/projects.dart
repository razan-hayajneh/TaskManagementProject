import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/model.dart';
import '../../utils/app_theme.dart';
import '../../widgets/bulid_app_bar_custom.dart';
import '../../utils/utils.dart';

class ProjectScreen extends StatefulWidget {
  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}
List<Project> dataListproject = [
  Project.withStartDateEndDateNameManagerName( name: "Project1", managerName: "heba", startDate: "13_1_1994", endDate: "13_1_1994", )
];


class _ProjectScreenState extends State<ProjectScreen> {

  final appBarData = AppBarCustomData(
    title: "My Project",
    icons: [],
    iconColor: Colors.white,
    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    showAvatar: false,
    backgroundColor: AppTheme.yellowOrange,
    leadIcon: Icons.arrow_back,
    avatarImagePath: '', toolbarHeight: 200,
  );
  @override
  Widget build(BuildContext context) {

        return MaterialApp(
            debugShowCheckedModeBanner: false,

            home: Scaffold(
          appBar: AppBarCustom(data: appBarData),

          body: Padding(padding: EdgeInsets.all( 20.0),
          child:  CardCustom(projects:dataListproject, crossAxisCount: 1, itemHeight: 0.5,)

          )
          ,floatingActionButton: Helper.buildFloatingActionButton(context,AppTheme.perano),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        )
        );

      }


  }


