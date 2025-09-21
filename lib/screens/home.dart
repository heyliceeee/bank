import 'package:bank/components/navbar.dart';
import 'package:bank/components/topbarHome.dart';
import 'package:bank/global.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // 🔹 transparente
      extendBody: true, // 🔹 deixa o body “passar” por baixo do navbar
      body: Container(
        decoration: const BoxDecoration(gradient: Global.gray1),
        child: SafeArea(
          child: Column(
            children: [
              const TopbarHome(),
              const SizedBox(height: 16),
              const Text(
                "Your balance",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Conteúdo da Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(
        currentIndex: 0,
        onTap: (index) {
          // aqui mudas de página
        },
      ),
    );
  }
}
