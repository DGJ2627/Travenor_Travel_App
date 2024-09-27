import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_screen_state.dart';

class OnboardingScreenCubit extends Cubit<OnboardingScreenState> {
  OnboardingScreenCubit() : super(const OnboardingScreenState(currentPage: 0));

  void updatePage(int page) {
    emit(OnboardingScreenState(currentPage: page));
  }
}
