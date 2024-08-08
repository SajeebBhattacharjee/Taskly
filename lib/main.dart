import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagerapp/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanagerapp/screen/onboarding/loginScreen.dart';
import 'package:taskmanagerapp/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmanagerapp/screen/onboarding/registrationScreen.dart';
import 'package:taskmanagerapp/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanagerapp/screen/onboarding/splashScreen.dart';
import 'package:taskmanagerapp/screen/task/HomeScreen.dart';
import 'package:taskmanagerapp/Component/newtasklist.dart';
import 'package:taskmanagerapp/utility/ReadData.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  String ? token = await ReadUserData('token');
  if(token==null) {
    runApp(Myapp('/Login'));
  }
  else{
    runApp(Myapp('/'));
  }
}
class Myapp extends StatelessWidget {

  final FirstRoute;
   Myapp(this.FirstRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager",

      initialRoute: FirstRoute,
      routes: {
        '/':(context)=>HomeScreen(),
        '/Login':(context)=>LoginScreen(),
        '/Registration':(context)=>RegistrationScreen(),
        '/EmailVerification':(context)=>EmailVerificationScreen(),
        '/PinVerification':(context)=>PinVerificationScreen(),
        '/SetPassword':(context)=>SetPasswordScreen(),
        '/NewTaskList':(context)=>NewTask(),
      },
    );
  }
}
