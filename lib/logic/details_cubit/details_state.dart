part of 'details_cubit.dart';

enum DetailsStatus {
  initial,
  loading,
  success,
  error,
}

class DetailsState extends Equatable {
  final DetailsStatus status;

  const DetailsState({required this.status});

  factory DetailsState.initial() => const DetailsState(status: DetailsStatus.initial);

  @override
  List<Object?> get props => [status];

  DetailsState copyWith({
    DetailsStatus? status,
  }) {
    return DetailsState(
      status: status ?? this.status,
    );
  }
}
