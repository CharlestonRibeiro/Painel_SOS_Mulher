import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painel_sos_mulher/app/modules/home/home_states.dart';
import '../../core/errors/app_error_interface.dart';

class HomeController extends Cubit<HomeState> {
  HomeController(this._repo) : super(LoadingHomeState());

  final _repo;

  Future<void> load() async {
    emit(LoadingHomeState());
    try {
      emit(SuccessHomeState());
    } on AppError catch (e) {
      emit(ErrorHomeState(e));
    }
  }
}
