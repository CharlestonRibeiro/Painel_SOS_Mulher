import 'package:flutter_modular/flutter_modular.dart';

import 'core/routes/routes.dart';
import 'data/clients/client_interface.dart';
import 'data/clients/firebase_client.dart';
import 'modules/audio/audio_module.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {}

  @override
  void binds(Injector i) {
    i.addSingleton<ClientInterface>(FirebaseClient.new);
  }

  @override
  void routes(r) {
    r.module(Routes.root, module: HomeModule());
    r.module(Routes.auth, module: AuthModule());
    r.module(Routes.home, module: HomeModule());
    r.module(Routes.audios, module: AudioModule());
    r.module(Routes.history, module: HomeModule());
    r.module(Routes.register, module: HomeModule());
  }
}
