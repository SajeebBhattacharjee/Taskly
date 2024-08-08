import 'package:flutter/material.dart';
import 'package:taskmanagerapp/utility/ReadData.dart';
class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {

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
        child: Text(" new $email"),
      ),
    );
  }
}
