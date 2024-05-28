import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/services/auth/firebase_auth.service.dart';
import 'package:furnix_store/services/user/firebase_user.service.dart';
import '../../repositories/auth_repository.dart';

part 'auth.event.dart';
part 'auth.state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignupRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<SendEmailVerificationRequested>(_onSendEmailVerificationRequested);
    on<VerifyEmailRequested>(_onVerifyEmailRequested);
    on<AuthNavigateToSignUpRequested>(_onAuthNavigatetoSignUpRequested);
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final String? uid =
          await authRepository.login(event.email, event.password);
      if (uid == null) {
        return emit(const AuthError(message: 'Invalid email or password'));
      }
      final user = await FirebaseUserService().getUser();
      return emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onSignupRequested(
      SignupRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await authRepository.signup(user: event.user);
    await Future.delayed(Duration(seconds: 2));
    if(response != 'user created'){
      return emit(AuthError(message: response));
    }
    return emit(AuthSignUpRequestSuccess(user: event.user));
  }

  void _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      // Handle logout errors if needed
    }
  }

  Future<void> _onSendEmailVerificationRequested(
      SendEmailVerificationRequested event, Emitter<AuthState> emit) async {
    emit(AuthEmailVerificationLoading());
    try {
      await authRepository.sendEmailVerificationLink();
      emit(AuthEmailVerificationSended(email: event.email));
    } catch (e) {
      emit(AuthEmailVerificationFailed(message: e.toString()));
    }
  }

  Future<void> _onVerifyEmailRequested(
      VerifyEmailRequested event, Emitter<AuthState> emit) async {
    emit(AuthEmailVerificationLoading());
    try {
      final verified = await authRepository.checkVerifiedOrNot();
      if (verified) {
        emit(AuthEmailVerificationSuccess());
        await Future.delayed(const Duration(seconds: 3));
        final user = await FirebaseUserService().getUser();
        emit( AuthAuthenticated(user:user));
      } else {
        emit(const AuthEmailVerificationFailed(
            message: 'Your e-mail is not verified'));
      }
    } catch (e) {
      emit(AuthEmailVerificationFailed(message: e.toString()));
    }
  }

  FutureOr<void> _onAuthNavigatetoSignUpRequested(
      AuthNavigateToSignUpRequested event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  Future<void> _onGoogleSignInRequested(GoogleSignInRequested event, Emitter<AuthState> emit) async{

    try {
        final UserModel? user = await authRepository.signInWithGoogle();
        if (user != null) {
          emit(AuthAuthenticated(user: user));
        } else {
          emit( AuthError(message: 'Google sign-in failed'));
        }
      } catch (e) {
        emit( AuthError(message: e.toString()));
      }
  }
}
