import 'package:flutter/material.dart';
import 'package:taskmanagerapp/Component/appbar.dart';
import 'package:taskmanagerapp/Component/canceledTaskList.dart';
import 'package:taskmanagerapp/Component/completedTaskList.dart';
import 'package:taskmanagerapp/Component/newtasklist.dart';
import 'package:taskmanagerapp/Component/progressTaskList.dart';
import 'package:taskmanagerapp/style/colors.dart';

import '../../Component/BottomNavigationBar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int TabIndex=0;
  onItemTapped(int index){
    setState(() {
      TabIndex=index;
    });
  }

  final widgetOptions = [
    NewTask(),
    progress(),
    CompletedTask(),
    CanceledTask(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: btmNavigation(TabIndex,onItemTapped),
    );
  }
}
