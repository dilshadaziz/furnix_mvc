import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:lottie/lottie.dart';

 accountCreatedPopup(BuildContext context)  {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
            content: SizedBox(
          height: getHeight(context) * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: getWidth(context) * 0.4,
                height: getHeight(context) * 0.17,
                child: SvgPicture.asset(
                  'assets/icons/user_created_icon.svg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Account Created Successfully',
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
                'The Account has been succesfully created and you will be taken to the Home page in a few seconds',
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
