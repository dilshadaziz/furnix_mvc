
// ignore_for_file: must_be_immutable

part of 'on_boarding_controller_bloc.dart';

@immutable
sealed class OnboardingState{}


class OnboardingInitial extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
   int currentPage = 0;

  OnboardingPageChanged({required this.currentPage});
}
