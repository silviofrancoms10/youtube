import 'package:flutter/material.dart';

class Explorar extends StatefulWidget {
  const Explorar({super.key});

  @override
  State<Explorar> createState() => _ExplorarState();
}

class _ExplorarState extends State<Explorar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Explorar", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
