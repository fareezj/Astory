
import 'package:astory/models/Article_Model.dart';
import 'package:astory/services/Api_Service.dart';
import 'package:flutter/cupertino.dart';

class NewsCategoryViewModel extends ChangeNotifier {

  List<ArticleModel> newsCategory = List<ArticleModel>();

  Future<void> getNewsCategoryData(String category) async {

    Map<String, dynamic> newsCategoryData = await ApiService().getNewsCategory(category);
    newsCategoryData['articles'].forEach((element) {
      ArticleModel articleModel = new ArticleModel();
      articleModel = ArticleModel.fromJson(element);
      newsCategory.add(articleModel);
      notifyListeners();
    });

  }

  void clearList() {
    newsCategory.clear();
    notifyListeners();
  }

}