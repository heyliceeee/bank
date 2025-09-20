import 'package:bank/components/customTopBar.dart';
import 'package:bank/global.dart';
import 'package:flutter/material.dart';

class Passcode extends StatefulWidget {
  /// Construtor padrão para a `Passcode`.
  const Passcode({Key? key}) : super(key: key);

  @override
  _PasscodeState createState() => _PasscodeState();
}

class _PasscodeState extends State<Passcode> {
  final String _correctCode = "1234"; // Podes mudar para o que quiseres
  String _enteredCode = "";

  /// Introduzir o code
  void _onKeyTap(String value) {
    setState(() {
      if (value == 'back') {
        if (_enteredCode.isNotEmpty) {
          _enteredCode = _enteredCode.substring(0, _enteredCode.length - 1);
        }
      } else {
        if (_enteredCode.length < 4) {
          _enteredCode += value;
        }
        if (_enteredCode.length == 4) {
          _validateCode();
        }
      }
    });
  }

  /// Verifica se o code introduzido e o correto
  void _validateCode() {
    if (_enteredCode == _correctCode) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Código incorreto")));
      setState(() {
        _enteredCode = "";
      });
    }
  }

  /// Constrói o layout do ecra.
  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        bool filled = index < _enteredCode.length;
        return Container(
          margin: const EdgeInsets.all(8),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? Color(0xFF5C5762) : Colors.transparent,
            border: Border.all(color: Color(0xFF5C5762), width: 1.5),
          ),
        );
      }),
    );
  }

  Widget _buildKey(String number, {String? letters}) {
    return InkWell(
      onTap: () => _onKeyTap(number),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF363339),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(
                fontSize: 36,
                height: 1.4,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            if (letters != null)
              Text(
                letters,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackspace() {
    return InkWell(
      onTap: () => _onKeyTap('back'),
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        width: 80,
        height: 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Ícone de backspace em cinza
            Icon(Icons.backspace, size: 28, color: Color(0xFF363339)),
            // Apenas o "X" — usando um texto ou ícone custom
            const Text(
              " X",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // só o X é branco
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: Global.gray1, // linearGradient
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔹 Chamar a TopBar
              const CustomTopBar(),
              // Espaço para alinhar o título ao centro
              const SizedBox(width: 48),
              const Text(
                "Enter Passcode",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              _buildDots(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildKey("1"),
                      _buildKey("2", letters: "ABC"),
                      _buildKey("3", letters: "DEF"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildKey("4", letters: "GHI"),
                      _buildKey("5", letters: "JKL"),
                      _buildKey("6", letters: "MNO"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildKey("7", letters: "PQRS"),
                      _buildKey("8", letters: "TUV"),
                      _buildKey("9", letters: "WXYZ"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 80),
                      _buildKey("0"),
                      _buildBackspace(),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                  onPressed: () {
                    // ação para "Can not login?"
                  },
                  child: const Text(
                    "Can not login?",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: Global.yellowAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
