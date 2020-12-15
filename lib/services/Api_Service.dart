import 'package:astory/services/Network_Helper.dart';

class ApiService {

  Future<dynamic> getNews() async {

    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=cd4ef32bcf6f4f1b84ff5fe667a04b19";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> newsData = await networkHelper.getData();

    return newsData;
  }

  Future<dynamic> getNewsCategory(String category) async {

    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=cd4ef32bcf6f4f1b84ff5fe667a04b19";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> newsCategoryData = await networkHelper.getData();

    return newsCategoryData;
  }

}








