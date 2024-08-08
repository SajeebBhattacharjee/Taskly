import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



 SvgPicture ScreenBackgrounnd(context){

  return SvgPicture.asset(
    'assets/background.svg',
    alignment : Alignment.center,
    width : MediaQuery.of(context).size.width,
    height : MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}