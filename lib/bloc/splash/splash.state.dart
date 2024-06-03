part of 'splash.bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class LoggedIn extends SplashState {
  final UserModel user;

  const LoggedIn(this.user);
  @override
  List<Object> get props => [user];
}

class NotLoggedIn extends SplashState {}
