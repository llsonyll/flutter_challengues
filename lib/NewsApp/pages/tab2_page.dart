import 'package:flutter/material.dart';
import 'package:flutter_challengues/NewsApp/models/category.dart';
import 'package:flutter_challengues/NewsApp/services/news_service.dart';
import 'package:flutter_challengues/NewsApp/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categorias;
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListaCategorias(categories: categories),
            Expanded(
              child: newsService.newsSelectedCategory.length == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListaNoticias(
                      noticias: newsService.newsSelectedCategory,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaCategorias extends StatelessWidget {
  const ListaCategorias({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final Category categoria = categories[index];
          return Container(
            width: 100.0,
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
            child: _CategoriaItem(categoria: categoria),
          );
        },
      ),
    );
  }
}

class _CategoriaItem extends StatelessWidget {
  const _CategoriaItem({
    Key key,
    @required this.categoria,
  }) : super(key: key);

  final Category categoria;

  @override
  Widget build(BuildContext context) {
    final catSeleccionada =
        Provider.of<NewsService>(context).categoriaSeleccion;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            final newsService =
                Provider.of<NewsService>(context, listen: false);
            newsService.categoriaSeleccion = categoria.name;
          },
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              categoria.icon,
              color: catSeleccionada == categoria.name
                  ? Colors.red
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 7.0),
        Text(
          categoria.name,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          style: TextStyle(
              color: catSeleccionada == categoria.name
                  ? Colors.red
                  : Colors.white),
        ),
      ],
    );
  }
}
