import 'package:extem_learning/helpers/assets_help.dart';
import 'package:extem_learning/providers/home_screen_provider.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: homePro.tabs[homePro.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: homePro.currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          onTap: (value) {
            homePro.onChangeTab(value);
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Column(
                  children: [
                    SvgIcon(
                        path: homePro.currentIndex == 0
                            ? "media_icon"
                            : "media_icon_un"),
                  ],
                ),
                label: "Home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: SvgIcon(
                    path: homePro.currentIndex == 1
                        ? "earnings_icon"
                        : "earning_icon_un"),
                label: "Ernings"),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: SvgIcon(
                    path: homePro.currentIndex == 2
                        ? "bell_icon"
                        : "bell_icon_un"),
                label: "home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: CircleAvatar(
                  radius: homePro.currentIndex == 3 ? 25 : 20,
                  backgroundImage: AssetImage(profileImage),
                ),
                label: "home"),
          ]),
    );
  }
}
