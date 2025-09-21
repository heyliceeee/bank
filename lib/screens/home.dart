import 'package:bank/components/navbar.dart';
import 'package:bank/components/topbarHome.dart';
import 'package:bank/global.dart';
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: Global.gray1, // linearGradient
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔹 Chamar a TopBar
              const TopbarHome(),
              // Espaço para alinhar o título ao centro
              const SizedBox(width: 48),
              const Text(
                "Your balance",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              // Espaço para alinhar o título ao centro
              const SizedBox(width: 48),
              // 🔹 Chamar a NavBar
              const Navbar(),
            ],
          ),
        ),
      ),
    );
  }
}
