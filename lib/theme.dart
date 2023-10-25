import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color primaryColor = Color(0xff015C8B);

const Color primarygr1 = Color.fromARGB(155, 1, 93, 139);
const Color primarygr2 = Color.fromARGB(54, 1, 93, 139);

const Color greengr1 = Color(0xff72C96B);
const Color greengr2 = Color.fromARGB(146, 155, 200, 152);


const Color headingColor = Color(0xff002D44);

MaterialColor primarySwatch = const MaterialColor(0xff015C8B, {
  50: Color(0xff015C8B),
  100: Color(0xff015C8B),
  200: Color(0xff015C8B),
  300: Color(0xff015C8B),
  400: Color(0xff015C8B),
  500: Color(0xff015C8B),
  600: Color(0xff015C8B),
  700: Color(0xff015C8B),
  800: Color(0xff015C8B),
  900: Color(0xff015C8B),
});

ThemeData lightThemeData = ThemeData(
    primaryColor: primaryColor,
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: "PlusJakartaSans",
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: primaryColor),
    cardColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Colors
        .white),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: Colors.grey, width: 0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    tabBarTheme: const TabBarTheme(
        labelColor: Colors.black, unselectedLabelColor: Colors.grey),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: primaryColor)),
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor)
        .copyWith(primary: primarySwatch, background: primaryColor));

var systemUIOverlay =
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
));

var systemOrientation = SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
