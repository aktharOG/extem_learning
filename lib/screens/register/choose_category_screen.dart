import 'package:extem_learning/helpers/navigation_helper.dart';
import 'package:extem_learning/sample_data.dart';
import 'package:extem_learning/screens/home/home_screen.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/custom_button.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCategoryScreen extends StatefulWidget {
  const ChooseCategoryScreen({super.key});

  @override
  State<ChooseCategoryScreen> createState() => _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends State<ChooseCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showModalBottomSheet(
        
        enableDrag: false,
        isDismissible: false,
        useSafeArea: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => const CategorySheet(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [],
      ),
    );
  }
}

class CategorySheet extends StatefulWidget {
  const CategorySheet({super.key});

  @override
  State<CategorySheet> createState() => _CategorySheetState();
}

class _CategorySheetState extends State<CategorySheet> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        pop(context);
        pop(context);
        return true;
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const HeadingText(
                    name: "Level 1: Choose categories",
                    color: headingColor,
                    fontsize: 20,
                    fontweight: FontWeight.bold,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 15.h,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryData.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1 / 1.5,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final data = categoryData[index];
                      return InkWell(
                        onTap: () {
                          setState(() {});
                          data["isSelected"] = !data["isSelected"];
                        },
                        child: categoryItem(
                            title: data["title"],
                            image: data["image"],
                            isSelected: data["isSelected"]),
                      );
                    },
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
                            child: HeadingText(
                              name: "Mandatory Categories",
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
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          final data = categoryData[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: categoryItem(
                                locked: true,
                                title: data["title"],
                                image: data["image"],
                                isSelected: data["isSelected"]),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CustomButton(
                      height: 55,
                      label: "Go to course's",
                      isGradient: false,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        push(context, const HomeScreen());
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

Widget categoryItem(
    {required String title,
    required String image,
    required bool isSelected,
    bool locked = false}) {
  return Column(
    children: [
      Stack(
        children: [
          Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: isSelected ? Border.all(color: Colors.green) : null,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.3)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              )),
          if (isSelected)
            Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              width: 100,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(Icons.check),
                ),
              ),
            ),
          if (locked)
            Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              width: 100,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
      SizedBox(
        height: 5.h,
      ),
      HeadingText(
        name: title,
        color: headingColor,
        fontweight: FontWeight.bold,
      )
    ],
  );
}
