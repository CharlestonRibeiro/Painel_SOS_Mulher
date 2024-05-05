
import 'package:flutter_modular/flutter_modular.dart';
import 'package:painel_sos_mulher/app/modules/home/home_page.dart';

import '../../app_modular.dart';

final class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage(),
    );
  }
}