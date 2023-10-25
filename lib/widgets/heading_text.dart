import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String name;
  final double fontsize;
  final FontWeight fontweight;
  final Color? color;
  final bool align;
  final int? maxlines;
  final TextDirection? textDirection;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  const HeadingText(
      {super.key,
      required this.name,
      this.fontsize = 15,
      this.fontweight = FontWeight.normal,
      this.color,
      this.align = false,
      this.maxlines,
      this.textDirection,
      this.decorationStyle,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          fontSize: fontsize,
          fontWeight: fontweight,
          color: color ?? Colors.white,
          decorationStyle: decorationStyle,
          decoration: decoration,
          decorationColor: Colors.white),
      textAlign: align ? TextAlign.center : TextAlign.start,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      textDirection: textDirection,
    );
  }
}
