import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/data/repo/fav_repo.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavState.initial());

  var fav;

  Future makeFav(int productId) async {
    emit(state.copyWith(status: FavStatus.loading));
    try {
      await FavRepo.makeFav(productId);
      emit(state.copyWith(status: FavStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FavStatus.error));
    }
  }

  Future getFav() async {
    emit(state.copyWith(status: FavStatus.loading));
    try {
      fav = await FavRepo.getFav();
      print(fav);
      emit(state.copyWith(status: FavStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FavStatus.error));
    }
  }
}
