import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/cat_repo.dart';
import '../../data/repo/home_repo.dart';

part 'advert_state.dart';

class AdvertCubit extends Cubit<AdvertState> {
  AdvertCubit() : super(AdvertState.initial());

  var products;

  Future search(String word) async {
    products = null;
    emit(state.copyWith(status: AdvertStatus.loading));
    try {
      products = await HomeRepo.search(word);
      emit(state.copyWith(status: AdvertStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AdvertStatus.error));
    }
  }

  Future getNewProduct(String sort) async {
    products = null;
    emit(state.copyWith(status: AdvertStatus.loading));
    try {
      products = await HomeRepo.getNewProduct(sort);
      emit(state.copyWith(status: AdvertStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AdvertStatus.error));
    }
  }

  Future getDiscountProduct(String sort) async {
    products = null;
    emit(state.copyWith(status: AdvertStatus.loading));
    try {
      products = await HomeRepo.getDiscountProduct(sort);
      emit(state.copyWith(status: AdvertStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AdvertStatus.error));
    }
  }

  Future api(String api, String type) async {
    products = null;
    emit(state.copyWith(status: AdvertStatus.loading));
    try {
      products = await CatRepo.api(api);
      emit(state.copyWith(status: AdvertStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AdvertStatus.error));
    }
  }

  Future getSector(int secId,String sort) async {
    products = null;
    emit(state.copyWith(status: AdvertStatus.loading));
    try {
      products = await CatRepo.sectorRepo(secId, sort);
      emit(state.copyWith(status: AdvertStatus.success));
    } catch(e) {
      emit(state.copyWith(status: AdvertStatus.error));
    }
  }
}
