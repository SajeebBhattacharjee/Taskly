import 'package:flutter/material.dart';
import 'package:taskmanagerapp/style/background.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanagerapp/style/colors.dart';
import 'package:taskmanagerapp/style/textstyless.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackgrounnd(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Container(
                        width: 180,
                        height: 170,
                        child: Lottie.asset('animations/logo.json')),
                  ),

                ),
              ),
              Text("TasKers",style: HeadText(colorGreen),)
            ],
          )
        ],
      ),
    );
  }
}
