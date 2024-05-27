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
  final String? uid;

  const AuthAuthenticated({this.uid});
}

final class AuthUnauthenticated extends AuthState {}

final class AuthEmailVerificationSuccess extends AuthState {}

final class AuthEmailVerificationLoading extends AuthState {}

final class AuthEmailVerificationFailed extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}
