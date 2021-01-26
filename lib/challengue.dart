import 'package:flutter/material.dart';

class Challenge {
  Challenge({
    this.ruta,
    this.titulo,
    this.descripcion,
    this.icon,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.black,
  });

  String ruta;
  String titulo;
  String descripcion;
  IconData icon;
  Color textColor;
  Color backgroundColor;
}

List<Challenge> challenguesList = [
  Challenge(
    ruta: 'webview',
    titulo: 'WebView',
    descripcion: 'Probando web-view flutter',
    icon: Icons.web_asset_rounded,
    backgroundColor: Colors.redAccent,
  ),
  Challenge(
    ruta: 'pizzaorder',
    titulo: 'Pizza Order',
    descripcion: 'Pizza Challenge Animations',
    icon: Icons.food_bank_outlined,
    backgroundColor: Colors.orange,
  ),
  Challenge(
    ruta: 'riverpod',
    titulo: 'River Pod SM',
    descripcion: 'State managment using RiverPod',
    icon: Icons.star_rate_outlined,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  ),
  Challenge(
    ruta: 'newApp',
    titulo: 'News App',
    descripcion: 'Provider y otros',
    icon: Icons.new_releases_outlined,
    backgroundColor: Colors.blue,
    textColor: Colors.white,
  ),
  Challenge(
    ruta: 'cupertinoWidgets',
    titulo: 'Cupertino Widgets',
    descripcion: 'IOS environment',
    icon: Icons.iso_outlined,
    backgroundColor: Colors.purple,
    textColor: Colors.white,
  ),
];
