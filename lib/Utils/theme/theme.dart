import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/Utils/theme/font-size.dart';

import 'colors.dart';

class CustomTheme {
  static const TextStyle appbarTitleStyle = TextStyle(
      fontSize: FontSize.appBarTitle,
      fontWeight: FontWeight.bold,
      fontFamily: 'Fredoka',
      color: MyColors.colorPrimaryDark);

  static const TextStyle factTextStyle = TextStyle(
      fontSize: FontSize.heading2,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: MyColors.colorText);

  static const TextStyle badgeTextStyle = TextStyle(
      fontSize: FontSize.badge,
      fontWeight: FontWeight.w500,
      fontFamily: 'Fredoka',
      color: MyColors.colorText);

  static const TextStyle itemTitle = TextStyle(
      fontSize: FontSize.itemTitle,
      fontWeight: FontWeight.w500,
      fontFamily: 'Fredoka',
      color: MyColors.colorText);
}
