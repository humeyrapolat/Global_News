import 'news_detail_model.dart';

class NewsList {
  String? status;
  List<News>? news;
  int? page;

  NewsList({this.status, this.news, this.page});

  NewsList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    return data;
  }
}

