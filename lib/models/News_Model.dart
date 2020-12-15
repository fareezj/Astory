
class NewsModel {

  String status;
  int totalResults;
  List articles;

  NewsModel({this.status, this.totalResults, this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> parsedJson) {
    return NewsModel(
      status: parsedJson['status'],
      totalResults: parsedJson['totalResults'],
      articles: parsedJson['articles'],
    );
  }
}