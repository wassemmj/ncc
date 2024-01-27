part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  error,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final AuthModel authModel;

  const AuthState({required this.status,required this.authModel});

  factory AuthState.initial() => AuthState(status: AuthStatus.initial, authModel: AuthModel.initial());

  @override
  List<Object?> get props => [status,authModel];

  AuthState copyWith({
    AuthStatus? status,
    AuthModel? authModel,
  }) {
    return AuthState(
      status: status ?? this.status,
      authModel: authModel ?? this.authModel,
    );
  }
}