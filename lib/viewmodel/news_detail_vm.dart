import 'package:flutter/cupertino.dart';
import 'package:my_app/model/news_detail_model.dart';

class NewsDetailViewModel extends ChangeNotifier{
  News? comingNews;

  NewsDetailViewModel(this.comingNews);
}