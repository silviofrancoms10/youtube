import 'package:flutter/material.dart';
import 'package:youtube/telas/api.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

    Api api = Api();
    api.pesquisar("");

    return Container(
      child: Center(
        child: Text("Início", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
