import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/image_paths.dart';
import '../../core/routes/routes.dart';
import '../../core/widgets/loading_indicator.dart';
import 'register_controller.dart';
import 'register_states.dart';

class RegisterPage extends StatelessWidget {

  const RegisterPage(this._controller, this.firebaseAuth, {super.key});

  final RegisterController _controller;
  final FirebaseAuth firebaseAuth;

 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagePaths.logo),
          const SizedBox(width: 80),
          SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Registar',
                  style: TextStyle(
                    color: Color(0xFF080A0B),
                    fontSize: 48.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    height: 1.1667,
                  ),
                ),
                const Text(
                  'Painel de dados do SOS Mulher',
                  style: TextStyle(
                    color: Color(0xFF5D5D5B),
                    fontSize: 14.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    height: 1.2857,
                  ),
                ),
                TextField(
                  controller: _controller.email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('E-mail'),
                      hintText: 'exemplo@gmail.com',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      suffixIcon: Icon(Icons.person)),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _controller.email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Senha'),
                      hintText: '************************',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      suffixIcon: Icon(Icons.remove_red_eye)),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<RegisterController, RegisterStates>(
                  bloc: _controller,
                  listener: (context, state) => switch (state) {
                    SuccessRegisterState() =>
                      Routes.i.pushNamedAndRemoveUntil(Routes.home),
                    ErrorRegisterState() =>
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error.message),
                        ),
                      ),
                    _ => null,
                  },
                  builder: (context, state) => switch (state) {
                    LoadingRegisterState() => const LoadingIndicator(
                        colored: false,
                      ),
                    _ => SizedBox(
                        width: 468.0, 
                        height: 48.0, 
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3F8E40),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            textStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Registar',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}