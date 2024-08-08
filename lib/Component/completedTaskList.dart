import 'package:flutter/material.dart';
import 'package:taskmanagerapp/utility/ReadData.dart';
class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {

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
        child: Text(" Completed $email"),
      ),
    );
  }
}
