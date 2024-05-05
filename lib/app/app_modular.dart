import 'package:flutter_modular/flutter_modular.dart';
import 'package:painel_sos_mulher/app/core/routes/routes.dart';
import 'package:painel_sos_mulher/app/modules/auth/auth_module.dart';


class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {
      
  }

  @override
  void binds(Injector i) {

  }

  @override
  void routes(r) {
    r.module(Routes.root, module: AuthModule());
  }
}