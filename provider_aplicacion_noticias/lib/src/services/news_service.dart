import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:provider_aplicacion_noticias/src/models/category_model.dart';
import 'package:provider_aplicacion_noticias/src/models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = 'c8194f162e324487b5e15ab3b7de67fb';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.laptop, 'technology'),
    Category(FontAwesomeIcons.football, 'sports'),
    Category(FontAwesomeIcons.adn, 'healthscience'),
    Category(FontAwesomeIcons.person, 'general'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadLines();

    categories.forEach((item) {
      this.categoryArticles[item.name] = new List.empty(growable: true);
    });
  }

  get selectedCategory => this._selectedCategory;

  set selectedCategory(dynamic valor) {
    this._selectedCategory = valor;

    this.getArticlesByCategory(valor);

    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      this.categoryArticles[this.selectedCategory]!;

  getTopHeadLines() async {
    final url =
        Uri.parse('$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY');
    final res = await http.get(url);

    final newResponse = newResponseFromJson(res.body);
    //se añaden todos los articulos con addAll en la lista headlines
    this.headlines.addAll(newResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?country=co&category=$category&apiKey=$_API_KEY');
    final res = await http.get(url);

    final newResponse = newResponseFromJson(res.body);
    categoryArticles[category]?.addAll(newResponse.articles);

    notifyListeners();
  }
}
