part of 'status_cubit.dart';

enum StatusStatus {
  initial,
  loading,
  success,
  error,
}

class StatusState extends Equatable {
  final StatusStatus status;

  const StatusState({required this.status});

  factory StatusState.initial() => const StatusState(status: StatusStatus.initial);

  @override
  List<Object?> get props => [status];

  StatusState copyWith({
    StatusStatus? status,
  }) {
    return StatusState(
      status: status ?? this.status,
    );
  }
}
