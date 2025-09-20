import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget {
  final VoidCallback? onMenuTap;

  const CustomTopBar({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔹 Logo LouBank
          Row(children: [Image.asset('assets/logo.png', height: 18)]),

          // 🔹 Botão de menu (três pontos verticais)
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: onMenuTap ?? () {},
          ),
        ],
      ),
    );
  }
}
