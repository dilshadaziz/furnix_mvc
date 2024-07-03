import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/navigations/right_to_left.dart';
import 'package:furnix_store/utils/constants/toasts.dart';
import 'package:furnix_store/views/screens/auth/widgets/login_form.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:flutter/material.dart';
import 'package:furnix_store/views/screens/home/main_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.of(context).pushAndRemoveUntil(rightToLeft(MainScreenBody(user: state.user,),duration: const Duration(milliseconds: 350)),(route) => false,);
          } else if (state is AuthError) {
            toast(state.message);
          }
        },
        builder: (context, state) {
          // if (state is AuthLoading) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          return SafeArea(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Stack(
              children: [
                state is AuthGoogleSignInLoading ? Positioned(left: getWidth(context)*0.34,top: getHeight(context)*0.4, child: Lottie.asset(
            'assets/lottie_animation/loading_green.json',
            width: getWidth(context) * 0.2,
          )) : Container(),
                SingleChildScrollView(
                  child: loginForm(context, authBloc,_formKey,emailController,passwordController),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }

  
}
