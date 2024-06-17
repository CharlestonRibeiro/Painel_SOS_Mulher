import 'package:flutter_modular/flutter_modular.dart';
import 'package:painel_sos_mulher/app/modules/register/register_page.dart';
import '../../app_modular.dart';
import '../../core/routes/routes.dart';

final class RegisterModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void routes(r) {
      r.child(Routes.root, child: (context) => RegisterPage(Modular.get(), Modular.get()));
  
  }
}

