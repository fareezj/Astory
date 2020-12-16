import 'package:astory/models/Article_Model.dart';
import 'package:astory/services/Api_Service.dart';
import 'package:flutter/material.dart';

class NewsViewModel extends ChangeNotifier {

  List<ArticleModel> news = List<ArticleModel>();

  Future<void> getNewsData() async {

    Map<String, dynamic> newsData = await ApiService().getNews();
    newsData['articles'].forEach((element) {
      ArticleModel articleModel = new ArticleModel();
      articleModel = ArticleModel.fromJson(element);
      news.add(articleModel);
      notifyListeners();
    });
  }

  void clearList() {
    news.clear();
    notifyListeners();
  }
}