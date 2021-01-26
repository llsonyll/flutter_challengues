import 'package:flutter/material.dart';
import 'package:flutter_challengues/NewsApp/models/news_article.dart';

class NewDetails extends StatelessWidget {
  const NewDetails({Key key, this.articulo}) : super(key: key);

  final Article articulo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.network(articulo.urlToImage ??
            'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg'),
        const SizedBox(height: 10),
      ],
    ));
  }
}
