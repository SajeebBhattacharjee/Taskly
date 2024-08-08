import 'package:flutter/material.dart';
import 'package:taskmanagerapp/style/ButtonStyle.dart';
import 'package:taskmanagerapp/style/background.dart';
import 'package:taskmanagerapp/style/colors.dart';
import 'package:taskmanagerapp/style/formFieldDecoration.dart';
import 'package:taskmanagerapp/style/textstyless.dart';

import '../../api/apiClient.dart';
import '../../utility/ReadData.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  Map<String,String> FormValues={"email":"", "OTP":"","password":"","cpassword":""};
  initState() {
    callStoreData();
    super.initState();
  }

  callStoreData() async {
    String? OTP= await ReadUserData("OTPVerification");
    String? Email= await ReadUserData("EmailVerification");
    InputOnChange("email", Email);
    InputOnChange("OTP", OTP);
  }

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }
  FormOnSubmit() async{
    if(FormValues['password']!.length==0){
      ErrorToast('Password Required !');
    }
    else if(FormValues['password']!=FormValues['cpassword']){
      ErrorToast('Confirm password should be same!');
    }
    else{
      bool res=await SetPasswordRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
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
                  padding: const EdgeInsets.only(right: 150),
                  child: Text(
                    "Set Password",
                    style: HeadText(colorDarkBlue),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                    "Minimum Length of Password should be 8.",
                    style: HeadText2(colorLightGrey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (Textvalue){
                    InputOnChange('password', Textvalue);
                  },
                  decoration: AppInputDecoration("Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (Textvalue){
                    InputOnChange('cpassword', Textvalue);
                  },
                  decoration: AppInputDecoration("Confirm Password"),obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonStyle('Confirm'),
                  onPressed: () {
                    FormOnSubmit();
                  },
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an account!",style: HeadText2(Colors.black),),
                    TextButton(onPressed: (){}, child: Text('Signup',style: HeadText2(colorGreen),)),
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
