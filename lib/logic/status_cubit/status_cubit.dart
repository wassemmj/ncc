import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/status_repo.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(StatusState.initial());


  Future acceptOrder(int id) async {
    emit(state.copyWith(status: StatusStatus.loading));
    try {
      await StatusRepo.acceptOrder(id);
      emit(state.copyWith(status: StatusStatus.success));
    } catch (e) {
      emit(state.copyWith(status: StatusStatus.error));
    }
  }

  Future rejectOrder(int id) async {
    emit(state.copyWith(status: StatusStatus.loading));
    try {
      await StatusRepo.rejectOrder(id);
      emit(state.copyWith(status: StatusStatus.success));
    } catch (e) {
      emit(state.copyWith(status: StatusStatus.error));
    }
  }

  Future changeStatus(int id,String location) async {
    emit(state.copyWith(status: StatusStatus.loading));
    try {
      await StatusRepo.changeStatus(id, location);
      emit(state.copyWith(status: StatusStatus.success));
    } catch (e) {
      emit(state.copyWith(status: StatusStatus.error));
    }
  }
}
