import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/color_repo.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState.initial());

  var color;

  Future getColor() async {
    emit(state.copyWith(status: ColorStatus.loading));
    try {
      color = await ColorRepo.getColor();
      emit(state.copyWith(status: ColorStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ColorStatus.error));
    }
  }

  Future updateColor(int R, int G, int B, double A) async {
    emit(state.copyWith(status: ColorStatus.loading));
    try {
      var d = await ColorRepo.changeColor(R, G, B, A);
      emit(state.copyWith(status: ColorStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ColorStatus.error));
    }
  }
}
