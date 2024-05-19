import 'package:flutter_modular/flutter_modular.dart';
import 'package:painel_sos_mulher/app/data/repository/position_repository.dart';

import '../../app_modular.dart';
import '../../core/routes/routes.dart';
import 'home_controller.dart';
import 'home_page.dart';

final class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addSingleton(PositionRepository.new);
    i.addSingleton(HomeController.new);
  }

  @override
  void routes(r) {
    r.child(Routes.root, child: (context) => HomePage(Modular.get()));
  }
}
