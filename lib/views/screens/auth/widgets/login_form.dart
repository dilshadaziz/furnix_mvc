import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/auth/pages/sign_up_screen.dart';
import 'package:furnix_store/views/screens/auth/widgets/elevated_Button.dart';
import 'package:furnix_store/views/screens/auth/widgets/social_media_signIn.dart';
import 'package:furnix_store/views/screens/auth/widgets/span_text.dart';
import 'package:furnix_store/views/screens/auth/widgets/text_form_field.dart';

Form loginForm(
    BuildContext context,
    AuthBloc authBloc,
    GlobalKey<FormState> formKey,
    TextEditingController passwordController,
    TextEditingController emailController) {
  return Form(
    key: formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: getWidth(context) * 0.3,
        ),
        Image.asset(
          'assets/images/auth/Login_screen_image.png',
          width: 100,
        ),
        const Text('Welcome Back'),
        const Text('Login to your account'),
        const SizedBox(
          height: 20,
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
            inputType: TextInputType.name,
            icon: Icons.lock_outlined,
            hintText: 'Password',
            isPassword: true,
            controller: passwordController),
        const SizedBox(
          height: 20,
        ),
        elevatedButton(
            text: 'Sign In',
            context: context,
            onTap: () {
              _loginClicked(
                  authBloc: authBloc,
                  emailController: emailController,
                  passwordController: passwordController,formKey: formKey);
            }),
        const SizedBox(
          height: 15,
        ),
        const Text('forgot Password?'),
        const SizedBox(
          height: 20,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Divider()),
            SizedBox(
              width: 10,
            ),
            Expanded(child: Text('or Continue with')),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        socialMediaSignIn(context,authBloc),
        const SizedBox(
          height: 20,
        ),
        spanText(
            text: 'Don\'t have an account? ',
            span: 'Sign Up',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
              // context.pushNamed(Go.signUp);
            })
      ],
    ),
  );
}

Future<void> _loginClicked(
    {required AuthBloc authBloc,
    required passwordController,
    required emailController,required GlobalKey<FormState> formKey}) async {
    if(formKey.currentState!.validate()){
  authBloc.add(
    LoginRequested(
      email: emailController.text,
      password: passwordController.text,
    ),
  );
    }
}
