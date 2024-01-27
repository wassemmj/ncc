part of 'filter_order_cubit.dart';

enum FilterOrderStatus {
  initial,
  loading,
  success,
  error,
}

class FilterOrderState extends Equatable {
  final FilterOrderStatus status;

  const FilterOrderState({required this.status});

  factory FilterOrderState.initial() => const FilterOrderState(status: FilterOrderStatus.initial);

  @override
  List<Object?> get props => [status];

  FilterOrderState copyWith({
    FilterOrderStatus? status,
  }) {
    return FilterOrderState(
      status: status ?? this.status,
    );
  }
}