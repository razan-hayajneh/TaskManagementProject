import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';


class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final AppBarCustomData data;

  const AppBarCustom({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  data.backgroundColor ?? Colors.purple,
        toolbarHeight:    data.toolbarHeight ?? kToolbarHeight,
        title: _buildTitleRow(),

        actions: _buildActionIcons(),
      ),
    );
  }

  Row _buildTitleRow() {
    return Row(
      children: [
        if (data.showAvatar) ...[
          _Avatar(imagePath: data.avatarImagePath),
          SizedBox(width: 20),
        ],
        if (data.leadIcon != null) ...[
          GestureDetector(
            onTap: () {
            },
            child: Icon(
              data.leadIcon,
              color: data.iconColor,
            ),
          ),
          SizedBox(width: 20),
        ],
        _Title(text: data.title, textStyle: data.textStyle),
      ],
    );
  }


  List<_ActionIcon> _buildActionIcons() {
    return data.icons
        .map((iconData) => _ActionIcon(icon: iconData, color: data.iconColor))
        .toList();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _Avatar extends StatelessWidget {
  final String imagePath;

  const _Avatar({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(imagePath),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const _Title({required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTheme.headline1,
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _ActionIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: () {
        // Handle icon tap
      },
    );
  }
}


class AppBarCustomData {
  final String title;
  final IconData? leadIcon;
  final List<IconData> icons;
  final Color iconColor;
  final TextStyle textStyle;
  final bool showAvatar;
  final String avatarImagePath;
  final Color ?backgroundColor;

  final double  ?toolbarHeight;

  const AppBarCustomData(  {


    this.backgroundColor ,
    required this.title,
    this.leadIcon,
    required this.icons,
    required this.iconColor,
    required this.textStyle,
    this.showAvatar = true,
    required this.toolbarHeight,
    this.avatarImagePath = "",
  });

  bool get hasLeadIcon => leadIcon != null;
}
