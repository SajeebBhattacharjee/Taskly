import 'package:flutter/material.dart';
import 'package:taskmanagerapp/style/ButtonStyle.dart';
import 'package:taskmanagerapp/style/background.dart';
import 'package:taskmanagerapp/style/colors.dart';
import 'package:taskmanagerapp/style/formFieldDecoration.dart';
import 'package:taskmanagerapp/style/textstyless.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanagerapp/api/apiClient.dart';
import '../../utility/ReadData.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
   Map<String,String> FormValues={"otp":""};
  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }
  FormOnSubmit() async{
    if(FormValues['otp']!.length!=6){
      ErrorToast('PIN Requireds !');
    }
    else{
      String? emailAddress=await ReadUserData('EmailVerification');
      bool res=await VerifyOTPRequest(emailAddress,FormValues['otp']);
      if(res==true){
        Navigator.pushNamed(context, '/SetPassword');
      }


    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackgrounnd(context),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 125),
                  child: Text(
                    "Pin Verification",
                    style: HeadText(colorDarkBlue),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "A 6 digit verification pin will be sent to your email address",
                    style: HeadText2(colorLightGrey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PinCodeTextField(appContext: context, length: 6,
                pinTheme: OtpStyle(),
                animationType: AnimationType.fade,
                  enableActiveFill: true,
                  onCompleted: (v){

                  },
                  onChanged: (value){
                        InputOnChange("otp",value);
                  }

                  ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonStyle('Verify'),
                  onPressed: () {
                    FormOnSubmit();
                  },
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an account!",style: HeadText2(Colors.black),),
                    TextButton(onPressed: (){Navigator.pushNamed(context, "/Login");}, child: Text('Login',style: HeadText2(colorGreen),)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
