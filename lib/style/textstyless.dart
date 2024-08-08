import 'package:flutter/material.dart';
import 'package:taskmanagerapp/style/colors.dart';

TextStyle HeadText(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 32,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle HeadText2(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 17,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
  );
}

TextStyle ButtonTextStyle(){
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'poppins',
    fontSize: 14,
    color: colorWhite,
  );
}