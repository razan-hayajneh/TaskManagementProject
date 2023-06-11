import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../data/model/model.dart';
import '../../../utils/app_theme.dart';
import '../../../widgets/bulid_wide_app_bar.dart';
import '../../../widgets/d.dart';

class AddNewTaskPage extends StatefulWidget {
  const AddNewTaskPage({Key? key}) : super(key: key);

  @override
  State<AddNewTaskPage> createState() => _AddNewTaskPageState();
}

class _AddNewTaskPageState extends State<AddNewTaskPage> {
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  final ValueNotifier<int> totalTasks = ValueNotifier(10);
  final ValueNotifier<int> completeTasks = ValueNotifier(5);
  DateTime selectedDate = DateTime.now();
  String category = "Meeting";

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _dateController = TextEditingController(text: '${DateFormat('EEE, MMM d, ' 'yy').format(selectedDate)}');
    _startTimeController = TextEditingController(text: '${DateFormat.jm().format(DateTime.now())}');
    _endTimeController = TextEditingController(text: '${DateFormat.jm().format(DateTime.now().add(Duration(hours: 1)))}');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(body :_buildHeader())
    );
  }

  Widget _buildHeader() {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          WideAppBar(
            tag: "11",
            title: "llll",
            gradient:AppTheme.brownGradient,
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {  },
              ),
            ],
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                SizedBox(
                  height: 56,
                ),
                ValueListenableBuilder2<int, int>(
                    totalTasks,
                    completeTasks,
                    builder: (context, totalTasks, completeTasks, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Your Tasks',
                                style: AppTheme.headline2,
                              ),
                              Text(
                                'Completed Tasks $completeTasks / $totalTasks',
                                style: AppTheme.headline3,
                              ),
                            ],
                          ),
                          CircularPercentIndicator(
                            radius: 120.0,
                            lineWidth: 13.0,
                            animation: true,
                            percent: Task.percent(totalTasks, completeTasks),
                            center: Text(
                              "${(Task.percent(totalTasks, completeTasks) * 100).toInt()}%",
                              style: AppTheme.headline3,
                            ),
                            curve: Curves.easeOutExpo,
                            animationDuration: 3000,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: AppTheme.boldColorFont,
                            backgroundColor: Colors.white,
                          ),
                        ],
                      );
                    }
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              //_taskList(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskForm() {
    return Padding(
      padding: const EdgeInsets.only(/* Add your padding here */),
      child: Column(
        children: [
          // Add your form fields here
        ],
      ),
    );
  }

  Widget _buildCreateTaskButton() {
    return ElevatedButton(
      onPressed: () {
        // Perform task creation logic here
      },
      child: Text("Create Task"),
    );
  }

}
