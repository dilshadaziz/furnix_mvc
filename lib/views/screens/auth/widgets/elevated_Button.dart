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
  return BlocBuilder<AuthBloc,AuthState>(
    builder: (context,state) {
      return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(
              Size(getWidth(context), 55),
            ),
            backgroundColor: const MaterialStatePropertyAll(FColors.primaryColor),
            foregroundColor: const MaterialStatePropertyAll(Colors.white)),
        child: state is !AuthEmailVerificationLoading ? Lottie.asset('assets/lottie_animation/loading.json',) :Text(text),
      );
    }
  );
}
