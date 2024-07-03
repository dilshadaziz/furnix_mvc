
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:flutter/material.dart';

Widget socialMediaSignIn(BuildContext context, AuthBloc authBloc) {
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      return ElevatedButton(
        onPressed: () {
          state is AuthGoogleSignInLoading ? null:
          authBloc.add(GoogleSignInRequested());
        },
        style: ButtonStyle(
            shadowColor: const MaterialStatePropertyAll(FColors.primaryColor),
            overlayColor: const MaterialStatePropertyAll(FColors.primaryBgColor),
            elevation: const MaterialStatePropertyAll(3),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: FColors.primaryBgColor.withOpacity(0.6)))),
            fixedSize: MaterialStatePropertyAll(
              Size(getWidth(context), 55),
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            foregroundColor: const MaterialStatePropertyAll(Colors.black87)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/logos/Google_logo.png',
              height: getWidth(context) * 0.08,
            ),
            Text(
              'Continue with Google',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getWidth(context) * 0.04,
                  color: Colors.black87.withOpacity(0.8)),
            )
          ],
        ),
      );
    },
  );
}

  // Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 GestureDetector(
  //                   onTap:()async{
  //                     await FirebaseAuthService().signInWithFacebook();
  //                   },
  //                   child: Container(
  //                     height: 60,
  //                     width: 60,
  //                     decoration: BoxDecoration(
  //                         border: Border.all(),
  //                         borderRadius: BorderRadius.circular(10)),
  //                     child: Center(
  //                       child: Image.asset(
  //                         'assets/icons/logos/Facebook_logo.png',
  //                         height: getWidth(context) * 0.08,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Container(
  //                   height: 60,
  //                   width: 60,
  //                   decoration: BoxDecoration(
  //                       border: Border.all(),
  //                       borderRadius: BorderRadius.circular(10)),
  //                   child: Center(
  //                     child: Image.asset(
  //                       'assets/icons/logos/Apple_logo_black.png',
  //                       height: getWidth(context) * 0.08,
  //                     ),
  //                   ),
  //                 ),
  //                 GestureDetector(
  //                   onTap: (){
  //                     authBloc.add(GoogleSignInRequested());
  //                   },
  //                   child: Container(
  //                     height: 60,
  //                     width: 60,
  //                     decoration: BoxDecoration(
  //                         border: Border.all(),
  //                         borderRadius: BorderRadius.circular(10)),
  //                     child: Center(
  //                       child: Image.asset(
  //                         'assets/icons/logos/Google_logo.png',
  //                         height: getWidth(context) * 0.08,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             );