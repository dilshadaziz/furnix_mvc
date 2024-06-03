// ignore_for_file: must_be_immutable

part of 'auth.bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthAuthenticated extends AuthState {
  final UserModel user;

  const AuthAuthenticated({required this.user});
  @override
  List<Object> get props => [user];
}

final class AuthUnauthenticated extends AuthState {}

final class AuthSignUpRequestSuccess extends AuthState {
  final UserModel user;

  const AuthSignUpRequestSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

final class AuthLoaded extends AuthState {}

final class AuthEmailVerificationSuccess extends AuthState {}

final class AuthEmailVerificationLoading extends AuthState {}

final class AuthEmailVerificationSended extends AuthState {
  final String email;

  const AuthEmailVerificationSended({required this.email});
  @override
  List<Object> get props => [email];
}

final class AuthPasswordResetLinkedSended extends AuthState {
  final String response;

  const AuthPasswordResetLinkedSended({required this.response});
  @override
  List<Object> get props => [response];
}
final class AuthPasswordResetLinkSendingLoading extends AuthState{}

final class AuthPasswordResetLinkSendingFailed extends AuthState {
  final String error;

  const AuthPasswordResetLinkSendingFailed({required this.error});
  @override
  List<Object> get props => [error];
}

final class AuthEmailVerificationFailed extends AuthState {
  final String message;

  const AuthEmailVerificationFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class AuthGoogleSignInLoading extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}
