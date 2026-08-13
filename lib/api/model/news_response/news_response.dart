import 'article.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? code;
  String? message;

  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
    status: json['status'] as String?,
    code: json['code'] as String?,
    message: json['message'] as String?,
    totalResults: json['totalResults'] as int?,
    articles: (json['articles'] as List<dynamic>?)
        ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'code': code,
    'message': message,
    'totalResults': totalResults,
    'articles': articles?.map((e) => e.toJson()).toList(),
  };
}
