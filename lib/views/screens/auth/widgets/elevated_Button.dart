import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget elevatedButton(
    {required String text,
    required BuildContext context,
    required VoidCallback onTap}) {
  return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
    return ElevatedButton(
      onPressed: isLoadingState(state) ? null : onTap,
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(
            Size(getWidth(context), 55),
          ),
          backgroundColor: const MaterialStatePropertyAll(FColors.primaryColor),
          foregroundColor: const MaterialStatePropertyAll(Colors.white)),
      child: isLoadingState(state)
          ? Lottie.asset('assets/lottie_animation/loading.json',
              width: getWidth(context) * 0.1)
          : state is AuthEmailVerificationSended
              ? const Text('Verify E-mail')
              : Text(text),
    );
  });
}

bool isLoadingState(AuthState state) {
  return state is AuthEmailVerificationLoading ||
      state is AuthLoading? ||
      state is AuthPasswordResetLinkSendingLoading?;
}
