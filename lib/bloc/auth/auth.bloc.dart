import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import '../../repositories/auth_repository.dart';

part 'auth.event.dart';
part 'auth.state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignupRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final String? uid = await authRepository.login(event.email, event.password);
      if(uid == null){
        return emit(const AuthError(message: 'Invalid email or password'));
      }
      return emit(AuthAuthenticated(uid:uid));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onSignupRequested(
      SignupRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
     final result = await authRepository.signup(user: event.user);
     if(result != 'user created'){
      emit(AuthError(message: result));
     }
     else{
      emit(AuthAuthenticated());
     }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
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
}
