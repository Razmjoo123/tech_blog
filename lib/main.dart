import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tech_blog/view/main_screen/article_list_screen.dart';
import 'package:tech_blog/view/main_screen/article_screen.dart';
import 'package:tech_blog/view/main_screen/main_screen.dart';
import 'package:tech_blog/view/my_cats.dart';
import 'package:tech_blog/view/register_intro.dart';
import 'package:tech_blog/view/splash_screen.dart';

import 'component/my_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Blog',
      locale: Locale('fa', 'IR'), //!راست چین کردن کل پروژه
      theme: ThemeData(
        fontFamily: 'dana',
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 100),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              //     textStyle: MaterialStateProperty.resolveWith((states) {
              //   if (states.contains(MaterialState.pressed)) {
              //     return TextStyle(fontSize: );
              //   }
              //   return textTheme.subtitle1;
              // }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(255, 90, 46, 172);
            }
            return SolidColors.primeryColor;
          })),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle),
          subtitle1: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle),
          bodyText1: TextStyle(
              fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
          headline2: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300),
          headline3: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.seeMore,
              fontWeight: FontWeight.w700),
          headline4: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: Color.fromARGB(255, 70, 70, 70),
              fontWeight: FontWeight.w700),
          headline5: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.hintText,
              fontWeight: FontWeight.w700),
          headline6: TextStyle(
              fontFamily: 'dana',
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.w700),
          bodyText2: TextStyle(
            fontFamily: 'dana',
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: ArticelListScreen(), //MainScreen(),
    );
  }
}
