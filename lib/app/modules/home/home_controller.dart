import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../core/errors/app_error_interface.dart';
import '../../data/repository/position_repository.dart';
import '../../models/position_model.dart';
import 'home_states.dart';

class HomeController extends Cubit<HomeState> {
  HomeController(this._repo, this.mapController) : super(InitialHomeState()) {
    load();
  }

  final PositionRepository _repo;
  final allPositions = <Position>[];
  final MapController mapController;

  Future<void> load() async {
    if (state is! LoadingHomeState) {
      emit(LoadingHomeState());
      try {
        allPositions.clear();
        allPositions.addAll(await _repo.getAllPositions());
        emit(SuccessHomeState());
      } on AppError catch (e) {
        emit(ErrorHomeState(e));
      }
    }
  }

  Future<bool> deactivateAlert(Position position) async {
    try {
      final result = await _repo.deactivateAlert(position.id);
      await load();
      return result;
    } on AppError catch (e) {
      emit(ErrorHomeState(e));
      return false;
    }
  }
}
