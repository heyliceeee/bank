import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: SvgPicture.asset(
          'assets/logo.svg',
          height: 21,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
