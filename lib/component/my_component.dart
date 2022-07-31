import 'package:flutter/material.dart';
import 'package:tech_blog/models/fake_data.dart';
import '../gen/assets.gen.dart';
import 'my_colors.dart';

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
        child: Stack(
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Positioned(
              right: 0,
              top: 10,
              child: Assets.icons.hashtagicon
                  .image(color: Colors.white, width: 14),
            ),
            //روش عادی
            // const ImageIcon(
            //   AssetImage('assets/icons/hashtagicon.png'),
            //   color: Colors.white,
            //   size: 14,
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Center(
                  child:
                      Text(tagList[index].title, style: textTheme.headline2)),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
