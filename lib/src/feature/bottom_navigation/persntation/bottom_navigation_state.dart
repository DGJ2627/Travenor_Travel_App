part of 'bottom_navigation_cubit.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();
}

class BottomNavigationInitial extends BottomNavigationState {
  final int currentIndex;

  const BottomNavigationInitial(
    this.currentIndex,
  );

  @override
  List<Object> get props => [
        currentIndex,
      ];

  BottomNavigationInitial copyWith({
    int? currentIndex,
  }) {
    return BottomNavigationInitial(currentIndex ?? this.currentIndex);
  }
}

class BottomNavigationFailed extends BottomNavigationState {
  final String message;

  const BottomNavigationFailed(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
