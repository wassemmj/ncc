import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/filter_order_repo.dart';

part 'filter_order_state.dart';

class FilterOrderCubit extends Cubit<FilterOrderState> {
  FilterOrderCubit() : super(FilterOrderState.initial());

  Future filterArrived() async {
    emit(state.copyWith(status: FilterOrderStatus.loading));
    try {
      await FilterOrderRepo.filterArrived();
      emit(state.copyWith(status: FilterOrderStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FilterOrderStatus.error));
    }
  }

  Future filterRejected() async {
    emit(state.copyWith(status: FilterOrderStatus.loading));
    try {
      await FilterOrderRepo.filterRejected();
      emit(state.copyWith(status: FilterOrderStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FilterOrderStatus.error));
    }
  }
}
