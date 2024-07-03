
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/constants/toasts.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/auth/widgets/elevated_Button.dart';
import 'package:furnix_store/views/screens/auth/widgets/text_form_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthPasswordResetLinkedSended){
          toast(state.response);
          debugPrint('email has been forwarded to the user\'s email address');
        }
        if(state is AuthPasswordResetLinkSendingFailed){
          toast(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getWidth(context) * 0.3,
                  ),
                  Container(
                    height: getHeight(context)*0.3,
                    child: SvgPicture.asset(
                      'assets/images/auth/Forget Password.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      'Enter your registered email address and we will send you a password reset link!',
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                    height: 20,
                  ),
                  elevatedButton(
                      text: 'Reset Password',
                      context: context,
                      onTap: () {
                        resetPasswordClicked(authBloc);
                        // Call function forgot password clicked
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }

  resetPasswordClicked(AuthBloc authBloc) async {
    if (_formKey.currentState!.validate()) {
      authBloc.add(PasswordResetRequested(email: emailController.text));
    }
  }
}
