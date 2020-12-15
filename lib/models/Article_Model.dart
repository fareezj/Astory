
class ArticleModel {

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleModel({this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  factory ArticleModel.fromJson(Map<String, dynamic> parsedJson) {
    return ArticleModel(
      author: parsedJson['author'],
      title: parsedJson['title'],
      description: parsedJson['description'],
      url: parsedJson['url'],
      urlToImage: parsedJson['urlToImage'],
      publishedAt: parsedJson['publishedAt'],
      content: parsedJson['content'],
    );
  }
}

