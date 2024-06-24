import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/routes/routes.dart';
import 'data/clients/client_interface.dart';
import 'data/clients/firebase_client.dart';
import 'data/repository/audio_repository.dart';
import 'data/repository/position_repository.dart';
import 'modules/audio/audio_controller.dart';
import 'modules/audio/audio_module.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/register/register_module.dart';

class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {}

  @override
  void binds(Injector i) {
    i.addSingleton<ClientInterface>(FirebaseClient.new);
    i.addSingleton(PositionRepository.new);
    i.addInstance(MapController());
    i.addSingleton(HomeController.new);
    i.addSingleton(AudioRepository.new);
    i.addSingleton(AudioController.new);
  }

  @override
  void routes(r) {
    r.module(Routes.root, module: HomeModule());
    r.module(Routes.auth, module: AuthModule());
    r.module(Routes.home, module: HomeModule());
    r.module(Routes.audios, module: AudioModule());
    r.module(Routes.register, module: RegisterModule());
  }
}
