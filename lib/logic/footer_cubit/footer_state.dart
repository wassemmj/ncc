part of 'footer_cubit.dart';


enum FooterStatus {
  initial,
  loading,
  success,
  error,
}

class FooterState extends Equatable {
  final FooterStatus status;

  const FooterState({required this.status});

  factory FooterState.initial() => const FooterState(status: FooterStatus.initial);

  @override
  List<Object?> get props => [status];

  FooterState copyWith({
    FooterStatus? status,
  }) {
    return FooterState(
      status: status ?? this.status,
    );
  }
}
