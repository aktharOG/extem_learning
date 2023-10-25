import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(),
              const SizedBox(
                height: 50,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/profile-img.png",
                    height: 200,
                    width: 188,
                  ),
                  const SvgIcon(path: "frame", height: 200),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
