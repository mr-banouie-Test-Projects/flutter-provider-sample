import 'package:fluttertest/Utils/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class DefaultButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? mt;
  final double? ml;
  final double? mr;
  final double? mb;
  final double? pt;
  final double? pb;
  final double? pl;
  final double? pr;
  final double? fSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? height;

  const DefaultButton(
      {Key? key,
      this.text,
      this.onPressed,
      this.mt,
      this.ml,
      this.mr,
      this.mb,
      this.pt,
      this.pb,
      this.pl,
      this.pr,
      this.fSize,
      this.backgroundColor,
      this.borderColor,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, mt ?? 50, mr ?? 20, mb ?? 50),
      child: Padding(
        padding:
            EdgeInsets.only(left: pl ?? 30, right: pr ?? 30, top: 0, bottom: 0),
        child: Container(
          height: height ?? 50,
          decoration: BoxDecoration(
            color: backgroundColor ?? MyColors.colorSecondary,
            border: Border.all(
              width: borderColor != null ? 2 : 0, //
              color: borderColor ?? MyColors.colorAccentLight,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                text!,
                style: TextStyle(
                    color: borderColor ?? MyColors.colorAccentLight,
                    fontSize: fSize ?? 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
