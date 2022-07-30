import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/interface/colors.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 60,
    width: 50,
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: AppColor.primaryColorDark,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Text(
        character,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 34.0,
        ),
      ),
    ),
  );
}
