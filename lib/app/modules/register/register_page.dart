import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/auth_controller.dart';

class RegisterPage extends StatelessWidget {

  const RegisterPage(this._controller, this.firebaseAuth, {super.key});

  final AuthController _controller;
  final FirebaseAuth firebaseAuth;

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('RegisterPage'),),
           body: Container(),
       );
  }
}