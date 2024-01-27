
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/data/repo/delete_repo.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteState.initial());

  Future deleteCat(int catId) async {
    emit(state.copyWith(status: DeleteStatus.loading));
    try {
      await DeleteRepo.deleteCat(catId);
      emit(state.copyWith(status: DeleteStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DeleteStatus.error));
    }
  }

  Future deleteSec(int secId) async {
    emit(state.copyWith(status: DeleteStatus.loading));
    try {
      await DeleteRepo.deleteSec(secId);
      emit(state.copyWith(status: DeleteStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DeleteStatus.error));
    }
  }

  Future deleteSector(int secId) async {
    emit(state.copyWith(status: DeleteStatus.loading));
    try {
      await DeleteRepo.deleteSector(secId);
      emit(state.copyWith(status: DeleteStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DeleteStatus.error));
    }
  }

  Future deleteProduct(int productId) async {
    emit(state.copyWith(status: DeleteStatus.loading));
    try {
      await DeleteRepo.deleteProduct(productId);
      emit(state.copyWith(status: DeleteStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DeleteStatus.error));
    }
  }
}
