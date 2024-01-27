part of 'order_user_cubit.dart';

enum OrderUserStatus {
  initial,
  loading,
  success,
  error,
}

class OrderUserState extends Equatable {
  final OrderUserStatus status;

  const OrderUserState({required this.status});

  factory OrderUserState.initial() => const OrderUserState(status: OrderUserStatus.initial);

  @override
  List<Object?> get props => [status];

  OrderUserState copyWith({
    OrderUserStatus? status,
  }) {
    return OrderUserState(
      status: status ?? this.status,
    );
  }
}
