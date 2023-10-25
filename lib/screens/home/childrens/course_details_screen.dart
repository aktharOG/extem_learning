import 'package:extem_learning/helpers/assets_help.dart';
import 'package:extem_learning/helpers/navigation_helper.dart';
import 'package:extem_learning/screens/home/childrens/chapter_details_screen.dart';
import 'package:extem_learning/screens/home/childrens/widgets/course_ep_tile.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: "course-banner",
                child: Material(
                  child: Stack(
                    children: [
                      Image.asset(
                        seasonBanner,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 20,
                        top: 50,
                        child: SizedBox(
                          height: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  pop(context);
                                },
                                child: Container(

                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                //  padding: const EdgeInsets.all(5),
                                  child: const Icon(
                                    
                                    Icons.arrow_back_ios_sharp,
                                    color: primaryColor,
                                   size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              const HeadingText(
                                name: "Technology",
                                fontweight: FontWeight.bold,
                                fontsize: 25,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),

            // playable 
            const CourseEpisodeTile(),
            // locked

            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10,),
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                 onTap: (){
                  push(context, const ChapterDetailsScreen());
                 },
                child: const CourseEpisodeTile(isLocked: true,)),),

               SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
