part of 'discount_cubit.dart';


enum DiscountStatus {
  initial,
  loading,
  success,
  error,
}

class DiscountState extends Equatable {
  final DiscountStatus status;

  const DiscountState({required this.status});

  factory DiscountState.initial() => const DiscountState(status: DiscountStatus.initial);

  @override
  List<Object?> get props => [status];

  DiscountState copyWith({
    DiscountStatus? status,
  }) {
    return DiscountState(
      status: status ?? this.status,
    );
  }
}
