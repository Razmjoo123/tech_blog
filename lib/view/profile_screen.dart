import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_strings.dart';

import '../component/my_component.dart';
import '../component/my_text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 65),
          Assets.images.avatar.image(height: 105),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.bluePen.image(height: 20),
              const SizedBox(width: 10),
              const Text(
                MyStrings.imageProfileEdit,
                style: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 12,
                    color: SolidColors.seeMore,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Text(
            'فاطمه امیری',
            style: profileNameTextStyle,
          ),
          Text(
            'information@gmail.com',
            style: textTheme.bodyText2,
          ),
          const SizedBox(height: 40),
          const TechDivider(),
          InkWell(
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  MyStrings.myFavBlog,
                  style: textTheme.bodyText2,
                ),
              ),
            ),
            onTap: () {},
          ),
          const TechDivider(),
          InkWell(
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  MyStrings.myFavPodcast,
                  style: textTheme.bodyText2,
                ),
              ),
            ),
            onTap: () {},
          ),
          const TechDivider(),
          InkWell(
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  MyStrings.logOut,
                  style: textTheme.bodyText2,
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
