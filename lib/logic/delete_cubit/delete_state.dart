part of 'delete_cubit.dart';

enum DeleteStatus {
  initial,
  loading,
  success,
  error,
}

class DeleteState extends Equatable {
  final DeleteStatus status;

  const DeleteState({required this.status});

  factory DeleteState.initial() => const DeleteState(status: DeleteStatus.initial);

  @override
  List<Object?> get props => [status];

  DeleteState copyWith({
    DeleteStatus? status,
  }) {
    return DeleteState(
      status: status ?? this.status,
    );
  }
}
