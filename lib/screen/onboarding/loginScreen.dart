import 'package:flutter/material.dart';
import 'package:taskmanagerapp/style/ButtonStyle.dart';
import 'package:taskmanagerapp/style/background.dart';
import 'package:taskmanagerapp/style/colors.dart';
import 'package:taskmanagerapp/style/formFieldDecoration.dart';
import 'package:taskmanagerapp/style/textstyless.dart';
import '../../api/apiClient.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Map<String,String> FormValues={"email":"", "password":""};
  bool Loading=false;

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['email']!.isEmpty){
      ErrorToast('Email Required !');
    }
    else if(FormValues['password']!.isEmpty){
      ErrorToast('Password Required !');
    }
    else{
      setState(() {Loading=true;});
      bool res=await LoginRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/NewTaskList", (route) => false);
      }
      else{
        setState(() {Loading=false;});
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
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Get Started with",
                      style: HeadText(colorDarkBlue),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Complete Your Tasks in TasKers",
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
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("password",Textvalue);
                    },
                    decoration: AppInputDecoration("Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonStyle('Login'),
                    onPressed: () {
                      FormOnSubmit();
                    },
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/EmailVerification");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forgot Password?",style: HeadText2(colorLightGrey),),

                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/Registration');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have an account!",style: HeadText2(colorDarkBlue),),
                         Text(' Sign up',style: HeadText2(colorGreen),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
