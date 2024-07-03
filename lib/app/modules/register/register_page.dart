import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../core/constants/image_paths.dart';
import '../../core/routes/navigation_side_bar.dart';
import '../../core/validator/form_validator.dart';
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
        children: [
          const NavigationSideBar(),
          Expanded(
              child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Image.asset(ImagePaths.logo),
              Container(
                width: 460,
                padding: const EdgeInsets.all(80),
                child: Center(
                  child: Form(
                    key: _controller.formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Registar',
                          style: TextStyle(
                            color: Color(0xFF080A0B),
                            fontSize: 48.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Painel de dados do SOS Mulher',
                          style: TextStyle(
                            color: Color(0xFF5D5D5B),
                            fontSize: 14.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextFormField(
                          controller: _controller.email,
                          validator: FormValidator.validateEmail,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('E-mail'),
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                            suffixIcon: Icon(Icons.person),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        AnimatedBuilder(
                            animation: _controller.isHidden,
                            builder: (context, child) {
                              return TextFormField(
                                controller: _controller.password,
                                obscureText: _controller.isHidden.value,
                                validator: FormValidator.validatePassword,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    label: const Text('Senha'),
                                    hintStyle: const TextStyle(
                                        color: Colors.black, fontSize: 14.0),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    suffixIcon: InkWell(
                                      onTap: () => _controller.hide(),
                                      child: Icon(_controller.isHidden.value
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    )),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              );
                            }),
                        const SizedBox(height: 8),
                        AnimatedBuilder(
                            animation: _controller.isHiddenConfirm,
                            builder: (context, child) {
                              return TextFormField(
                                controller: _controller.confirmPassword,
                                obscureText: _controller.isHiddenConfirm.value,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    FormValidator.confirmValidatePassword(
                                        _controller.password.text as String?,
                                        value),
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    label: const Text('Confirma Senha'),
                                    hintStyle: const TextStyle(
                                        color: Colors.black, fontSize: 14.0),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    suffixIcon: InkWell(
                                      onTap: () => _controller.hideConfirm(),
                                      child: Icon(
                                          _controller.isHiddenConfirm.value
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                    )),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              );
                            }),
                        const SizedBox(height: 20),
                        BlocConsumer<RegisterController, RegisterStates>(
                          bloc: _controller,
                          listener: (context, state) => switch (state) {
                            SuccessRegisterState() => showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.info(
                                  icon: Image.asset(ImagePaths.logo),
                                  backgroundColor: Colors.white,
                                  textStyle: const TextStyle(
                                    color: Color(0xFF3F8E40),
                                  ),
                                  message: "Cadastro criado com sucesso.",
                                ),
                              ),
                            ErrorRegisterState() => showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                  backgroundColor: Colors.red,
                                  message: state.error.message,
                                ),
                              ),
                            _ => null,
                          },
                          builder: (context, state) => switch (state) {
                            LoadingRegisterState() =>
                              const CircularProgressIndicator(),
                            _ => SizedBox(
                                width: 468.0,
                                height: 48.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF3F8E40),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    textStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    final valid =
                                        _controller.formKey.currentState !=
                                                null &&
                                            _controller.formKey.currentState!
                                                .validate();

                                    if (valid) {
                                      _controller.signUp();
                                    }
                                  },
                                  child: const Text(
                                    'Registar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
