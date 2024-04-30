import 'article.dart';

class NewModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewModel({this.status, this.totalResults, this.articles});

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
      };
}
