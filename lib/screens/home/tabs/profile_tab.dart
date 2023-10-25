import 'package:extem_learning/widgets/heading_text.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: HeadingText(name: "ProfileTab"),),);
  }
}