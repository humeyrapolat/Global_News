import 'package:my_app/model/languages_list_model.dart';
import 'package:my_app/model/news_model.dart';
import 'package:dio/dio.dart';
import 'package:my_app/util/constants_project.dart';
import 'package:my_app/view/news_page.dart';

class NewsApiService {
  static String baseUrl = "https://api.currentsapi.services";
 // https://api.currentsapi.services/v1/available/languages?apiKey=Emr2dZ8hgFUBpGTEog5WBlpIM10KRqRu8mAoIO2shptLsEo-


  static Future<NewsList> getNews(String lang) async {
    var res = await Dio().get(baseUrl + "/v1/latest-news", queryParameters: { "language" : lang, "apiKey" :
      "Emr2dZ8hgFUBpGTEog5WBlpIM10KRqRu8mAoIO2shptLsEo-",

    });
 //   print(res.data.toString());
    return NewsList.fromJson(res.data);
  }

  static Future<LanguagesListModel> getLanguages() async {
    var res = await Dio().get(baseUrl + "/v1/available/languages", queryParameters: {  "apiKey" :
    "Emr2dZ8hgFUBpGTEog5WBlpIM10KRqRu8mAoIO2shptLsEo-"
    });
    print(res.data.toString());
    return LanguagesListModel.fromJson(res.data);
  }



}
