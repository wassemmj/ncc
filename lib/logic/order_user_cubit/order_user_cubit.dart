import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/data/repo/order_user_repo.dart';

part 'order_user_state.dart';

class OrderUserCubit extends Cubit<OrderUserState> {
  OrderUserCubit() : super(OrderUserState.initial());

  var lastOrder;
  var statusOrder;

  Future checkOut(String number,String location) async {
    emit(state.copyWith(status: OrderUserStatus.loading));
    try {
      await OrderUserRepo.checkOut(number, location);
      emit(state.copyWith(status: OrderUserStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OrderUserStatus.error));
    }
  }

  Future getLastOrder() async {
    emit(state.copyWith(status: OrderUserStatus.loading));
    try {
      lastOrder = await OrderUserRepo.getLastOrder();
      print(lastOrder);
      emit(state.copyWith(status: OrderUserStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OrderUserStatus.error));
    }
  }

  Future getOrderByStatus(String status) async {
    emit(state.copyWith(status: OrderUserStatus.loading));
    try {
      statusOrder = await OrderUserRepo.getOrderByStatus(status);
      emit(state.copyWith(status: OrderUserStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OrderUserStatus.error));
    }
  }
}
