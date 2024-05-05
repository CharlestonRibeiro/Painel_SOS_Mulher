import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../auth_controller.dart';
import '../auth_states.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage(this._controller, {super.key});

  final AuthController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
          
              TextFormField(
                controller: _controller.name,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _controller.email,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _controller.password,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              const SizedBox(height: 20),
             
              const SizedBox(height: 20),
              BlocConsumer<AuthController, AuthState>(
                bloc: _controller,
                listener: (context, state) => switch (state) {
                  SuccessAuthState() => log('SuccessAuthState'),
                   
                  ErrorAuthState() =>
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error.message),
                      ),
                    ),
                  _ => null,
                },
                builder: (context, state) => switch (state) {
                  LoadingAuthState() => const LoadingIndicator(
                      colored: false,
                    ),
                  _ => ElevatedButton(
                    onPressed: _controller.signUp,
                    child: const Text('FINALIZAR CADASTRO'),
                    ),
                },
              ),
              const SizedBox(height: 40),
             
            ],
          ),
        ),
      ),
    );
  }
}