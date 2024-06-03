
// ignore_for_file: must_be_immutable

part of 'on_boarding_controller_bloc.dart';


sealed class OnboardingState extends Equatable{
  const OnboardingState();
  @override
  List<Object> get props => [];
}


class OnboardingInitial extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
   int currentPage = 0;

  OnboardingPageChanged({required this.currentPage});
  @override
  List<Object> get props => [currentPage];
}

class UserLoggedIn extends OnboardingState{
  final UserModel user;

  const UserLoggedIn({required this.user});
  @override
  List<Object> get props => [user];
}
class UserNotLoggedIn extends OnboardingState{
}
