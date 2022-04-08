import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:my_app/model/languages_list_model.dart';
import 'package:my_app/model/news_detail_model.dart';
import 'package:my_app/model/news_model.dart';
import 'package:my_app/service/news_api_service.dart';

class NewsViewModel extends ChangeNotifier {
  NewsList? _newsList;
  NewsList? get newsList => _newsList;

  LanguagesListModel? _languagesListModel;
  LanguagesListModel? get languagesListModel => _languagesListModel;


  List<News>? _savedList = [];
  List<News>? get savedList => _savedList;

  NewsViewModel() {
    NewsApiService.getLanguages().then((value) {
      _languagesListModel = value;
      print(value);
    });

    getData("ru");

  }

  getData(String lang){
    NewsApiService.getNews(lang).then((value) {
      _newsList = value;
      notifyListeners();
    });
  }

  bool isSaved(News news) {
    return _savedList!.contains(news);
  }

  void controlSaved(News news) {
    if(isSaved(news)){
      _savedList!.remove(news);
    }else{
      _savedList!.add(news);
    }
    notifyListeners();
  }




}
