import 'package:bank/global.dart';
import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const Navbar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0x991E1E1E), // preto mais claro arredondado
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Remix.home_4_line, 0), // Home / Dashboard
          _navItem(Remix.shopping_bag_line, 1), // Orçamento / Compras
          _navItem(Remix.bank_card_line, 2), // Cartões
          _navItem(Remix.message_3_line, 3), // Mensagens
          _navItem(Remix.time_line, 4), // Histórico / Agendamentos
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final isSelected = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(icon, color: isSelected ? Global.yellowAccent : Colors.white),
    );
  }
}
