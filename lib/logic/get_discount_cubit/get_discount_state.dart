part of 'get_discount_cubit.dart';

enum GetDiscountStatus {
  initial,
  loading,
  success,
  error,
}

class GetDiscountState extends Equatable {
  final GetDiscountStatus status;

  const GetDiscountState({required this.status});

  factory GetDiscountState.initial() => const GetDiscountState(status: GetDiscountStatus.initial);

  @override
  List<Object?> get props => [status];

  GetDiscountState copyWith({
    GetDiscountStatus? status,
  }) {
    return GetDiscountState(
      status: status ?? this.status,
    );
  }
}
