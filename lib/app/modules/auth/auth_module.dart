import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_modular.dart';
import '../../core/routes/routes.dart';
import '../../data/repository/firebase_user_repository.dart';
import 'auth_controller.dart';
import 'auth_page.dart';

class AuthModule extends Module {

  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addSingleton(AuthController.new);
    i.addLazySingleton(() => FirebaseAuth.instance);
    i.addSingleton(FirebaseUserRepository.new);
  }

  @override
  void routes(r) {
    r.child(Routes.root, child: (context) => AuthPage(Modular.get(), Modular.get()));
  }
}