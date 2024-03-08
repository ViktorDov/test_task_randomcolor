part of 'main_screen_cubit.dart';

class MainScreenState extends Equatable {
  final Color color;
  final double textSize;

  const MainScreenState({
    this.color = Colors.black,
    this.textSize = 30,
  });

  @override
  List<Object?> get props => [color, textSize];

  MainScreenState copyWith({
    Color? color,
    double? textSize,
  }) {
    return MainScreenState(
      color: color ?? this.color,
      textSize: textSize ?? this.textSize,
    );
  }
}
