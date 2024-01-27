part of 'advert_cubit.dart';

enum AdvertStatus {
  initial,
  loading,
  success,
  error,
}

class AdvertState extends Equatable {
  final AdvertStatus status;

  const AdvertState({required this.status});

  factory AdvertState.initial() => const AdvertState(status: AdvertStatus.initial);

  @override
  List<Object?> get props => [status];

  AdvertState copyWith({
    AdvertStatus? status,
  }) {
    return AdvertState(
      status: status ?? this.status,
    );
  }
}
