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
      backgroundColor: Color(0xFF1E1E1E), // 🔹 transparente
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

                        const SizedBox(height: 30),

                        // lista de cartões com scroll horizontal
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildCardBox(
                                "Salary",
                                "\$ 2,230",
                                "** 6917",
                                Global.gradientMint,
                                removeLeftMargin: true,
                              ),
                              _buildCardBox(
                                "Savings account",
                                "\$ 5,566",
                                "** 4552",
                                Global.gradientYellow,
                              ),
                              _buildCardBox(
                                "Salary",
                                "\$ 2,230",
                                "** 6917",
                                Global.gradientGrey,
                                removeRightMargin: true,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // linha com o texto "FINANCE"
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

                        const SizedBox(height: 5),

                        // lista de opções: my bonuses, my budgets, finance analysis, ...
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildFinanceBox(
                                "My bonuses",
                                Remix.star_line,
                                Global.yellowAccent,
                                removeLeftMargin: true,
                              ),
                              _buildFinanceBox(
                                "My budget",
                                Remix.wallet_3_line,
                                Global.mint,
                              ),
                              _buildFinanceBox(
                                "Finance analysis",
                                Remix.bar_chart_box_line,
                                Global.purple,
                                removeRightMargin: true,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // container cinza mais claro que o fundo
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFF252626),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 12.0,
                                right: 12.0,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // accordion menu: current loans
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent,
                                      ),
                                      child: ExpansionTile(
                                        title: Text(
                                          'CURRENT LOANS',
                                          style: Global.mediumCaption.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        collapsedIconColor: Colors.white,
                                        iconColor: Colors.white,
                                        children: [
                                          ListTile(
                                            visualDensity:
                                                VisualDensity.compact,
                                            minVerticalPadding: 0,
                                            contentPadding: EdgeInsets.zero,
                                            title: _buildCurrentLoansBox(
                                              Global.gray270,
                                              Remix.bank_card_line,
                                              Global.mint,
                                              "Account № 3874825",
                                              "Expires 12/22/2023",
                                              Colors.white,
                                              Global.gray3,
                                              "\$ 78,92",
                                              "Rate 3.5%",
                                              removeRightMargin: false,
                                              removeLeftMargin: true,
                                            ),
                                          ),

                                          const SizedBox(height: 5),

                                          ListTile(
                                            visualDensity:
                                                VisualDensity.compact,
                                            minVerticalPadding: 0,
                                            contentPadding: EdgeInsets.zero,
                                            title: _buildCurrentLoansBox(
                                              Global.mint,
                                              Remix.flashlight_line,
                                              Global.yellowAccent,
                                              "Start investing now!",
                                              "Protected savings and investment plans",
                                              Color(0xFF262626),
                                              Color(0xFF262626),
                                              "X",
                                              "",
                                              removeRightMargin: false,
                                              removeLeftMargin: true,
                                            ),
                                          ),
                                        ],
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),

                                    // accordion menu: currencies and metals
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent,
                                      ),
                                      child: ExpansionTile(
                                        title: Text(
                                          'CURRENCIES AND METALS',
                                          style: Global.mediumCaption.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        collapsedIconColor: Colors.white,
                                        iconColor: Colors.white,
                                        children: [
                                          ListTile(
                                            visualDensity:
                                                VisualDensity.compact,
                                            minVerticalPadding: 0,
                                            contentPadding: EdgeInsets.zero,
                                            title: Text(
                                              'Item 1',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            visualDensity:
                                                VisualDensity.compact,
                                            minVerticalPadding: 0,
                                            contentPadding: EdgeInsets.zero,
                                            title: Text(
                                              'Item 2',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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

  // Função para criar cada container de cartão
  Widget _buildCardBox(
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
            style: Global.mediumCaption.copyWith(color: Color(0xFF272A32)),
          ),

          const SizedBox(height: 0),

          // Linha 3: amount
          Text(amount, style: Global.boldLengthBody.copyWith(fontSize: 17)),

          const SizedBox(height: 25),

          // Linha 4: cardID
          Text(
            cardID,
            style: Global.mediumCaption.copyWith(color: Color(0xFF272A32)),
          ),
        ],
      ),
    );
  }

  // Funcao para criar cada container de finance
  Widget _buildFinanceBox(
    String text,
    IconData? icon,
    Color color, {
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
      width: 100, // 🔹 controla a largura do container
      height: 100, // 🔹 controla a altura do container
      margin: margin,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF252626),
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
          const SizedBox(height: 7),

          // Linha 1: botao com o ícone
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2), // cor da sombra
                  spreadRadius: 0, // espalhamento
                  blurRadius: 8, // suavidade
                  offset: const Offset(0, 4), // desloca só para baixo
                ),
              ],
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 16,
              icon: Icon(icon, color: Color(0xFF252626)),
              onPressed: () {
                // ação ao clicar no botão
              },
            ),
          ),

          const SizedBox(height: 15),

          // Linha 2: texto
          Text(
            text,
            style: Global.mediumCaption.copyWith(color: Color(0xFFFFFFFF)),
          ),
        ],
      ),
    );
  }

  // Funcao para criar cada container de current loans
  Widget _buildCurrentLoansBox(
    Color backgroundColor,
    IconData? icon,
    Color iconBackgroundColor,
    String title,
    String subtitle,
    Color colorTitle,
    Color colorSubtitle,
    String price,
    String rate, {
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
      height: 76, // 🔹 controla a altura do container
      margin: margin,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Coluna 1: Icon Button
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2), // cor da sombra
                  spreadRadius: 0, // espalhamento
                  blurRadius: 8, // suavidade
                  offset: const Offset(0, 4), // desloca só para baixo
                ),
              ],
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 16,
              icon: Icon(icon, color: Color(0xFF252626)),
              onPressed: () {
                // ação ao clicar no botão
              },
            ),
          ),

          const SizedBox(width: 12),

          // Coluna 2: Title e Subtitle
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style:
                      (title == "Start investing now!"
                              ? Global.semiboldLengthBody
                              : Global.regular2LengthBody)
                          .copyWith(color: colorTitle),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Global.regular1Caption.copyWith(color: colorSubtitle),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Coluna 3: Price e Rate
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: price == "X"
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: price == "X"
                    ? Global.boldLengthBody.copyWith(color: colorTitle)
                    : Global.regular2LengthBody.copyWith(color: colorTitle),
                overflow: TextOverflow.ellipsis,
              ),
              if (rate.isNotEmpty)
                Text(
                  rate,
                  style: Global.regular1Caption.copyWith(color: colorSubtitle),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
