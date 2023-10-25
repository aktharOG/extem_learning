
import 'package:flutter/material.dart';

class CurstomTextfield extends StatelessWidget {
  final String label, hint, iconPath;
  final TextEditingController controller;
  final bool isPassword;
  final BorderRadius? borderRadius;
  final double? maxLine;
  final bool readOnly;
  final Function()? onTap;
 final Function(String)? onChanged;
  final bool isNumber;

  const CurstomTextfield(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      this.isPassword = false,
       this.borderRadius,
      this.iconPath = "",
      this.maxLine,
      this.readOnly = false,
      this.onTap,
      this.onChanged,
      this.isNumber = false
      
      });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
      //  height: maxLine,
        child: TextField(
          onChanged: onChanged,
          
          onTap: onTap,
          readOnly: readOnly,
        //  maxLines: isPassword ? 1 : maxLine?.toInt()?? 1,
      //    keyboardType: isPassword ? TextInputType.visiblePassword : isNumber?TextInputType.number:null ,
        //  obscureText: isPassword ? loginPro.visibility : false,
          controller: controller,
          decoration: InputDecoration(
             
            enabledBorder:OutlineInputBorder(
              borderSide:  const BorderSide(color: Colors.grey, width: 1.0),
              borderRadius:borderRadius ?? BorderRadius.circular( 10.0),
            ),
              // suffixIcon: iconPath.isEmpty
              //     ? isPassword
              //         ? InkWell(
              //             onTap: loginPro.onVisible,
              //             child: !loginPro.visibility
              //                 ? Icon(
              //                     Icons.visibility_outlined,
              //                     color: appBlue,
              //                   )
              //                 : Icon(
              //                     Icons.visibility_off_outlined,
              //                     color: appBlue,
              //                   ))
              //         : null
              //     : Padding(
              //         padding: const EdgeInsets.only(right: 5),
              //         child: CircleAvatar(child: SvgIcon(path: iconPath)),
              //       ),
              
              disabledBorder:  OutlineInputBorder(borderRadius: borderRadius??BorderRadius.zero),
              border: OutlineInputBorder(borderRadius: borderRadius??BorderRadius.zero),
              focusedBorder: OutlineInputBorder(borderRadius: borderRadius??BorderRadius.zero),
              labelStyle: const TextStyle(color: Colors.white),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
