import 'package:flutter_modular/flutter_modular.dart';

import '../../app_modular.dart';
import '../../core/routes/routes.dart';
import 'audio_page.dart';

final class AudioModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void routes(r) {
    r.child(
      Routes.root,
      child: (context) => AudioPage(Modular.get(), Modular.get()),
    );
  }
}
