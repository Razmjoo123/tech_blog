class ApiConstant {
  static const hostDlUrl = 'https://techblog.sasansafari.com';
  static const baseUrl = 'https://techblog.sasansafari.com/Techblog/api/';
  static const getHomeItems = baseUrl + 'home/?command=index';
  static const getArticleList =
      baseUrl + 'article/get.php?command=new&user_id='; //id بعدا اضافه میشه
  static const getArticle =
      baseUrl + 'article/get.php?command=info&id='; //id بعدا اضافه میشه
}
