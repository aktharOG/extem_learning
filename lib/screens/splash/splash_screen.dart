import 'dart:async';

import 'package:extem_learning/helpers/navigation_helper.dart';
import 'package:extem_learning/screens/login/login_screen.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Timer(const Duration(seconds: 2),() {
        pushAndRemoveUntil(context,const LoginScreen());
     },);
  }
    
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SvgIcon(path: "bg_k_design"),
          Center(
            child: SvgIcon(path: "logo"),
          ),
        ],
      ),
    );
  }
}
