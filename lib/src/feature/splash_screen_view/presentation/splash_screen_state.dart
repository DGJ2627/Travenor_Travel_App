part of 'splash_screen_cubit.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();
}

class SplashScreenInitial extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class SplashScreenLoading extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class SplashScreenLoaded extends SplashScreenState {
  final Timer splashTimeOver;

  const SplashScreenLoaded(this.splashTimeOver);

  @override
  List<Object> get props => [splashTimeOver];
}

class SplashScreenError extends SplashScreenState {
  final String message;
  const SplashScreenError(this.message);
  @override
  List<Object> get props => [message];
}
