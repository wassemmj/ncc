part of 'account_cubit.dart';

enum AccountStatus {
  initial,
  loading,
  success,
  error,
}

class AccountState extends Equatable {
  final AccountStatus status;

  const AccountState({required this.status});

  factory AccountState.initial() =>
      const AccountState(status: AccountStatus.initial);

  @override
  List<Object?> get props => [status];

  AccountState copyWith({
    AccountStatus? status,
  }) {
    return AccountState(
      status: status ?? this.status,
    );
  }
}