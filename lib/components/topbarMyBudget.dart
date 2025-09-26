import 'package:bank/global.dart';
import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class TopbarMyBudget extends StatelessWidget {
  final VoidCallback? onIconTap;

  const TopbarMyBudget({super.key, this.onIconTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🔹 Texto centrado
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: onIconTap ?? () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "My Budget",
                    style: Global.mediumLengthBody.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Ícone redondo à direita
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onIconTap ?? () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                      icon: const Icon(Remix.filter_line, color: Colors.white),
                      onPressed: () {
                        // ação ao clicar no botão
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
