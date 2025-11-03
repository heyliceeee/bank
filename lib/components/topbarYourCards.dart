import 'package:bank/global.dart';
import 'package:flutter/material.dart';

class TopbarYourCards extends StatelessWidget {
  final VoidCallback? onIconTap;

  const TopbarYourCards({super.key, this.onIconTap});

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
                    "Your Cards",
                    style: Global.mediumLengthBody.copyWith(
                      color: Colors.white,
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
