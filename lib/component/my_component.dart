import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../gen/assets.gen.dart';
import 'my_colors.dart';
import 'my_text_style.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: SolidColors.dividerColor,
      indent: 70,
      endIndent: 70,
      thickness: 1,
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({Key? key, required this.textTheme, required this.index})
      : super(key: key);

  final TextTheme textTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            colors: GradiantColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Assets.icons.hashtagicon.image(color: Colors.white, width: 14),
            //روش عادی
            // const ImageIcon(
            //   AssetImage('assets/icons/hashtagicon.png'),
            //   color: Colors.white,
            //   size: 14,
            // ),
            const SizedBox(width: 5),
            Text(Get.find<HomeScreenController>().tagsList[index].title!,
                style: textTheme.headline2),
          ],
        ),
        // ),
      ),
    );
  }
}

//!فعلا این متد کار نمیکنه یعنی همیشه فالس میده
myLaunchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    log('Could not launch $url');
  }
}

//! Loading SpinKit
class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitFoldingCube(
      color: SolidColors.primeryColor,
      size: 32,
    );
  }
}

//* AppBarr
PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Center(
              child: Text(
                title,
                style: appBarTextStyle,
              ),
            ),
          )
        ],
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: SolidColors.primeryColor.withAlpha(100),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.keyboard_arrow_right,
            size: 35,
          ),
        ),
      ),
    ),
  );
}
