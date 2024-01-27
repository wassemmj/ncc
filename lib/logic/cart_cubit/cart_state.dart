part of 'cart_cubit.dart';

enum CartStatus {
  initial,
  loading,
  success,
  error,
}

class CartState extends Equatable {
  final CartStatus status;

  const CartState({required this.status});

  factory CartState.initial() => const CartState(status: CartStatus.initial);

  @override
  List<Object?> get props => [status];

  CartState copyWith({
    CartStatus? status,
  }) {
    return CartState(
      status: status ?? this.status,
    );
  }
}
