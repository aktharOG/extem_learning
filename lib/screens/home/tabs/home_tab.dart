import 'package:dots_indicator/dots_indicator.dart';
import 'package:extem_learning/helpers/assets_help.dart';
import 'package:extem_learning/helpers/navigation_helper.dart';
import 'package:extem_learning/sample_data.dart';
import 'package:extem_learning/screens/home/childrens/course_details_screen.dart';
import 'package:extem_learning/screens/home/widgets/ongoing_course_tile.dart';
import 'package:extem_learning/screens/home/widgets/single_upcoming_course_item.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SvgIcon(path: "menu_icon"),
                SizedBox(
                  height: 250, //

                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Image.asset(slider),
                        DotsIndicator(
                          dotsCount: 3,
                          position: index,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //! ongoing ...... . . 
          GestureDetector(
            onTap: (){
                push(context, const CourseDetailScreen());
            },
            child: const OnGoingCourseTile()),

          //! upcoming ..... . .
       
          Hero(
            tag: "login-txt-ln",
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    child: HeadingText(
                      name: "Upcoming Courses",
                      color: Colors.grey,
                      align: true,
                      fontweight: FontWeight.bold,
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

           
             ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index){
                final data = categoryData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SingleUpcomingCousrseItem(data: data),
                );
              },)
             
        ],
      ),
    ));
  }
}
