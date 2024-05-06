import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routes/routes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../auth_controller.dart';
import '../auth_states.dart';

class SignInPage extends StatelessWidget {
  const SignInPage(this._controller, {super.key});

  final AuthController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Column(
          children: [
            
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                BlocConsumer<AuthController, AuthState>(
                  bloc: _controller,
                  listener: (context, state) => switch (state) {
                    SuccessAuthState() =>
                      Routes.i.pushNamedAndRemoveUntil(Routes.home),
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
                    onPressed: _controller.signIn,
                    child: const Text('FINALIZAR CADASTRO'),
                    ),
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não tem uma conta? ',
                    ),
                    TextButton(
                      onPressed: () =>
                          Routes.i.pushNamed(Routes.auth + Routes.signUp),
                      child: const Text(
                        'REGISTRAR',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}