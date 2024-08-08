import 'package:flutter/material.dart';
import 'package:taskmanagerapp/style/colors.dart';
import 'package:taskmanagerapp/style/textstyless.dart';
import 'package:fluttertoast/fluttertoast.dart';

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}



Ink SuccessButtonStyle(String ButtonText){
 return Ink(
   decoration: BoxDecoration(color: colorGreen,borderRadius: BorderRadius.circular(6)),
   child: Container(
     height: 45,
     alignment: Alignment.center,

     child: Text(ButtonText ,style: ButtonTextStyle(),),
   ),
 ) ;
}

void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );
}
