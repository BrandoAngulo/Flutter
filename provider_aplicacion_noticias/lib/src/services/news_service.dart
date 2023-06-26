import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:provider_aplicacion_noticias/src/models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = 'c8194f162e324487b5e15ab3b7de67fb';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY');
    final res = await http.get(url);

    final newResponse = newResponseFromJson(res.body);
    //se añaden todos los articulos con addAll en la lista headlines
    this.headlines.addAll(newResponse.articles);
    notifyListeners();
  }
}
