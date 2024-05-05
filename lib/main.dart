import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:painel_sos_mulher/app/app_modular.dart';
import 'package:painel_sos_mulher/firebase_options.dart';
import 'app/painel_sos_mulher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ModularApp(
    module: AppModule(),
    child: const PainelSosMulher(),
  ));
}

