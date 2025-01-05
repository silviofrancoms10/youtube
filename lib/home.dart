import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png", width: 98, height: 22,),
        actions: [
          IconButton(onPressed: () => print("ação videocam"), icon: Icon(Icons.videocam)),
          IconButton(onPressed: () => print("ação pesquisa"), icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: () => print("ação conta"), icon: Icon(Icons.account_circle))
        ],
      ),
      body: Container(),
    );
  }
}
