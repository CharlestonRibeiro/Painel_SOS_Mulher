import 'package:flutter_modular/flutter_modular.dart';
import '../../app_modular.dart';
import '../../core/routes/routes.dart';
import 'auth_controller.dart';
import 'sign_in/sign_in_page.dart';
import 'sign_up/sign_up_page.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addSingleton(AuthController.new);
  }

  @override
  void routes(r) {
    r.child(Routes.root, child: (context) => SignInPage(Modular.get()));
    r.child(Routes.signUp, child: (context) => SignUpPage(Modular.get()));
    r.child(Routes.signIn, child: (context) => SignInPage(Modular.get()));
  }
}