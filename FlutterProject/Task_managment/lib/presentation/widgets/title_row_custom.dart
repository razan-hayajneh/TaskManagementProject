
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
class TitleRow extends StatelessWidget {
  final String title;
  final String seeAllText;
  final VoidCallback onTap;

  const TitleRow({
    required this.title,
    required this.seeAllText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTheme.headline1,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              seeAllText,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: AppTheme.redDarkPastel,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
