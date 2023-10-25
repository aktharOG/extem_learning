import 'package:extem_learning/helpers/navigation_helper.dart';
import 'package:extem_learning/sample_data.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/video_card.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:video_player/video_player.dart';

class ChapterDetailsScreen extends StatelessWidget {
  const ChapterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: InkWell(
            onTap: () {
              pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const HeadingText(
          name: "Ch 01: Introduction to Technology",
          color: headingColor,
          fontweight: FontWeight.bold,
          fontsize: 17,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1, 1),
                            blurRadius: 10,
                            color: Colors.grey.shade400)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              AspectRatio(
                                  aspectRatio: 16.0 / 9.0,
                                  child: VideoCard(
                                    videoPath: videoList[index],
                                    showControlls: false,
                                    autoPlay: false,
                                  )),
                                  AspectRatio(aspectRatio: 16.0 / 9.0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent.withOpacity(0.25),
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundColor: primaryColor,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 60.0,
                              semanticLabel: 'Play',
                            ),
                          ),
                        ),
                                  ),
                                  )
                            ],
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: HeadingText(
                          name: "Ep 01: Definition of Technology",
                          color: headingColor,
                          fontweight: FontWeight.bold,
                          fontsize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: headingColor,
                            ),
                            const Expanded(
                                child: LinearProgressIndicator(
                              value: 0.5,
                            )),
                            SizedBox(
                              width: 5.w,
                            ),
                            const HeadingText(
                              name: "13:45 / 28:16",
                              color: headingColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
