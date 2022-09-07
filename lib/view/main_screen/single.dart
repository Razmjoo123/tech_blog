import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_text_style.dart';
import 'package:tech_blog/controller/single_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/article_model.dart';

class SingleArticleScreen extends StatelessWidget {
  SingleArticleScreen(
      ); //required this.article, required this.index
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  // {super.key}
  @override
  Widget build(BuildContext context) {
    singleArticleController.getArticleInfo();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  //poster
                  Container(
                    width: double.infinity,
                    height: 250,
                    //TODO forTest
                    child: const Image(
                      image: AssetImage('assets/images/poster_test.png'),
                      fit: BoxFit.cover,
                      // child: CachedNetworkImage(
                      //   imageUrl: 'articleScreenController.articleList[0].image!',
                      //   fit: BoxFit.cover,
                      //   placeholder: (context, url) => Loading(),
                      // errorWidget: (context, url, error) => const Icon(
                      //   Icons.image_not_supported_outlined,
                      //   color: Colors.grey,
                      //   size: 50,
                      // ),
                    ),
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: GradiantColors.articleImageCoverGradiant,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.4, 0.9, 1]),
                    ),
                  ),

                  //ایکن های بالا
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Get.close(0),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.bookmark_outline_rounded,
                          size: 28,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.share,
                          size: 28,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //title
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: AutoSizeText(
                  '۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید',
                  // 'articleScreenController.articleList[0].title!',
                  style: titlesTextStyle,
                  maxFontSize: 16,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Image(
                      image: AssetImage('assets/images/avatar.png'),
                      height: 50,
                    ),
                    SizedBox(width: 16),
                    Text('فاطمه امیری'),
                    SizedBox(width: 16),
                    Text('تاریخ'),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: HtmlWidget(
                  '''
<p >Color text and <span style="color:limegreen;">another color</span>, and now back to the same. Oh, and here's a <span style="background-color:PaleGreen;">different background color</span> just in case you need it!</p>
''',
                  textStyle: appBarTextStyle,
                  enableCaching: true,
                  onLoadingBuilder: (context, element, loadingProgress) =>
                      const Loading(),
                ),
              ),
              Tags(),
              const SizedBox(height: 10),
              TopVisited(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  //! هشتگ ها
  Widget Tags() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(8, 8, index == 0 ? 8 : 8, 8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'مقاله',
                      // style: articleAuthorTextStyle,
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }

  //! لیست داغ ترین بلاگ ها
  Widget TopVisited() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          child: Text(
            'نوشته های مرتبط',
            style: topVisitedTitleTextStyle,
          ),
        ),
        SizedBox(
          height: Get.height / 4.1,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: singleArticleController.relatedList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? 20 : 15),
                  //تصویر لیست بلاگ ها
                  child: Column(
                    children: [
                      //تصویر بلاگ
                      SizedBox(
                        width: Get.width / 2.9,
                        height: Get.height / 6.2,
                        child: Stack(
                          children: [
                            Container(
                              child: CachedNetworkImage(
                                imageUrl:
                                    // ignore: todo
                                    //TODO کد خطا داره
                                    // 'https://techblog.sasansafari.com/Techblog/assets/upload/nimages/podcast/images/20220707225803.jpg',
                                    singleArticleController
                                        .relatedList[index].image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => const Loading(),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 45,
                                  color: Colors.grey,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    singleArticleController
                                        .relatedList[index].author!,
                                    style: articleAuthorTextStyle,
                                  ),
                                  Text(
                                    singleArticleController
                                        .relatedList[index].view!,
                                    style: articleAuthorTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      //تیتر بلاگ
                      SizedBox(
                        width: Get.width / 2.9,
                        height: Get.height / 20,
                        child: Text(
                          singleArticleController.relatedList[index].title!,
                          style: articleTitleTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
