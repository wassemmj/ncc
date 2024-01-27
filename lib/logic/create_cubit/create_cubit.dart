import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ncc_app/data/repo/create_repo.dart';

import '../../data/models/laptop_model.dart';
import '../../data/models/monitor_model.dart';

part 'create_state.dart';

class CreateCubit extends Cubit<CreateState> {
  CreateCubit() : super(CreateState.initial());

  Future createCat(String type) async {
    emit(state.copyWith(status: CreateStatus.loading));
    try {
      await CreateRepo.createCat(type);
      emit(state.copyWith(status: CreateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreateStatus.error));
    }
  }

  Future createSec(String type,File? image,int catId) async {
    emit(state.copyWith(status: CreateStatus.loading));
    try {
      await CreateRepo.createSec(type, image, catId);
      emit(state.copyWith(status: CreateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreateStatus.error));
    }
  }

  Future createSector(String type,int secId) async {
    emit(state.copyWith(status: CreateStatus.loading));
    try {
      await CreateRepo.createSector(type, secId);
      emit(state.copyWith(status: CreateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreateStatus.error));
    }
  }

  Future createProduct(int id,
      String funType,
      List<File> images,
      String type,
      String price,
      String name,
      String availabilty,
      String code,
      String brand,
      String desc,
      String quantity) async {
    emit(state.copyWith(status: CreateStatus.loading));
    try {
      await CreateRepo.createProduct(id, funType, images, type, price, name, availabilty, code, brand, desc, quantity);
      emit(state.copyWith(status: CreateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreateStatus.error));
    }
  }

  Future createMoreDetails(LaptopModel laptopModel,int id) async {
    emit(state.copyWith(status: CreateStatus.loading));
    try {
      await CreateRepo.createMoreDetails(laptopModel, id);
      emit(state.copyWith(status: CreateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreateStatus.error));
    }
  }

  Future createMonitorDetails(MonitorModel laptopModel,int id) async {
    emit(state.copyWith(status: CreateStatus.loading));
    try {
      await CreateRepo.createMonitorDetails(laptopModel, id);
      emit(state.copyWith(status: CreateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreateStatus.error));
    }
  }
}
