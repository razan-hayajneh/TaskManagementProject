import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../utils/utils.dart';
import '../../widgets/buttons.dart';
import 'custom_calendar/calendar_timeline.dart';
class CalendarPage extends StatefulWidget {
@override
_CalendarPageState createState() => _CalendarPageState();

}


class _CalendarPageState extends State<CalendarPage> {
  DateTime datePicked = DateTime.now();
  final ValueNotifier<int> totalTask = ValueNotifier(0);
  @override
  void initState() {
    _getTaskByDate();
    super.initState();
  }

  _getTaskByDate() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _topBar(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat(FormatDate.monthDayYear).format(datePicked)
                            ,
                            style: AppTheme.headline1,
                          ),
                          SizedBox(height: 8),
                          ValueListenableBuilder<int>(
                            valueListenable: totalTask,
                            builder: (context, value, child) => Text(
                              '$value Tasks on ${DateFormat(FormatDate.dayDate).format(datePicked)}',
                              style: AppTheme.headline3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RippleCircleButton(
                      onTap: () async {
                        /*  final picked = await Helper.showDeadlineDatePicker(
                          context,
                          datePicked,
                        );
                        if (picked != null && picked != datePicked) {
                          setState(() {
                            datePicked = picked;
                            _getTaskByDate();
                          });
                        }*/
                      },
                      child: SvgPicture.asset(Resources.date,
                          color: Colors.white, width: 20),
                    ),
                  ],
                ),
              ),
              CalendarTimeline(
                initialDate: datePicked,
                firstDate: DateTime(2019, 1, 15),
                lastDate: DateTime(2025, 11, 20),
                onDateSelected: (date) {
                  setState(() {
                    datePicked = date!;
                    _getTaskByDate();
                  });
                },
                leftMargin: 20,
                monthColor: Colors.blueGrey,
                dayColor: Colors.teal[200],
                activeDayColor: Colors.white,
                activeBackgroundDayColor: Colors.redAccent[100],
                dotsColor: Color(0xFF333A47),
                locale: 'en_US',
              ),

            ],
          ),
        ),
      ),
    );
  }

  _topBar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        'Calendar Tasks',
        style: AppTheme.headline3,
        textAlign: TextAlign.center,
      ),
    );
  }


}

