import 'package:bank/components/navbar.dart';
import 'package:bank/components/topbarHome.dart';
import 'package:bank/global.dart';
import 'package:bank/screens/bankCard/bankCard.dart';
import 'package:bank/screens/home/home.dart';
import 'package:bank/screens/shoppingBag/shoppingBag.dart';
import 'package:bank/screens/time/time.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessageScreen> {
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
              Expanded(
                child: Center(
                  child: Text(
                    "Ecrã “Dialogues” com lista de contactos (Ludovic, John Baldwin, Sarah), pré-visualização de mensagens e histórico de conversas.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(
        currentIndex: 3,
        onTap: (index) {
          Widget page;
          switch (index) {
            case 0:
              page = HomeScreen();
              break;
            case 1:
              page = ShoppingBagScreen();
              break;
            case 2:
              page = BankCardScreen();
              break;
            case 3:
              page = MessageScreen();
              break;
            case 4:
              page = TimeScreen();
              break;
            default:
              page = MessageScreen();
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
