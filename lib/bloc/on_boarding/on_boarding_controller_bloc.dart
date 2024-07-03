// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/repositories/auth_repository.dart';
import 'package:furnix_store/repositories/user_repository.dart';

part 'on_boarding_controller_event.dart';
part 'on_boarding_controller_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final PageController pageController = PageController(); //
  OnboardingBloc({
    required this.authRepository,
    required this.userRepository,
  }) : super(OnboardingInitial()) {
    on<OnboardingNextButtonPressed>((event, emit) {
      final currentPage = event.currentPage;
      return emit(OnboardingPageChanged(currentPage: currentPage + 1));
    });
    on<OnboardingPreviousButtonPressed>((event, emit) {
      final currentPage = event.currentPage;
      emit(OnboardingPageChanged(currentPage: currentPage - 1));
    });
  }
}
