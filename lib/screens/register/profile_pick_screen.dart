import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:extem_learning/providers/login_provider.dart';
import 'package:extem_learning/screens/register/choose_category_screen.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/custom_button.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../helpers/navigation_helper.dart';

class ProfilePickScreen extends StatefulWidget {
  const ProfilePickScreen({super.key});

  @override
  State<ProfilePickScreen> createState() => _ChooseAgeScreenState();
}

class _ChooseAgeScreenState extends State<ProfilePickScreen> {
  bool selectedvalue = false;

  @override
  Widget build(BuildContext context) {
    final authPro = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          const SvgIcon(path: "bg_k_desiign_white"),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Hero(
                      tag: "h-ing",
                      child: Material(
                        child: HeadingText(
                          name: "Getting Started!",
                          fontsize: 30,
                          color: Colors.white,
                          align: true,
                          fontweight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Hero(
                      tag: "login-txt-ln",
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Material(
                                child: HeadingText(
                                  name: "Add Profile Picture",
                                  color: Colors.white,
                                  align: true,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          authPro.pickProfileIMG();
                        },
                        child: DottedBorder(
                          color: Colors.white,
                          dashPattern: const [15],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          padding: const EdgeInsets.all(6),
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                  color: primaryColor,
                                  height: 300.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: authPro.file != null
                                      ? Image.file(
                                          File(authPro.file!.path),
                                          fit: BoxFit.cover,
                                        )
                                      : const Center(
                                          child:
                                              SvgIcon(path: "upload-img-icon"),
                                        ))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                        onTap: () {
                          push(context, const ChooseCategoryScreen());
                        },
                        child: const HeadingText(name: "Skip for Now")),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Hero(
                    tag: "btn-10",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 25,
                        ),
                        height: 55,
                        label: "Next",
                        fontSize: 20,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          push(context, const ChooseCategoryScreen());
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
