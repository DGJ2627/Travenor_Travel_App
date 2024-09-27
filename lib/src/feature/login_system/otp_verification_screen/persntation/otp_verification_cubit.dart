import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit() : super(const OtpVerificationInitial(timerValue: 60));
  Timer? _timer;

  Future<void> startTime() async {
    _timer?.cancel();
    emit(const OtpVerificationInitial(timerValue: 60));

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (state.timerValue == 0) {
          timer.cancel();
          emit(const OtpVerificationExpired());
        } else {
          emit(OtpVerificationSendCode(timerValue: state.timerValue - 1));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

/*

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit() : super(OtpVerificationInitial(timerValue: 60));

  Timer? _timer;

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    emit(OtpVerificationInitial(timerValue: 60)); // Reset timer value

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (state.timerValue == 0) {
          timer.cancel();
          emit(OtpVerificationTimerExpired());
        } else {
          emit(OtpVerificationTimerTicking(timerValue: state.timerValue - 1));
        }
      },
    );
  }@override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
 */
