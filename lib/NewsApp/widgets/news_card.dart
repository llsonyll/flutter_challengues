import 'package:flutter/material.dart';
import 'package:flutter_challengues/NewsApp/models/news_article.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key key, @required this.articulo, @required this.index})
      : super(key: key);

  final Article articulo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('ir a Detalles');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _SourceNew(
              articulo: articulo,
              index: index,
            ),
            _TitleNew(
              articulo: articulo,
            ),
            _ImageNew(
              articulo: articulo,
            ),
            _DescriptionNew(
              articulo: articulo,
            ),
            Divider(),
            _ActionsNew(),
          ],
        ),
      ),
    );
  }
}

class _SourceNew extends StatelessWidget {
  const _SourceNew({Key key, @required this.articulo, @required this.index})
      : super(key: key);
  final Article articulo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text((index + 1).toString(),
              style: TextStyle(color: Theme.of(context).accentColor)),
          const SizedBox(width: 20.0),
          Text(articulo.source.name),
        ],
      ),
    );
  }
}

class _TitleNew extends StatelessWidget {
  const _TitleNew({Key key, @required this.articulo}) : super(key: key);

  final Article articulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        articulo.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
        ),
      ),
    );
  }
}

class _ImageNew extends StatelessWidget {
  const _ImageNew({Key key, @required this.articulo}) : super(key: key);

  final Article articulo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      child: Container(
        child: articulo.urlToImage != null
            ? FadeInImage(
                placeholder: AssetImage('assets/news_app/giphy.gif'),
                image: NetworkImage(
                  articulo.urlToImage ??
                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
                ),
              )
            : Image(
                image: AssetImage('assets/news_app/no-image.png'),
              ),
      ),
    );
  }
}

class _DescriptionNew extends StatelessWidget {
  const _DescriptionNew({Key key, this.articulo}) : super(key: key);

  final Article articulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Text(articulo.description ?? 'no description'),
    );
  }
}

class _ActionsNew extends StatelessWidget {
  const _ActionsNew({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton.icon(
          icon: Icon(Icons.favorite_border_outlined),
          onPressed: () {
            print('favorite');
          },
          label: Text('Favorite'),
        ),
        IconButton(
          icon: Icon(Icons.read_more_outlined),
          onPressed: () {
            print('read more');
          },
        )
      ],
    );
  }
}
