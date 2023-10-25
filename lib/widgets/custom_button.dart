import 'package:extem_learning/providers/login_provider.dart';
import 'package:extem_learning/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double height;
  final double? width;
  final Color? backgroundColor;
  final bool isGradient;
  final Function()? onPressed;
  final Widget? icon;
  final double fontSize;
  final Color? foregroundColor;
  final double spacing;
  final double elevation;
  final bool isShadow;
  final double radius;

  const CustomButton(
      {super.key,
      this.onPressed,
      required this.label,
      this.height = 45,
      this.width,
      this.backgroundColor,
      this.foregroundColor,
      this.isGradient = true,
      this.icon,
      this.spacing = 0,
      this.fontSize = 18,
      this.elevation = 0,
      this.isShadow = false,
      this.radius = 10});

  @override
  Widget build(BuildContext context) {
    final authPro = Provider.of<LoginProvider>(context);
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: isShadow ? 7 : 0, color: const Color(0x42000000))
          ],
          gradient: isGradient
              ? LinearGradient(colors: [
                  authPro.isVerified
                      ? greengr1
                      : const Color.fromARGB(255, 236, 232, 232),
                  authPro.isVerified
                      ? greengr2
                      : const Color.fromARGB(155, 206, 221, 228),
                  primarygr2
                ])
              : const LinearGradient(
                  colors: [Colors.transparent, Colors.transparent])),
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation),
              backgroundColor: MaterialStateProperty.all(isGradient
                  ? Colors.transparent
                  : backgroundColor ?? primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)))),
          onPressed: onPressed,
          child: Row(
            children: [
              const Spacer(),
              Text(
                label,
                style: TextStyle(
                    fontSize: fontSize,
                    color: foregroundColor,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (icon != null)
                Container(
                  decoration: BoxDecoration(
                      color: authPro.isVerified?greengr1: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.only(right: spacing),
                    child: icon!,
                  ),
                ),
            ],
          )),
    );
  }
}
