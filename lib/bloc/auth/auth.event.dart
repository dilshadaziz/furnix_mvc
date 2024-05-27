part of 'auth.bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});
}

final class SignupRequested extends AuthEvent {
  final UserModel user;

 const SignupRequested({required this.user});
}
final class SendEmailVerificationRequested extends AuthEvent{
  final String email;

  const SendEmailVerificationRequested({required this.email});

}
final class LogoutRequested extends AuthEvent {}
