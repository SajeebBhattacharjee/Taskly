import 'package:flutter/material.dart';
import 'package:taskmanagerapp/utility/ReadData.dart';
class progress extends StatefulWidget {
  const progress({super.key});

  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {

  String email = "";
  void initState (){
    CallUserData();
    super.initState();
  }

  CallUserData()async{
    var a =await ReadUserData("email");
    setState(() {
      email = a!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(" Progress $email"),
      ),
    );
  }
}
