import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:painel_sos_mulher/app/modules/register/register_page.dart';
import '../../app_modular.dart';
import '../../core/routes/routes.dart';
import '../../data/repository/firebase_user_repository.dart';
import 'register_controller.dart';

final class RegisterModule extends Module {

  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addSingleton(RegisterController.new);
    i.addLazySingleton(() => FirebaseAuth.instance);
    i.addSingleton(FirebaseUserRepository.new);
  }

  @override
  void routes(r) {
      r.child(Routes.root, child: (context) => RegisterPage(Modular.get(), Modular.get()));
  }
}

