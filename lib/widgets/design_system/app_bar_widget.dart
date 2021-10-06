

import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback? onPressed;

  final Widget? title;
  final double? elevation;
  final Color? backgroundColor;
  final bool? centerTitle;

  AppBarWidget({Key? key, this.onPressed, this.title, this.elevation, this.backgroundColor, this.centerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed ?? () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: Theme
            .of(context)
            .appBarTheme
            .foregroundColor,),
      ),
      elevation: elevation,
      backgroundColor: backgroundColor,
      title: title,
      centerTitle: centerTitle ?? false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}