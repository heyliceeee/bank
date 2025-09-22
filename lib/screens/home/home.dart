import 'package:bank/components/navbar.dart';
import 'package:bank/components/topbarHome.dart';
import 'package:bank/global.dart';
import 'package:bank/screens/bankCard/bankCard.dart';
import 'package:bank/screens/message/message.dart';
import 'package:bank/screens/shoppingBag/shoppingBag.dart';
import 'package:bank/screens/time/time.dart';
import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Linha de cima: textos à esquerda + botão à direita
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
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

                            // Botão redondo
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
                                  Remix.search_line,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // ação ao clicar no botão
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ), // espaço entre a linha de cima e o texto de baixo
                        // lista de cartões com scroll horizontal
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildInfoBox(
                                "Salary",
                                "\$ 2,230",
                                "** 6917",
                                Global.gradientMint,
                                removeLeftMargin: true,
                              ),
                              _buildInfoBox(
                                "Savings account",
                                "\$ 5,566",
                                "** 4552",
                                Global.gradientYellow,
                              ),
                              _buildInfoBox(
                                "Salary",
                                "\$ 2,230",
                                "** 6917",
                                Global.gradientGrey,
                                removeRightMargin: true,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "FINANCE",
                              style: Global.medium1Caption.copyWith(
                                color: Colors.white,
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

  // Função para criar cada container
  Widget _buildInfoBox(
    String typeCard,
    String amount,
    String cardID,
    LinearGradient color, {
    bool removeLeftMargin = false,
    bool removeRightMargin = false,
  }) {
    EdgeInsets margin;
    if (removeLeftMargin) {
      margin = const EdgeInsets.only(right: 8);
    } else if (removeRightMargin) {
      margin = const EdgeInsets.only(left: 8);
    } else {
      margin = const EdgeInsets.symmetric(horizontal: 8);
    }
    return Container(
      width: 148, // 🔹 controla a largura do container
      height: 170, // 🔹 controla a altura do container
      margin: margin,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: color,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2), // cor da sombra
            spreadRadius: 0, // espalhamento
            blurRadius: 8, // suavidade
            offset: const Offset(0, 4), // desloca só para baixo
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, // 🔹 alinha à esquerda
        children: [
          const SizedBox(height: 8),

          // Linha 1: imagem
          Icon(Remix.visa_line, color: Color(0xFF272A32), size: 35),

          const SizedBox(height: 25),

          // Linha 2: typeCard
          Text(
            typeCard,
            style: Global.mediumCaption.copyWith(
              color: Color(0xFF272A32),
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 0),

          // Linha 3: amount
          Text(amount, style: Global.boldLengthBody.copyWith(fontSize: 17)),

          const SizedBox(height: 25),

          // Linha 4: cardID
          Text(
            cardID,
            style: Global.mediumCaption.copyWith(
              color: Color(0xFF272A32),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
