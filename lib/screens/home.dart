import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  /// Construtor padrão para a `Home`.
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Constrói o layout do ecra.
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepPurple.shade50);
  }
}
