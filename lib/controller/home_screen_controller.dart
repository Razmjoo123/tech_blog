import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/data_models.dart';
import 'package:tech_blog/models/podcasts_model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster = PosterModel().obs;
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<TagsModel> tagsList = RxList();
  RxList<PodcastsModel> topPodcastsList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioServise().getMethod(ApiConstant.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcastsList.add(PodcastsModel.fromJson(element));
      });

      poster.value =
          PosterModel.fromJson(response.data['poster']); // چون خروجی یکی است
    }

    response.data['tags'].forEach((element) {
      tagsList.add(TagsModel.fromJson(element));
    });
    loading.value = false;
  }
}
