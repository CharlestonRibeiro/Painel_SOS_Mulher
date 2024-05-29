import 'package:flutter_modular/flutter_modular.dart';

import '../../app_modular.dart';
import '../../core/routes/routes.dart';
import '../../data/repository/audio_repository.dart';
import 'audio_controller.dart';
import 'audio_page.dart';

final class AudioModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addSingleton(AudioRepository.new);
    i.addSingleton(AudioController.new);
  }

  @override
  void routes(r) {
    r.child(Routes.root, child: (context) => AudioPage(Modular.get()));
  }
}
