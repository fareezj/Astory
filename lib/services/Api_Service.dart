import 'package:astory/services/Network_Helper.dart';

class ApiService {

  Future<dynamic> getNews() async {

    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=cf5ed83c1d754c52a9b6e52f732f094c";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> newsData = await networkHelper.getData();

    return newsData;
  }

  Future<dynamic> getNewsCategory(String category) async {

    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=cf5ed83c1d754c52a9b6e52f732f094c";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> newsCategoryData = await networkHelper.getData();

    return newsCategoryData;
  }

}








