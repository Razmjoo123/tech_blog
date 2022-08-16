import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_text_style.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/models/article_model.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen(
      {required this.id}); //required this.article, required this.index
  final String id;
  ArticleScreenController articleScreenController =
      Get.put(ArticleScreenController());

  // {super.key}
  @override
  Widget build(BuildContext context) {
    articleScreenController.getArticle(id);
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
                    child: CachedNetworkImage(
                      imageUrl: 'articleScreenController.articleList[0].image!',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Loading(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 50,
                      ),
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
                padding: const EdgeInsets.all(16),
                child: AutoSizeText(
                  'articleScreenController.articleList[0].title!',
                  style: titlesTextStyle,
                  maxFontSize: 16,
                  maxLines: 2,
                ),
              ),
              Row(),
              Text(
                '',
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
