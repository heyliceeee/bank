import 'package:bank/components/topbarPasscode.dart';
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
      // Espera 300ms para mostrar as 4 bolas antes de limpar
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() {
            _enteredCode = "";
          });
        }
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: Offset(0, 6), // sombra para baixo
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: Global.regularLengthBody.copyWith(
                fontSize: 36,
                color: Colors.white,
              ),
            ),

            if (letters != null)
              Text(
                letters,
                style: Global.mediumLengthBody.copyWith(
                  fontSize: 10,
                  color: Colors.white,
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
            Text(
              " X",
              style: Global.boldLengthBody.copyWith(
                fontSize: 16,
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
              const TopbarPasscode(),
              // Espaço para alinhar o título ao centro
              const SizedBox(width: 48),
              Text(
                "Enter Passcode",
                style: Global.regularLengthBody.copyWith(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 17,
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
                  child: Text(
                    "Can not login?",
                    style: Global.regularLengthBody.copyWith(
                      fontSize: 13,
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
