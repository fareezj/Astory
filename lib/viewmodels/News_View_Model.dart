import 'package:astory/models/Article_Model.dart';
import 'package:astory/services/Api_Service.dart';
import 'package:flutter/material.dart';

class NewsViewModel  {

  List<ArticleModel> news = List<ArticleModel>();

  Future<void> getNewsData() async {

    Map<String, dynamic> newsData = await ApiService().getNews();
    newsData['articles'].forEach((element) {
      ArticleModel articleModel = new ArticleModel();
      articleModel = ArticleModel.fromJson(element);
      news.add(articleModel);
    });
  }

  void clearList() {
    news.clear();
  }
}