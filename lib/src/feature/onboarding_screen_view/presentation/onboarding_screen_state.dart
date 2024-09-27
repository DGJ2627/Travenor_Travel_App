part of 'onboarding_screen_cubit.dart';

class OnboardingScreenState extends Equatable {
  final int currentPage;

  const OnboardingScreenState({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}
