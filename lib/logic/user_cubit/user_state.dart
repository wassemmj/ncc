part of 'user_cubit.dart';

enum UserStatus {
  initial,
  loading,
  success,
  error,
}

class UserState extends Equatable {
  final UserStatus status;

  const UserState({required this.status});

  factory UserState.initial() => const UserState(status: UserStatus.initial);

  @override
  List<Object?> get props => [status];

  UserState copyWith({
    UserStatus? status,
  }) {
    return UserState(
      status: status ?? this.status,
    );
  }
}
