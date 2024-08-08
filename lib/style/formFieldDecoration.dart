import 'package:flutter/material.dart';
import 'package:taskmanagerapp/style/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
InputDecoration AppInputDecoration(label){

  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: colorGreen,width: 1),
    ),
        fillColor: colorWhite,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorWhite,
        width: 0,
      )
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    labelText: label
  );
}




//OTP PIN field

PinTheme OtpStyle(){
  return PinTheme(
      inactiveColor: colorLight,
      inactiveFillColor: colorWhite,

      activeColor: colorWhite,
      activeFillColor: colorWhite,

      selectedColor: colorGreen,
      selectedFillColor: colorGreen,
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(6),
     fieldHeight: 55,
     borderWidth: 0.5,
     fieldWidth: 45,


  );
}

