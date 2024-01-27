import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/data/repo/order_admin_repo.dart';

part 'order_admin_state.dart';

class OrderAdminCubit extends Cubit<OrderAdminState> {
  OrderAdminCubit() : super(OrderAdminState.initial());

  var allOrder;
  var stockOrder;
  var onWayOrder;
  var arrivedOrder;

  Future getAllOrder() async {
    emit(state.copyWith(status: OrderAdminStatus.loading));
    try {
      allOrder = await OrderAdminRepo.getAllOrder();
      emit(state.copyWith(status: OrderAdminStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OrderAdminStatus.error));
    }
  }

  Future getInStockOrder() async {
    emit(state.copyWith(status: OrderAdminStatus.loading));
    try {
      stockOrder = await OrderAdminRepo.getInStockOrder();
      emit(state.copyWith(status: OrderAdminStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OrderAdminStatus.error));
    }
  }

  Future getOnWayOrder() async {
    emit(state.copyWith(status: OrderAdminStatus.loading));
    try {
      onWayOrder = await OrderAdminRepo.getOnWayOrder();
      emit(state.copyWith(status: OrderAdminStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OrderAdminStatus.error));
    }
  }

  Future getArrived() async {
    emit(state.copyWith(status: OrderAdminStatus.loading));
    try {
      arrivedOrder = await OrderAdminRepo.getArrived();
      emit(state.copyWith(status: OrderAdminStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OrderAdminStatus.error));
    }
  }

}
