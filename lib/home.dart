import 'package:flutter/material.dart';
import 'package:youtube/custom_search_delegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/explorar.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricoes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "";
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      Explorar(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res!;
                });
                print("resultado: digitado $res");
              },
              icon: Icon(Icons.search_rounded)),
          /* 
          IconButton(
              onPressed: () => print("ação videocam"),
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () => print("ação conta"),
              icon: Icon(Icons.account_circle)) 
              */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        // unselectedItemColor: Colors.black87,
        // unselectedLabelStyle: TextStyle(color: Colors.black87),
        // selectedIconTheme: IconThemeData(color: Colors.red),
        // selectedItemColor: Colors.red,
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explorar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), label: "Inscrições"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: "Biblioteca"),
        ],
      ),
    );
  }
}
