import 'package:extem_learning/helpers/assets_help.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnGoingCourseTile extends StatelessWidget {
  const OnGoingCourseTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1, 1),
                            color: Colors.grey.shade300,
                            blurRadius: 15)
                      ]),
                  // height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                          tag: "course-banner",
                        child: Image.asset(
                          seasonBanner,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeadingText(
                              name: "Technology",
                              color: headingColor,
                              fontsize: 20,
                              fontweight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    HeadingText(
                                      name: "4 Chapters",
                                      color: Colors.grey,
                                      fontsize: 15,
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
                                      fontsize: 15,
                                      fontweight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: headingColor,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 20,
                child: Container(
                  width: 150.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        HeadingText(name: "Ongoing Course"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
  }
}