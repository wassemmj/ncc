import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/data/repo/add_repo.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddState.initial());

  var adds;

  Future getAdd() async {
    emit(state.copyWith(status: AddStatus.loading));
    try {
      adds = await AddRepo.getAdd();
      emit(state.copyWith(status: AddStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddStatus.error));
    }
  }

  Future  makeAdd(File image,String type) async {
    emit(state.copyWith(status: AddStatus.loading));
    try {
      await AddRepo.makeAdd(image, type);
      emit(state.copyWith(status: AddStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddStatus.error));
    }
  }

  Future  editAdd(int id,File image,String type) async {
    emit(state.copyWith(status: AddStatus.loading));
    try {
      await AddRepo.editAdd(id, image, type);
      emit(state.copyWith(status: AddStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddStatus.error));
    }
  }

  Future  deleteAdd(int id) async {
    emit(state.copyWith(status: AddStatus.loading));
    try {
      await AddRepo.deleteAdd(id);
      emit(state.copyWith(status: AddStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddStatus.error));
    }
  }
}
