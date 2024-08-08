import 'package:flutter/material.dart';
import 'package:taskmanagerapp/utility/ReadData.dart';
class CanceledTask extends StatefulWidget {
  const CanceledTask({super.key});

  @override
  State<CanceledTask> createState() => _CanceledTaskState();
}

class _CanceledTaskState extends State<CanceledTask> {

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
        child: Text(" Canceled $email"),
      ),
    );
  }
}
