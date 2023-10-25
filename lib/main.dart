import 'package:extem_learning/providers/home_screen_provider.dart';
import 'package:extem_learning/providers/login_provider.dart';
import 'package:extem_learning/screens/splash/splash_screen.dart';
import 'package:extem_learning/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  systemOrientation;
  systemUIOverlay;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  MaterialApp(
        
          title: 'Flutter Demo',
          theme: lightThemeData,
          
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
