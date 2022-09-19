import 'package:get/get.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import '../component/api_constant.dart';
import '../services/dio_service.dart';

//* مربوط به ضفحه نمایش مقالات

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;
  RxString screenTitle = ''.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    screenTitle.value = 'مقالات جدید';
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

  getArticleListWithTagsId(String id) async {
    articleList.clear();
    loading.value = true;
    //TODO get userid from getstorage ->ApiConstant.getArticleList+userid
    var response = await DioServise().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=1');
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
