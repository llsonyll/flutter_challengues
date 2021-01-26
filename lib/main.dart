import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'NewsApp/newsApp_main.dart';
import 'PizzaOrderChallenge/pizzaorder_main.dart';
import 'Riverpod/riverpod_main.dart';
import 'WebViewChallenge/webview_main.dart';
import 'challengue.dart';

main(List<String> args) {
  runApp(ProviderScope(child: MainFlutterChallengues()));
}

class MainFlutterChallengues extends StatelessWidget {
  const MainFlutterChallengues({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (BuildContext context) => Home(),
        'webview': (BuildContext context) => WebViewExample(),
        'pizzaorder': (BuildContext context) => PizzaOrder(),
        'riverpod': (BuildContext context) => SMwithRiverPod(),
        'newApp': (BuildContext context) => MainNewsApp(),
      },
      initialRoute: 'home',
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Challengues',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: FlutterChallenguesBody(),
    );
  }
}

class FlutterChallenguesBody extends StatelessWidget {
  const FlutterChallenguesBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: challenguesList.length,
      itemBuilder: (BuildContext context, index) => ChallengeItem(
        reto: challenguesList[index],
      ),
    );
  }
}

class ChallengeItem extends StatelessWidget {
  const ChallengeItem({
    Key key,
    @required this.reto,
  }) : super(key: key);

  final Challenge reto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(reto.ruta);
      },
      tileColor: reto.backgroundColor,
      title: Text(
        reto.titulo,
        style: TextStyle(color: reto.textColor),
      ),
      subtitle: Text(
        reto.descripcion,
        style: TextStyle(color: reto.textColor),
      ),
      trailing: Icon(
        reto.icon,
        color: reto.textColor,
      ),
    );
  }
}
