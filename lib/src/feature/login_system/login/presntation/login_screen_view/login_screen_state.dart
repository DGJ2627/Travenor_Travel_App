part of 'login_screen_cubit.dart';

abstract class LoginScreenState extends Equatable {
  const LoginScreenState();
}

class LoginScreenInitial extends LoginScreenState {
  @override
  List<Object> get props => [];
}

class LoginScreenLoaded extends LoginScreenState {
  final bool isEyeOpen;

  const LoginScreenLoaded(this.isEyeOpen);

  @override
  List<Object> get props => [];
}
