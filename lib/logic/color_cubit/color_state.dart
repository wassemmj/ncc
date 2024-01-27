part of 'color_cubit.dart';

enum ColorStatus {
  initial,
  loading,
  success,
  error,
}

class ColorState extends Equatable {
  final ColorStatus status;

  const ColorState({required this.status});

  factory ColorState.initial() => const ColorState(status: ColorStatus.initial);

  @override
  List<Object?> get props => [status];

  ColorState copyWith({
    ColorStatus? status,
  }) {
    return ColorState(
      status: status ?? this.status,
    );
  }
}