import 'package:flutter/material.dart';
import 'package:flutter_challengues/NewsApp/services/news_service.dart';
import 'package:flutter_challengues/NewsApp/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key key}) : super(key: key);

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final encabezados = Provider.of<NewsService>(context).encabezados;

    return Scaffold(
      body: encabezados.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListaNoticias(noticias: encabezados),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
