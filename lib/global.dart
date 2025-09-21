import 'package:flutter/material.dart';

class Global {
  // typography | headline
  static const TextStyle boldLengthHealdine = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Color(0xFF202020),
    height: 1.2,
  );
  static const TextStyle semiboldLengthHealdine = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1F2020),
    height: 1.2,
  );
  static const TextStyle regularLengthHealdine = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1F2020),
    height: 1.2,
  );

  // typography | body
  static const TextStyle boldLengthBody = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Color(0xFF272A32),
    height: 1.4,
  );
  static const TextStyle mediumLengthBody = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1F2020),
    height: 1.4,
  );
  static const TextStyle regularLengthBody = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1F2020),
    height: 1.4,
  );
  static const TextStyle semiboldLengthBody = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Color(0xFF262727),
    height: 1.4,
  );
  static const TextStyle regular2LengthBody = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Color(0xFF262727),
    height: 1.4,
  );

  // typography | caption
  static const TextStyle regularCaption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1F2020),
    height: 1.3,
  );
  static const TextStyle regular1Caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF262727),
    height: 1.3,
  );
  static const TextStyle mediumCaption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1F2020),
    height: 1.3,
  );
  static const TextStyle medium1Caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Color(0xFF262727),
    height: 1.3,
  );

  // styles | cores | accent
  static const Color yellowAccent = Color(0xFFF2FE8D); // #F2FE8D 100% opacidade
  static const Color mint = Color(0xFFB2D0CE); // #B2D0CE 100% opacidade
  static const Color purple = Color(0xFFAA9EB7); // #AA9EB7 100% opacidade

  // styles | cores | graybase
  static const Color darkGreyStart = Color(
    0xFF252525,
  ); // #252525 100% opacidade
  static const Color darkGreyEnd = Color(0xFF2C2C2C); // #2C2C2C 100% opacidade

  static const LinearGradient gray1 = LinearGradient(
    begin: Alignment.topCenter, // 0%
    end: Alignment.bottomCenter, // 100%
    colors: [darkGreyStart, darkGreyEnd],
    stops: [0.0, 1.0], // posições do gradiente
  );

  static const Color gray2 = Color(0xFF212121); // #212121 100% opacidade
  static const Color gray3 = Color(0xFF79767D); // #79767D 100% opacidade

  // styles | cores | gradient
  static const Color mintStart = Color(0xFFEAEAEA); // #EAEAEA 100% opacidade

  static const LinearGradient gradientMint = LinearGradient(
    begin: Alignment.topCenter, // 0%
    end: Alignment.bottomCenter, // 100%
    colors: [mintStart, mint],
    stops: [0.0, 1.0], // posições do gradiente
  );

  static const Color yellowStart = Color(0xFFFCFFDF); // #FCFFDF 100% opacidade
  static const Color yellowEnd = Color(0xFFF1FE87); // #F1FE87 100% opacidade

  static const LinearGradient gradientYellow = LinearGradient(
    begin: Alignment.topCenter, // 0%
    end: Alignment.bottomCenter, // 100%
    colors: [yellowStart, yellowEnd],
    stops: [0.0, 1.0], // posições do gradiente
  );

  static const Color greyStart = Color(0xFFF2EFF4); // #F2EFF4 100% opacidade
  static const Color greyEnd = Color(0xFFB8A9C6); // #B8A9C6 100% opacidade

  static const LinearGradient gradientGrey = LinearGradient(
    begin: Alignment.topCenter, // 0%
    end: Alignment.bottomCenter, // 100%
    colors: [greyStart, greyEnd],
    stops: [0.0, 1.0], // posições do gradiente
  );
}
