import 'package:flutter/material.dart';
import 'package:login/constans/colors.dart';

const TextStyle descriptionStyle = TextStyle(
  color: textLite,
  fontSize: 12,
  fontWeight: FontWeight.w200,
);

const textInputDecoration = InputDecoration(
  hintText: "Email",
  hintStyle: TextStyle(color: textLite),
  fillColor: bgBlack,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: mainYellow,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: mainYellow,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
);
