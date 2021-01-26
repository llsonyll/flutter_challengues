import 'package:flutter/material.dart';
import 'package:flutter_challengues/NewsApp/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_challengues/NewsApp/models/news_article.dart';

class NewsService with ChangeNotifier {
  final urlNews = "https://newsapi.org/v2";
  final apiKey = "61cfb84b36bd43e09922d866c3753bfc";

  List<Article> encabezados = [];

  List<Category> categorias = [
    Category(name: 'business', icon: Icons.business_center_outlined),
    Category(name: 'entertainment', icon: Icons.games_outlined),
    Category(name: 'general', icon: Icons.info),
    Category(name: 'health', icon: Icons.healing_outlined),
    Category(name: 'science', icon: Icons.science_outlined),
    Category(name: 'sports', icon: Icons.sports_basketball_outlined),
    Category(name: 'technology', icon: Icons.military_tech_outlined),
  ];

  String _categoriaSeleccion = 'business';
  Map<String, List<Article>> newsCategoria = {};

  NewsService() {
    this.getEncabezados();
    categorias.forEach((categoria) {
      this.newsCategoria[categoria.name] = List<Article>();
    });
  }

  get categoriaSeleccion => this._categoriaSeleccion;
  set categoriaSeleccion(String categoria) {
    this._categoriaSeleccion = categoria;
    this.getCategoriasNews(categoria);
    notifyListeners();
  }

  List<Article> get newsSelectedCategory =>
      this.newsCategoria[this.categoriaSeleccion];

  getEncabezados() async {
    final url = "$urlNews/top-headlines?apiKey=$apiKey&country=us";
    final resp = await http.get(url);
    final newsReponse = newsarticleFromJson(resp.body);

    encabezados.addAll(newsReponse.articles);
    notifyListeners();
  }

  getCategoriasNews(String categoria) async {
    if (this.newsCategoria[categoria].length > 0) {
      return this.newsCategoria[categoria];
    }

    final url =
        "$urlNews/top-headlines?apiKey=$apiKey&country=us&category=$categoria";
    final resp = await http.get(url);

    final newsReponse = newsarticleFromJson(resp.body);
    this.newsCategoria[categoria].addAll(newsReponse.articles);
    notifyListeners();
  }
}
