import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/address/address.bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/bloc/bottom_nav/bottom_nav.bloc.dart';
import 'package:furnix_store/bloc/on_boarding/on_boarding_controller_bloc.dart';
import 'package:furnix_store/bloc/splash/splash.bloc.dart';
import 'package:furnix_store/bloc/user/user.bloc.dart';
import 'package:furnix_store/repositories/auth_repository.dart';
import 'package:furnix_store/repositories/user_repository.dart';
import 'package:furnix_store/services/auth/firebase_auth.service.dart';
import 'package:furnix_store/views/screens/splash/splash_screen.dart';

class BlocProviderScope extends StatelessWidget {
  const BlocProviderScope({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashBloc(authRepository: context.read<AuthRepository>(),userRepository: context.read<UserRepository>())),
          BlocProvider(
            create: (context) => OnboardingBloc(authRepository: context.read<AuthRepository>(),userRepository: context.read<UserRepository>()),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
            )
          ),
          BlocProvider(
            create: (context) => UserBloc(userRepository: context.read<UserRepository>())
          ),
          BlocProvider(
            create: (context) => BottomNavBloc(),
          ),
          BlocProvider(
            create: (context) => AddressBloc(userRepository: context.read<UserRepository>(),authRepository: context.read<AuthRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Furnix',

          theme: ThemeData(
            useMaterial3: true,
          ),
          home: SplashScreen(),
          // routerConfig: router,
        ),
      ),
    );
  }
}
