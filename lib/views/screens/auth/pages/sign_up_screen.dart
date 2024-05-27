import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/views/screens/auth/widgets/continue_with_divider.dart';
import 'package:furnix_store/views/screens/auth/widgets/elevated_Button.dart';
import 'package:furnix_store/views/screens/auth/widgets/social_media_signIn.dart';
import 'package:furnix_store/views/screens/auth/widgets/span_text.dart';
import 'package:furnix_store/views/screens/auth/widgets/text_form_field.dart';
import 'package:furnix_store/views/screens/home/main_screen.dart';
import 'package:furnix_store/utils/constants/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final emailController = TextEditingController();

  final locationController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            print('authenticatedddddddddddddd');
              nameController.clear();
              passwordController.clear();
              locationController.clear();
              emailController.clear();
              confirmPasswordController.clear();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MainScreenBody()));
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (context) => const HomePage()),
            // );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/images/auth/Login_screen_image.png',
                      width: 100,
                    )),
                    const Text('Register'),
                    const Text('Create Your New Account'),
                    const SizedBox(
                      height: 20,
                    ),
                    FormContainerWidget(
                      isPassword: false,
                      inputType: TextInputType.name,
                      icon: CupertinoIcons.person,
                      hintText: 'Full name',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      isPassword: false,
                      inputType: TextInputType.emailAddress,
                      icon: CupertinoIcons.mail,
                      hintText: 'Email address',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      inputType: TextInputType.streetAddress,
                      icon: Icons.location_on_outlined,
                      hintText: 'Locaiton',
                      isPassword: false,
                      controller: locationController,
                      fetchLocation: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormContainerWidget(
                        inputType: TextInputType.name,
                        icon: Icons.lock_outlined,
                        hintText: 'Password',
                        isPassword: true,
                        controller: passwordController),
                    const SizedBox(
                      height: 20,
                    ),
                    FormContainerWidget(
                      inputType: TextInputType.name,
                      icon: Icons.lock_outlined,
                      hintText: 'Confirm Password',
                      isPassword: true,
                      controller: confirmPasswordController,
                      passwordController: passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    elevatedButton(
                        text: 'Sign Up',
                        context: context,
                        onTap: () {
                          _signUpUser(authBloc, _formKey);
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    continueWithDivider(),
                    const SizedBox(
                      height: 20,
                    ),
                    socialMediaSignIn(context),
                    const SizedBox(
                      height: 20,
                    ),
                    spanText(
                        text: 'Already have an account?',
                        span: 'Sign In',
                        onTap: () {
                          context.pushNamed(Go.passwordLogin);
                        })
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }

  void _signUpUser(AuthBloc authBloc, GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      authBloc.add(
        SignupRequested(
          user: UserModel(
            uid: '',
            email: emailController.text,
            fullName: nameController.text,
            location: locationController.text,
            password: passwordController.text,
          ),
        ),
      );
    }
  }
}
