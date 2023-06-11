import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment/presentation/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import '../../data/model/Projectmodel.dart';
import '../../logic/blocs/project/project_bloc.dart';
import '../../logic/blocs/project/project_event.dart';
import '../../logic/blocs/project/project_state.dart';

import '../utils/constants.dart';
import '../utils/utils.dart';
import '../widgets/title_row_custom.dart';
class HomeScreen  extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  late ProjectBloc projectBloc;

  List<String> dataList = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  List<Project> dataListproject = [
  ];
  String token ="" ;
  @override
  void initState()
  {
    projectBloc = context.read<ProjectBloc>();
    final tokenuser = Helper.getTokenFromSharedPreferences();
    final fetchProjectsEvent = FetchProjects( tokenFuture: tokenuser);
    projectBloc.add(fetchProjectsEvent);
    super.initState();
    // Initialize data


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),

    );
  }

  AppBarCustom buildAppBar() {

    return AppBarCustom(data: Resources.appBarDatahome);
  }




  Widget buildBody() {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (state is ProjectLoadedSuccess) {
          return Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: Column(
              children: [
                buildTitleRow("My Project", "", () {
                  //Helper.navigateToNextScreen(context, ProjectScreen());
                }),
                SizedBox(height: 20),
                buildCardCustom(state.projects),
                SizedBox(height: 30),

              ],
            ),
          );
        } else if (state is ProjectLoadedFailed) {
          // Handle error state
          return Center(child: Text(state.errorMessage.toString()));
        } else {
          // Handle initial/loading state
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildTitleRow(String title, String seeAllText, VoidCallback onTap) {
    return SingleChildScrollView(
        child :Container(
      child :TitleRow(
      title: title,
      seeAllText: seeAllText,
      onTap: onTap,
    ),
        )

    );
  }

  CardCustom buildCardCustom(List<Project> data) {
    return CardCustom(projects: data, crossAxisCount: 2, itemHeight: 1,);
  }

  void navigateToProjectScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProjectScreen()),
    );
  }



}

class ProjectScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();

    //buildTitleRow("My Task", "See all", () {
    //                  // Helper.navigateToNextScreen(context, CalendarPage());
    //                 }),
    //                 Flexible(child: ListViewCustom(dataList)),
  }
}