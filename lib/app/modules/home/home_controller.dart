import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/errors/app_error_interface.dart';
import '../../data/repository/position_repository.dart';
import '../../models/position_model.dart';
import 'home_states.dart';

class HomeController extends Cubit<HomeState> {
  HomeController(this._repo) : super(LoadingHomeState());

  final PositionRepository _repo;
  final allPositions = <Position>[];

  Future<void> load() async {
    emit(LoadingHomeState());
    try {
      allPositions.addAll(await _repo.getAllPositions());
      emit(SuccessHomeState());
    } on AppError catch (e) {
      emit(ErrorHomeState(e));
    }
  }
}
