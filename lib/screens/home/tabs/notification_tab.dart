import 'package:extem_learning/widgets/heading_text.dart';
import 'package:flutter/material.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: HeadingText(name: "NotificationTab"),),);
  }
}