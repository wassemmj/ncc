part of 'create_cubit.dart';

enum CreateStatus {
  initial,
  loading,
  success,
  error,
}

class CreateState extends Equatable {
  final CreateStatus status;

  const CreateState({required this.status});

  factory CreateState.initial() => const CreateState(status: CreateStatus.initial);

  @override
  List<Object?> get props => [status];

  CreateState copyWith({
    CreateStatus? status,
  }) {
    return CreateState(
      status: status ?? this.status,
    );
  }
}
