import 'package:extem_learning/widgets/heading_text.dart';
import 'package:flutter/material.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: HeadingText(name: "WalletTab"),),);
  }
}