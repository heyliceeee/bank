import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopbarHome extends StatelessWidget {
  final VoidCallback? onIconTap;

  const TopbarHome({super.key, this.onIconTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🔹 Ícone redondo à esquerda
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onIconTap ?? () {},
              child: const CircleAvatar(
                radius: 16, // metade de 32
                backgroundColor: Color(0xFF363339), // cor de fundo
                backgroundImage: AssetImage('assets/profile.jpeg'),
              ),
            ),
          ),

          // 🔹 Logo centralizado
          SvgPicture.asset('assets/logo.svg', height: 21, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
