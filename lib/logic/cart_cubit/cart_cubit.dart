import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  var cart;
  var qu;

  Future addToCart(int productId,int quantity) async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      var d = await CartRepo.addToCart(productId, quantity);
      qu = d['cartItem']['Quntity'];
      emit(state.copyWith(status: CartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  Future showCart() async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      cart = await CartRepo.showCart();
      emit(state.copyWith(status: CartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  Future deleteItem(int id) async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      await CartRepo.deleteItem(id);
      emit(state.copyWith(status: CartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  Future deleteOneItem(int id) async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      var d = await CartRepo.deleteOneItem(id);
      qu = d['cartItem']['Quntity'];
      emit(state.copyWith(status: CartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  void increment()  {
    emit(qu++);
  }

  void dicrement() {
    if (qu > 1) {
      emit(qu--);
    }
  }
}
