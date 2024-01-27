part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;

  const HomeState({required this.status});

  factory HomeState.initial() => const HomeState(status: HomeStatus.initial);

  @override
  List<Object?> get props => [status];

  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }
}
