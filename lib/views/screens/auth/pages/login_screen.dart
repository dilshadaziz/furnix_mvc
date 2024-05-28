import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/views/screens/auth/pages/sign_up_screen.dart';
import 'package:furnix_store/views/screens/auth/widgets/elevated_Button.dart';
import 'package:furnix_store/views/screens/auth/widgets/login_form.dart';
import 'package:furnix_store/views/screens/auth/widgets/social_media_signIn.dart';
import 'package:furnix_store/views/screens/auth/widgets/span_text.dart';
import 'package:furnix_store/views/screens/auth/widgets/text_form_field.dart';
import 'package:furnix_store/utils/constants/route_names.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnix_store/views/screens/home/main_screen.dart';
import 'package:go_router/go_router.dart';

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
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainScreenBody(user: state.user,),), (route) => false);
          } else if (state is AuthError) {
            print('in the auth erro');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
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
            child: SingleChildScrollView(
              child: loginForm(context, authBloc,_formKey,emailController,passwordController),
            ),
          ));
        },
      ),
    );
  }

  
}
