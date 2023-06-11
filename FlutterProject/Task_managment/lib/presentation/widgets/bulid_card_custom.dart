import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_managment/presentation/widgets/show_custom_dialog.dart';
import '../../data/model/Projectmodel.dart';
import '../utils/app_theme.dart';
import '../utils/utils.dart';

class CardCustom extends StatefulWidget implements PreferredSizeWidget {
  final List<Project> projects;
  final int crossAxisCount;
  final double itemHeight;

  const CardCustom({
    Key? key,
    required this.projects,
    required this.itemHeight,
    required this.crossAxisCount,
  }) : super(key: key);

  @override
  State<CardCustom> createState() => _CardCustomState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CardCustomState extends State<CardCustom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      child: GridView.count(
        childAspectRatio: (1/1
        ),
        primary: false,
        shrinkWrap: true,
        crossAxisCount: widget.crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: List.generate(
          widget.projects.length,
              (index) {
            return Container(
              child: getCardCustom(widget.projects[index], context),
            );
          },
        ),
      ),
    )
    );
  }



  Widget getCardCustom(Project project, BuildContext context) {
    LinearGradient colorListGradient =
    AppTheme.colorListGradient[Random().nextInt(AppTheme.colorListGradient.length)];

    return GestureDetector(
      onTap: () async {showCustomDialog(context);},
      child: Card(
        borderOnForeground: true,
        child: SingleChildScrollView(
    child :Container(
          decoration: BoxDecoration(
            gradient: colorListGradient,
            boxShadow: AppTheme.getShadow(Colors.black),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                   // Icon(project.icon),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        project.name,
                        style: AppTheme.headline2,
                        overflow: TextOverflow.ellipsis,
                        maxLines:10 ,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(

                leading: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                title: Text(project.endDate ,style: AppTheme.headline3,),

              ),

              ListTile(
                leading: CircleAvatar(
                 // backgroundImage: NetworkImage(),
                ),
                title: Text(project.managerName),
                trailing: Icon(Icons.arrow_forward_ios ,color: Colors.white,),onTap:()
                {
                Helper.setIdProjectSharedPreferences(project.Id);
                Helper.showToast( "go to my Task ");
                Helper.navigateToNextScreen(context, TaskScreen());
                }


                ,
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}

class TaskScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw Container();
  }
}
