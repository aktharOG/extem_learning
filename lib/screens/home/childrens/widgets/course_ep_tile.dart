import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class CourseEpisodeTile extends StatelessWidget {
  final bool isLocked;
  const CourseEpisodeTile({super.key,this.isLocked=false});

  @override
  Widget build(BuildContext context) {
    return  Container(
                // height: 110,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        color: Colors.grey.shade300,
                        blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  title: const HeadingText(
                    name: "Ch 01: Introduction to Technology",
                    color: headingColor,
                    fontweight: FontWeight.bold,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 3 / 5.5,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              HeadingText(
                                name: "4 Chapters",
                                color: Colors.grey,
                                fontsize: 12,
                                fontweight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 3,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HeadingText(
                                name: "24 Episodes",
                                color: Colors.grey,
                                fontsize: 12,
                                fontweight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  trailing: isLocked?const SvgIcon(path: "lock_icon"): const CircleAvatar(
                    radius: 23,
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ));
  }
}