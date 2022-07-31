import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_strings.dart';

import '../component/my_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
        children: [
          //کل محتویات پوستر و نوشته های روی آن
          HomePagePoster(size: size, textTheme: textTheme),
          const SizedBox(
            height: 45,
          ),
          //هشتگ ها
          HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(
            height: 35,
          ),
          //آیکن و تیتر مشاهده داغ ترین نوشته ها
          SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
          //لیست داغ ترین بلاگ ها
          HomePageBlogList(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(
            height: 30,
          ),
          //آیکن و تیتر مشاهده داغ ترین پادکست ها
          SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
          //لیست داغ ترین پادکست ها
          HomePagePodcastList(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }
}

//! لیست داغ ترین پادکست ها
class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: podcastList.getRange(0, 5).length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == 0 ? bodyMargin : 15,
            ),
            child: Column(
              children: [
                //پوستر
                SizedBox(
                  width: size.width / 2.6,
                  height: size.height / 5.8,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(podcastList[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                              colors: GradiantColors.blogPost,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0, 0.5]),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 18,
                        child: Text(
                          podcastList[index].writer,
                          style: textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                //موضوع
                Text(
                  podcastList[index].title,
                  style: textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.right,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

//! آیکن و تیتر مشاهده داغ ترین پادکست ها
class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          Assets.icons.microphonicon.image(
            width: 20,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

//! لیست داغ ترین بلاگ ها
class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            //تصویر لیست بلاگ ها
            child: Column(
              children: [
                //تصویر بلاگ
                SizedBox(
                  width: size.width / 2.6,
                  height: size.height / 5.8,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(blogList[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            colors: GradiantColors.blogPost,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0, 0.5],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textTheme.subtitle1,
                            ),
                            Text(
                              blogList[index].views,
                              style: textTheme.subtitle1,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //تیتر بلاگ
                SizedBox(
                  width: size.width / 2.6,
                  height: size.height / 20,
                  child: Text(
                    blogList[index].title,
                    style: textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

//! آیکن و تیتر مشاهده داغ ترین نوشته ها
class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          Assets.icons.bluePen.image(height: 20, color: SolidColors.seeMore),
          //روش عادی
          // const ImageIcon(
          //     AssetImage(
          //       'assets/icons/blue_pen.png',
          //     ),
          //     color: SolidColors.seeMore),
          const SizedBox(
            width: 5,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

//!هشتگ ها
class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 8, 8),
              child: MainTags(textTheme: textTheme,index:index),
            );
          })),
    );
  }
}


//!پوستر صفحه اصلی
class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          // تصویر پوستر اصلی
          Container(
            width: size.width / 1.25,
            height: size.height / 4.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(
                  homePagePosterMap['imageAssets'],
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  colors: GradiantColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.95, 1]),
            ),
          ),
          //نوشته های روی پوستر
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        homePagePosterMap['writer'] +
                            ' - ' +
                            homePagePosterMap['date'],
                        style: textTheme.subtitle1,
                      ),
                      //تعداد نمایش
                      Row(
                        children: [
                          Text(
                            homePagePosterMap['view'],
                            style: textTheme.subtitle1,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.remove_red_eye_sharp,
                            color: SolidColors.posterSubTitle,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //تیتر اصلی
                  Text(
                    homePagePosterMap['title'],
                    style: textTheme.headline1,
                    softWrap: false,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
