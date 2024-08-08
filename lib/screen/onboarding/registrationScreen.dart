
import 'package:flutter/material.dart';
import 'package:taskmanagerapp/style/ButtonStyle.dart';
import 'package:taskmanagerapp/style/background.dart';
import 'package:taskmanagerapp/style/colors.dart';
import 'package:taskmanagerapp/style/formFieldDecoration.dart';
import 'package:taskmanagerapp/style/textstyless.dart';

import '../../api/apiClient.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map<String,String> FormValues ={"email":"","firstName":"","lastName":"","mobile":"","password":"","photo":"","cpassword":""};
  bool Loading=false;

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }
  FormOnSubmit() async{

     if(FormValues['firstName']!.isEmpty){
      ErrorToast('First Name Required !');
    }



    else if(FormValues['lastName']!.isEmpty){
      ErrorToast('lastName Required !');
    }

    else if(FormValues['mobile']!.isEmpty){
      ErrorToast('mobile Required !');
    }
     else if(FormValues['email']!.isEmpty){
       ErrorToast('Email Required !');
     }
    else if(FormValues['password']!.isEmpty){
      ErrorToast('Password Required !');
    }
    else if(FormValues['cpassword']!=FormValues['password']){
      ErrorToast('ConfirmPassword Should be the same !');
    }
    else{
      bool res22=await RegistrationRequest(FormValues);
      if(res22==true){
        Navigator.pushNamedAndRemoveUntil(context, "/Login",(route)=>false);
      }
      else{
        print("hello");
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //reverse: true,
        child: Stack(
          children: [
            ScreenBackgrounnd(context),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.only(right: 148),
                    child: Text(
                      "Join With Us",
                      style: HeadText(colorDarkBlue),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: Text(
                      "Start your journey with TasKer",
                      style: HeadText2(colorLightGrey),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("firstName",Textvalue);
                    },
                    decoration: AppInputDecoration("First Name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("lastName",Textvalue);
                    },
                    decoration: AppInputDecoration("Last Name"),
                  ),const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("mobile",Textvalue);
                    },
                    decoration: AppInputDecoration("Mobile"),
                  ),const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("email",Textvalue);
                    },
                    decoration: AppInputDecoration("Email"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("password",Textvalue);
                    },
                    decoration: AppInputDecoration("Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("cpassword",Textvalue);
                    },
                    decoration: AppInputDecoration("Confirm Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonStyle('Registration'),
                    onPressed: () {FormOnSubmit();},
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){Navigator.pushNamed(context, '/Login');},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account!",style: HeadText2(Colors.black),),
                        Text('  Login',style: HeadText2(colorGreen),),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}