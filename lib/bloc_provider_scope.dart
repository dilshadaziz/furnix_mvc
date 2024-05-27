import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/bloc/bottom_nav/bottom_nav.bloc.dart';
import 'package:furnix_store/bloc/on_boarding/on_boarding_controller_bloc.dart';
import 'package:furnix_store/repositories/auth_repository.dart';
import 'package:furnix_store/views/screens/auth/pages/login_screen.dart';
import 'package:furnix_store/views/screens/auth/pages/send_verification_page.dart';

class BlocProviderScope extends StatelessWidget {
  const BlocProviderScope({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OnboardingBloc(),
          ),
          BlocProvider(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => BottomNavBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Furnix',

          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const SendVerificationPage(),
          // routerConfig: router,
        ),
      ),
    );
  }
}
