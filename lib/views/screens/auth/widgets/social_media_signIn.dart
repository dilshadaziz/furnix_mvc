import 'package:furnix_store/utils/device/devices.dart';
import 'package:flutter/material.dart';

Row socialMediaSignIn(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/logos/Facebook_logo.png',
                        height: getWidth(context) * 0.08,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/logos/Apple_logo_black.png',
                        height: getWidth(context) * 0.08,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/logos/Google_logo.png',
                        height: getWidth(context) * 0.08,
                      ),
                    ),
                  ),
                ],
              );
  }