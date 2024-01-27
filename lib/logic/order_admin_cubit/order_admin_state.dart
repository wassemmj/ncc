part of 'order_admin_cubit.dart';

enum OrderAdminStatus {
  initial,
  loading,
  success,
  error,
}

class OrderAdminState extends Equatable {
  final OrderAdminStatus status;

  const OrderAdminState({required this.status});

  factory OrderAdminState.initial() => const OrderAdminState(status: OrderAdminStatus.initial);

  @override
  List<Object?> get props => [status];

  OrderAdminState copyWith({
    OrderAdminStatus? status,
  }) {
    return OrderAdminState(
      status: status ?? this.status,
    );
  }
}
