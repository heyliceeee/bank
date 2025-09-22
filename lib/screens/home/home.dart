import 'package:bank/components/navbar.dart';
import 'package:bank/components/topbarHome.dart';
import 'package:bank/global.dart';
import 'package:bank/screens/bankCard/bankCard.dart';
import 'package:bank/screens/message/message.dart';
import 'package:bank/screens/shoppingBag/shoppingBag.dart';
import 'package:bank/screens/time/time.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:
                          CrossAxisAlignment.end, // 🔹 alinha pelo fundo
                      children: [
                        // Coluna com os dois textos
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your balance",
                              style: Global.regularLengthBody.copyWith(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "\$ 7,896",
                              style: Global.boldLengthHealdine.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        // Coluna só com o botão, alinhado em baixo
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: Color(0xFF3E3E3E),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                iconSize: 16,
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // ação ao clicar no botão
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
              page = HomeScreen();
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
