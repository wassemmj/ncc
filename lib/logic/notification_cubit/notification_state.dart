part of 'notification_cubit.dart';

enum NotificationStatus {
  initial,
  loading,
  success,
  error,
}

class NotificationState extends Equatable {
  final NotificationStatus status;

  const NotificationState({required this.status});

  factory NotificationState.initial() => const NotificationState(status: NotificationStatus.initial);

  @override
  List<Object?> get props => [status];

  NotificationState copyWith({
    NotificationStatus? status,
  }) {
    return NotificationState(
      status: status ?? this.status,
    );
  }
}
