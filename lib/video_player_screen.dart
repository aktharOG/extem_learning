import 'package:extem_learning/sample_data.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/video_card.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late PageController pageController;
  Future<FilePickerResult?>? pickerResult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(height: 10,color: Colors.black,),
              AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: PageView.builder(
                  // controller: pageController,
                  itemCount: videoList.length,
                  itemBuilder: (context, index) =>
                      VideoCard(videoPath: videoList[index]),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(name: "Ch 01: Introduction to Technology",color: headingColor,fontweight: FontWeight.w700,fontsize: 16,),
                    Divider(),
                    HeadingText(name: "Description",color: headingColor,fontweight: FontWeight.w700,fontsize: 16,),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "Technology refers to the application of scientific knowledge, tools, methods, and systems to solve problems, make tasks more efficient, or achieve specific objectives."),
                  ],
                ),
              ),
              
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     children: [
              //       InkWell(
              //         onTap: (){
              //           FilePicker.platform.pickFiles();
              //         },
              //         child: Icon(Icons.upload)),

              //         if(pickerResult!=null)
              //         Text(pickerResult.then((value) => value?.files[0].name))
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  
}
