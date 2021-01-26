import 'package:flutter/material.dart';
import 'package:flutter_challengues/NewsApp/pages/tab1_page.dart';
import 'package:provider/provider.dart';

import 'tab2_page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
      currentIndex: provider._paginaActual,
      onTap: (i) => provider.paginaActual = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.headset_mic_rounded), label: 'Titulares'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined), label: 'Categorias'),
      ],
      selectedItemColor: Colors.red,
      selectedLabelStyle: TextStyle(color: Colors.redAccent),
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: provider._pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavigationModel extends ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInCubic);
    this._paginaActual = valor;
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
