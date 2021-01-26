import 'package:flutter/material.dart';
import 'package:flutter_challengues/NewsApp/models/news_article.dart';

import 'news_card.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({Key key, @required this.noticias}) : super(key: key);

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (_, index) {
        final Article articulo = noticias[index];
        return NewsCard(
          index: index,
          articulo: articulo,
        );
      },
    );
  }
}
