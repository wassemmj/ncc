import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/data/repo/discount_repo.dart';

part 'discount_state.dart';

class DiscountCubit extends Cubit<DiscountState> {
  DiscountCubit() : super(DiscountState.initial());

  var message;

  Future makeDiscountProduct(int productId,int percentageOff,int type) async {
    emit(state.copyWith(status: DiscountStatus.loading));
    try {
      await DiscountRepo.makeDiscountProduct(productId, percentageOff,type);
      emit(state.copyWith(status: DiscountStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DiscountStatus.error));
    }
  }

  Future deleteDiscountProduct(int productId,int type) async {
    emit(state.copyWith(status: DiscountStatus.loading));
    try {
      message = await DiscountRepo.deleteDiscountProduct(productId,type);
      emit(state.copyWith(status: DiscountStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DiscountStatus.error));
    }
  }
}
