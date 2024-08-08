
import 'package:flutter/material.dart';
import 'package:taskmanagerapp/api/apiClient.dart';
import 'package:taskmanagerapp/style/ButtonStyle.dart';
import 'package:taskmanagerapp/style/background.dart';
import 'package:taskmanagerapp/style/colors.dart';
import 'package:taskmanagerapp/style/formFieldDecoration.dart';
import 'package:taskmanagerapp/style/textstyless.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  Map<String,String> FormValues = {"email":""};

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['email']!.length==0){
      ErrorToast('Email Required !');
    }
    else{

      bool res=await VerifyEmailRequest(FormValues['email']);
      if(res==true){
        Navigator.pushNamed(context, '/PinVerification');
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
                  padding: const EdgeInsets.only(right: 65),
                  child: Text(
                    "Your Email Address",
                    style: HeadText(colorDarkBlue),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "A 6 Digit Pin Will Be sent To Your Email Address",
                    style: HeadText2(colorLightGrey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (Textvalue){
                    InputOnChange("email",Textvalue);
                  },
                  decoration: AppInputDecoration("Email Address"),
                ),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonStyle('Next'),
                  onPressed: () {
                      FormOnSubmit();
                  },
                ),
                const SizedBox(height: 15,),
                InkWell(
                  onTap: (){Navigator.pushNamed(context, '/Login');},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have an account!",style: HeadText2(Colors.black),),
                      Text('  Login',style: HeadText2(colorGreen),),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
