import 'package:flutter/material.dart';
import 'package:task_managment/presentation/screen/cleander/calendar_screen.dart';
import 'package:task_managment/presentation/utils/utils.dart';

import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import '../utils/helper.dart';
import '../widgets/widgets.dart';
import 'TaskScreens/AddNewTask.dart';
import 'mainScreen.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentBody = 0;

  static List<Widget> get bodyList => [
    HomeScreen(),
    CalendarPage(),
    ProfilePage(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _currentBody = index;
    });
  }

  Widget get _getPage => bodyList[_currentBody];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage,
      floatingActionButton: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppTheme.pinkGradient.withVerticalGradient,
          boxShadow: AppTheme.getShadow(AppTheme.frenchRose),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(56),
          child: Icon(Icons.add, color: Colors.white)
              .addRipple(onTap: () => Helper.navigateToNextScreen(context, AddNewTask())),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _currentBody,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw Container();
  }
}
