part of 'edit_cubit.dart';

enum EditStatus {
  initial,
  loading,
  success,
  error,
}

class EditState extends Equatable {
  final EditStatus status;

  const EditState({required this.status});

  factory EditState.initial() => const EditState(status: EditStatus.initial);

  @override
  List<Object?> get props => [status];

  EditState copyWith({
    EditStatus? status,
  }) {
    return EditState(
      status: status ?? this.status,
    );
  }
}
