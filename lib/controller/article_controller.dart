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
