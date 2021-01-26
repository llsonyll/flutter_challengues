import 'package:flutter/material.dart';
import 'package:flutter_challengues/NewsApp/theme/tema.dart';
import 'package:provider/provider.dart';

import 'pages/tabs_page.dart';
import 'services/news_service.dart';

class MainNewsApp extends StatelessWidget {
  const MainNewsApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: myTheme,
        home: TabsPage(),
      ),
    );
  }
}
