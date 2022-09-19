import 'package:get/get.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import '../component/api_constant.dart';
import '../services/dio_service.dart';

//* مربوط به صفحه نمایش هر مقاله
class SingleArticleController extends GetxController {
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;

  RxBool loading = false.obs;
  RxBool isFavorite = false.obs;
  RxList<ArticleModel> relatedList = RxList();
  RxList<TagsModel> tagsList = RxList();
  @override
  // onInit() {
  //   super.onInit();
  //   getArticle();
  // }

//https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=1
  getArticleInfo() async {
    loading.value = true;
    //TODO userId is hard code
    var userId = '1';

    var response = await DioServise().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      //چون خروجی مپ است و نه یک لیست پس نیاز نیست از foreach استفاده شود

      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;

      tagsList.clear();
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });
      relatedList.clear();
      response.data['related'].forEach((element) {
        relatedList.add(ArticleModel.fromJson(element));
      });
    }
  }
}
