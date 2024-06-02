import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/splash/splash.bloc.dart';
import 'package:furnix_store/repositories/user_repository.dart';
import 'package:furnix_store/services/auth/firebase_auth.service.dart';
import 'package:furnix_store/views/screens/home/main_screen.dart';
import 'package:furnix_store/views/screens/on_boarding/pages/on_boarding_1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splash = context.read<SplashBloc>();
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context,state){
        if (state is LoggedIn) {
          // Navigate to home page with user ID
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainScreenBody(user: state.user,),), (route) => false);
          // return Container(); // Empty container to avoid rendering
        } 
        if (state is NotLoggedIn) {
          // Navigate to onboarding screen
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> OnBoarding1(),),(route)=> false);
          // return Container(); // Empty container to avoid rendering
        } 
      },
      builder: (context, state) {
        debugPrint("$state");
        
        
        if (state is SplashInitial) {
          // Show splash screen UI with loading indicator
          splash.add(CheckLogin());
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }else {
          return Container(); // Handle unexpected states
        }
      },
    );
  }
}
