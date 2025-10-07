import 'package:bank/components/navbar.dart';
import 'package:bank/components/topbarHome.dart';
import 'package:bank/components/topbarYourCards.dart';
import 'package:bank/global.dart';
import 'package:bank/screens/home/home.dart';
import 'package:bank/screens/message/message.dart';
import 'package:bank/screens/shoppingBag/shoppingBag.dart';
import 'package:bank/screens/time/time.dart';
import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class BankCardScreen extends StatefulWidget {
  const BankCardScreen({Key? key}) : super(key: key);

  @override
  _BankCardState createState() => _BankCardState();
}

class _BankCardState extends State<BankCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      extendBody: true, // 🔹 deixa o body “passar” por baixo do navbar
      body: Container(
        decoration: const BoxDecoration(gradient: Global.gray1),
        child: SafeArea(
          child: Column(
            children: [
              const TopbarYourCards(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: // Slider de cartoes
                    Column(
                      children: [
                        // Slider ou cartao (ainda nao sei)
                        Container(),

                        const SizedBox(height: 20),

                        // Historico de transacoes
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
                                    const SizedBox(height: 15),

                                    Text(
                                      'Transactions',
                                      style: Global.regularLengthHealdine
                                          .copyWith(color: Colors.white),
                                    ),

                                    const SizedBox(height: 15),

                                    Text(
                                      'Today',
                                      style: Global.regularCaption.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    _buildTransitionsBox(
                                      Remix.download_line,
                                      Global.yellowAccent,
                                      "Transfer",
                                      "Incoming transfer",
                                      "+ \$3,110",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
                                    ),
                                    _buildTransitionsBox(
                                      Remix.upload_line,
                                      Global.mint,
                                      "Health",
                                      "Pharmacy",
                                      "- \$312,9",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
                                    ),

                                    const SizedBox(height: 15),

                                    Text(
                                      'June 13th',
                                      style: Global.regularCaption.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    _buildTransitionsBox(
                                      Remix.download_line,
                                      Global.yellowAccent,
                                      "Transfer",
                                      "Incoming transfer",
                                      "+ \$3,110",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
                                    ),
                                    _buildTransitionsBox(
                                      Remix.upload_line,
                                      Global.mint,
                                      "Transfer",
                                      "Incoming transfer",
                                      "+ \$3,110",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
                                    ),
                                    _buildTransitionsBox(
                                      Remix.download_line,
                                      Global.yellowAccent,
                                      "Transfer",
                                      "Incoming transfer",
                                      "+ \$3,110",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
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
        currentIndex: 2,
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
              page = BankCardScreen();
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }

  // Funcao para criar cada item de transação
  Widget _buildTransitionsBox(
    IconData icon, // Changed from String image to IconData icon
    Color backgroundColor, // Added backgroundColor parameter
    String title,
    String subtitle,
    String price, {
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
      height: 60, // 🔹 controla a altura do container
      margin: margin,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Coluna 1: circle avatar
          Container(
            width: 32,
            height: 32,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: backgroundColor, // cor de fundo
              child: Icon(icon, color: Colors.black), // Icon instead of image
            ),
          ),

          const SizedBox(width: 12),

          // Coluna 2: título e subtítulo
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Global.mediumLengthBody.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Global.regularCaption.copyWith(color: Global.gray3),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Coluna 3: preço
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: Global.mediumLengthBody.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
