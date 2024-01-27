part of 'cat_cubit.dart';

enum CatStatus {
  initial,
  loading,
  success,
  error,
}

class CatState extends Equatable {
  final CatStatus status;

  const CatState({required this.status});

  factory CatState.initial() => const CatState(status: CatStatus.initial);

  @override
  List<Object?> get props => [status];

  CatState copyWith({
    CatStatus? status,
  }) {
    return CatState(
      status: status ?? this.status,
    );
  }
}
