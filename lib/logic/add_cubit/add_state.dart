part of 'add_cubit.dart';

enum  AddStatus {
  initial,
  loading,
  success,
  error,
}

class AddState extends Equatable {
  final AddStatus status;

  const AddState({required this.status});

  factory AddState.initial() => const AddState(status: AddStatus.initial);

  @override
  List<Object?> get props => [status];

  AddState copyWith({
    AddStatus? status,
  }) {
    return AddState(
      status: status ?? this.status,
    );
  }
}
