import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/get_discount_repo.dart';

part 'get_discount_state.dart';

class GetDiscountCubit extends Cubit<GetDiscountState> {
  GetDiscountCubit() : super(GetDiscountState.initial());

  var discounts;

  Future getAdd() async {
    emit(state.copyWith(status: GetDiscountStatus.loading));
    try {
      discounts = await GetDiscountRepo.getDiscount();
      emit(state.copyWith(status: GetDiscountStatus.success));
    } catch (e) {
      emit(state.copyWith(status: GetDiscountStatus.error));
    }
  }
}
