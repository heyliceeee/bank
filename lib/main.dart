import 'package:bank/screens/home/home.dart';
import 'package:bank/screens/passcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

/**
 * Classe `MyApp` representa o widget raiz do app.
 * Configura o tema e as rotas principais utilizadas no bank.
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // 🔹 Força status bar branca em toda a app
        statusBarColor: Colors.transparent, // fundo transparente
        statusBarIconBrightness: Brightness.light, // Android → ícones brancos
        statusBarBrightness: Brightness.dark, // iOS → ícones brancos
      ),
      child: MaterialApp(
        /**
       * Etiqueta vermelha de debug
       */
        debugShowCheckedModeBanner: false,

        /**
       * Título da app.
       * Aparece em locais como o seletor de tarefas do sistema operacional.
       */
        title: 'LouBank',

        /**
       * Tema principal da app.
       * Define a paleta de cores primária como X.
       */
        // theme: ThemeData(
        //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //),

        /**
       * Rotas disponíveis no app.
       * As rotas são mapeadas para widgets correspondentes e podem ser chamadas com `Navigator.pushNamed`.
      */
        routes: {
          '/': (context) => const Passcode(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
