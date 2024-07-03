import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:lottie/lottie.dart';

passwordChangedPopup(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
            content: SizedBox(
          height: getHeight(context) * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: getWidth(context) * 0.4,
                height: getHeight(context) * 0.17,
                child: Image.asset(
                  'assets/images/auth/security_verified.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Passwrod Changed Successfully',
                style: TextStyle(
                  color: FColors.onBoardingTitleColor.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: getWidth(context) * 0.037,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'The Password has been changed successfully. You will be taken to the login page in a few seconds',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: FColors.onBoardingTitleColor.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: getWidth(context) * 0.036,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Lottie.asset(
                'assets/lottie_animation/loading_green.json',
                width: getWidth(context) * 0.2,
              )
            ],
          ),
        ));
      });
}