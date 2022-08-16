import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_text_style.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/view/main_screen/article_screen.dart';

import '../../component/my_component.dart';

class ArticelListScreen extends StatelessWidget {
  ArticelListScreen({super.key});
  ArticleController articleController = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مقالات جدید'),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            child: Obx(() => ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: articleController.articleList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 95,
                      margin: const EdgeInsets.only(bottom: 30),
                      child: InkWell(
                        onTap: () {
                          print(articleController.articleList[index].id!);
                          Get.to(ArticleScreen(
                            id: articleController.articleList[index].id!,
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 95,
                              height: 95,
                              child: CachedNetworkImage(
                                imageUrl:
                                    articleController.articleList[index].image!,
                                imageBuilder: ((context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        )),
                                  );
                                }),
                                placeholder: ((context, url) {
                                  return const Loading();
                                }),
                                errorWidget: (context, url, error) {
                                  return const Icon(
                                    Icons.image_not_supported_outlined,
                                    color: Colors.grey,
                                    size: 50,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    articleController.articleList[index].title!,
                                    style: articleTitleTextStyle,
                                    maxLines: 2,
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        articleController
                                            .articleList[index].author!,
                                        style: articleAuthorTextStyle,
                                      ),
                                      Text(
                                        articleController
                                            .articleList[index].catName!,
                                        style: articleCatnameTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
