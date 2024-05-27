part of 'on_boarding_controller_bloc.dart';


@immutable
sealed class OnboardingEvent {}

final class OnboardingNextButtonPressed extends OnboardingEvent {
  final int currentPage;
  OnboardingNextButtonPressed({required this.currentPage});
}

final class OnboardingPreviousButtonPressed extends OnboardingEvent {
  final int currentPage;
  OnboardingPreviousButtonPressed({required this.currentPage});
}
