
import 'package:flutter/material.dart';
import 'package:task_managment/presentation/utils/app_theme.dart';

import 'utils.dart';


class Keys {
  static const String isInitial = 'isInitial';
  static const String isOnBoardInitial = 'isOnBoardInitial';
  static const String categoryItem = 'categoryItem';
  static const String totalTasks = 'totalTasks';
  static const String completeTasks = 'completeTasks';
  static const String index = 'index';
  static const String heroTitleCategory = 'heroTitleCategory';
  static const String heroStatus = 'heroStatus';
  static const String statusType = 'statusType';

  static const String heroSearch = 'Search Hero';
  static const String passwordErrorText = 'Password must be at least 6 characters';
  static const String emailErrorText = 'Invalid email address,pleas Enter valid pattern email';
  static const String phoneerrorText = 'Invalid phone number ,Pleas Enter phone Number 9 digit ';
  static const String passwordConfirmErrorText = 'confirm Password must be match password ';

  static const String FullNameerrorText = 'Pleas Enter Full Name  is required';
}

class Resources {


  // ICON BOTTOM NAVIGATION BAR ASSETS
  static const String avatarImage = 'assets/images/member.png';
  static const String backArrow = 'assets/images/back.png';

  static const String dashboardActive = 'assets/svg/dashboard_active.svg';
  static const String dashboardInactive = 'assets/svg/dashboard_inactive.svg';

  static const String bagActive = 'assets/svg/bag_active.svg';
  static const String bagInactive = 'assets/svg/bag_inactive.svg';

  static const String calendarActive = 'assets/svg/calendar_active.svg';
  static const String calendarInactive = 'assets/svg/calendar_inactive.svg';

  static const String profileActive = 'assets/svg/profile_active.svg';
  static const String profileInactive = 'assets/svg/profile_inactive.svg';


  static const appBarDatahome = const AppBarCustomData(
    title: "Home Page",
    icons: [Icons.notifications],
    iconColor: Colors.white,
    textStyle: AppTheme.headline1,
    showAvatar: true,
    avatarImagePath:Resources.avatarImage,
    toolbarHeight: 400,
  );
  // SVG ASSETS
  static const String icon_outlined = 'assets/svg/icon_outlined.svg';
  static const String on_board_1 = 'assets/svg/on_board_1.svg';
  static const String on_board_2 = 'assets/svg/on_board_2.svg';
  static const String on_board_3 = 'assets/svg/on_board_3.svg';
  static const String clock = 'assets/svg/clock.svg';
  static const String date = 'assets/svg/date.svg';
  static const String trash = 'assets/svg/trash.svg';
  static const String complete = 'assets/svg/complete.svg';

  // LOTTIE ASSETS
  static const String loading = 'assets/lottie/loading.json';
  static const String empty = 'assets/lottie/empty.json';
  static const String error = 'assets/lottie/error.json';
  static const String search = 'assets/lottie/search.json';
  static const String garbage = 'assets/lottie/garbage.json';
}

class FormatDate {
  static const String monthDayYear = 'MMM dd, yyyy';
  static const String deadline = 'HH:mm, MMM dd, yyyy';
  static const String monthYear = 'MMMM, yyyy';
  static const String dayDate = 'EEE, dd';
}

enum StatusType {ON_GOING, COMPLETE}

