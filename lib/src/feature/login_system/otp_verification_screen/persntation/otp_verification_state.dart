part of 'otp_verification_cubit.dart';

abstract class OtpVerificationState extends Equatable {
  final int timerValue;

  const OtpVerificationState({this.timerValue = 0});

  @override
  List<Object> get props => [timerValue];
}

class OtpVerificationInitial extends OtpVerificationState {
  const OtpVerificationInitial({required super.timerValue});
}

class OtpVerificationSendCode extends OtpVerificationState {
  const OtpVerificationSendCode({required super.timerValue});
}

class OtpVerificationExpired extends OtpVerificationState {
  const OtpVerificationExpired() : super();
}

/*
abstract class OtpVerificationState extends Equatable {
  final int timerValue;
  const OtpVerificationState({this.timerValue = 0});

  @override
  List<Object> get props => [timerValue];
}

class OtpVerificationInitial extends OtpVerificationState {
  const OtpVerificationInitial({required int timerValue}) : super(timerValue: timerValue);
}

class OtpVerificationTimerTicking extends OtpVerificationState {
  const OtpVerificationTimerTicking({required int timerValue}) : super(timerValue: timerValue);
}

class OtpVerificationTimerExpired extends OtpVerificationState {
  const OtpVerificationTimerExpired() : super();
}
 */
