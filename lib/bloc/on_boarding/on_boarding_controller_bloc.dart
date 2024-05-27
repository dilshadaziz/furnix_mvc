
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'on_boarding_controller_event.dart';
part 'on_boarding_controller_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController = PageController(); // 
  OnboardingBloc() : super(OnboardingInitial()) {
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
