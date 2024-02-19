import 'dart:convert';
import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewsService {
  int _page = 1;
  final int _increment = 2;

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String locale = prefs.getString('locale') ?? 'en';
    if (locale == 'en') {
      locale = 'us';
    }
    String url;
    if (category == 'all') {
      url =
          'https://newsapi.org/v2/top-headlines?country=$locale&page=$_page&apiKey=8c3a56f82dd74f559c5798d462558f9c';
    } else {
      url =
          'https://newsapi.org/v2/top-headlines?country=$locale&category=$category&page=$_page&apiKey=8c3a56f82dd74f559c5798d462558f9c';
    }
    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['title'] != null && element['title'] != '[Removed]') {
          ArticleModel articleModel = ArticleModel.fromJson(element);
          news.add(articleModel);
        }
      });
    }
    _page += _increment;
  }
}
