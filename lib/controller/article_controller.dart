import 'package:get/get.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import '../component/api_constant.dart';
import '../services/dio_service.dart';

//* مربوط به ضفحه نمایش مقالات

class ArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getListItems();
  }

  getListItems() async {
    loading.value = true;
    //TODO get userid from getstorage ->ApiConstant.getArticleList+userid
    var response = await DioServise().getMethod(ApiConstant.getArticleList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}

//* مربوط به ضفحه نمایش هر مقاله
class ArticleScreenController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;
  RxBool isFavorite = false.obs;
  RxList<ArticleModel> relatedList = RxList();
  RxList<TagsModel> tagsList = RxList();
  @override
  // onInit() {
  //   super.onInit();
  //   getArticle();
  // }

  getArticle(String id) async {
    loading.value = true;
    var response = await DioServise().getMethod(ApiConstant.getArticle + id);
    if (response.statusCode == 200) {
      print(response.data['info']);
      response.data['info'].forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      isFavorite = response.data['isFavorite'];
      response.data['related'].forEach((element) {
        relatedList.add(ArticleModel.fromJson(element));
      });
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
