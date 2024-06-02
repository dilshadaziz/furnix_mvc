

part of 'splash.bloc.dart';
sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class CheckLogin extends SplashEvent {}
