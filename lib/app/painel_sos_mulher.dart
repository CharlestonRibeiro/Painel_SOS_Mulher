import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PainelSosMulher extends StatelessWidget {
  const PainelSosMulher({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Painel SOS Mulher',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
         useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
