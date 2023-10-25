import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class SingleUpcomingCousrseItem extends StatelessWidget {
  final Map data;
  const SingleUpcomingCousrseItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  data["image"],
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  decoration:
                      BoxDecoration(color: Colors.transparent, boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        color: Colors.transparent.withOpacity(0.2),
                        blurRadius: 10)
                  ]),
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  child: const SvgIcon(
                    path: "lock_icon",
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(
                name: data["title"],
                fontsize: 17,
                fontweight: FontWeight.bold,
                color: headingColor,
              ),
              SizedBox(
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
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 18,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
