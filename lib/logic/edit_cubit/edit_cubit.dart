import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ncc_app/data/repo/edit_repo.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditState.initial());

  Future editCat(int productId,String edit) async {
    emit(state.copyWith(status: EditStatus.loading));
    try {
      await EditRepo.editCat(productId, edit);
      emit(state.copyWith(status: EditStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EditStatus.error));
    }
  }

  Future editSector(int productId,String edit) async {
    emit(state.copyWith(status: EditStatus.loading));
    try {
      await EditRepo.editSector(productId, edit);
      emit(state.copyWith(status: EditStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EditStatus.error));
    }
  }

  Future editSec(int productId,String edit,File? image) async {
    emit(state.copyWith(status: EditStatus.loading));
    try {
      await EditRepo.editSec(productId, edit, image);
      emit(state.copyWith(status: EditStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EditStatus.error));
    }
  }

  Future editProduct(int id,String price,String quantity,String ava) async {
    emit(state.copyWith(status: EditStatus.loading));
    try {
      await EditRepo.editProduct(id, price, quantity,ava);
      emit(state.copyWith(status: EditStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EditStatus.error));
    }
  }
}
