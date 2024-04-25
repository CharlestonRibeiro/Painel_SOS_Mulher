import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:painel_sos_mulher/app/app_modular.dart';
import 'app/painel_sos_mulher.dart';

void main() {
  runApp(
     ModularApp(
        module: AppModule(), 
        child: const PainelSosMulher()));
}

