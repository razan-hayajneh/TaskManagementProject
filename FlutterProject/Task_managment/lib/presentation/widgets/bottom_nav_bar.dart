import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 56,
      child: SafeArea(
        bottom: true,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    selectedIndex == 0
                        ? Resources.dashboardActive
                        : Resources.dashboardInactive,
                    height: 20,
                    width: 20,
                  ),
                ),
                onTap: () => onItemTapped(0),
              ),
              Container(
                width: 20,
                height: 20,
                padding: const EdgeInsets.all(16),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    selectedIndex == 1
                        ? Resources.calendarActive
                        : Resources.calendarInactive,
                    height: 20,
                    width: 20,
                  ),
                ),
                onTap: () => onItemTapped(1),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    selectedIndex == 2
                        ? Resources.profileActive
                        : Resources.profileInactive,
                    height: 20,
                    width: 20,
                  ),
                ),
                onTap: () => onItemTapped(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
