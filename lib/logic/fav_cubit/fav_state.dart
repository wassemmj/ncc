part of 'fav_cubit.dart';

enum FavStatus {
  initial,
  loading,
  success,
  error,
}

class FavState extends Equatable {
  final FavStatus status;

  const FavState({required this.status});

  factory FavState.initial() => const FavState(status: FavStatus.initial);

  @override
  List<Object?> get props => [status];

  FavState copyWith({
    FavStatus? status,
  }) {
    return FavState(
      status: status ?? this.status,
    );
  }
}
