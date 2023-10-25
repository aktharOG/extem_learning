
import 'package:extem_learning/helpers/navigation_helper.dart';
import 'package:extem_learning/sample_data.dart';
import 'package:extem_learning/screens/register/profile_pick_screen.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/custom_button.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class ChooseAgeScreen extends StatefulWidget {
  const ChooseAgeScreen({super.key});

  @override
  State<ChooseAgeScreen> createState() => _ChooseAgeScreenState();
}

class _ChooseAgeScreenState extends State<ChooseAgeScreen> {
  bool selectedvalue = false;

  @override
  Widget build(BuildContext context) {
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
                                  name: "Choose your age",
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
                    Column(
                      children: ageData
                          .asMap()
                          .entries
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  setState(() {
                                    e.value["isChecked"] =
                                        !e.value["isChecked"];
                                    for (var element in ageData) {
                                      if (e.value != element) {
                                        element["isChecked"] = false;
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                       HeadingText(name: e.value["title"]),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: !e.value["isChecked"]
                                                ? Colors.transparent
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: e.value["isChecked"]
                                            ? const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        primaryColor),
                                              )
                                            : null,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                   
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
                           push(context, const ProfilePickScreen());
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
