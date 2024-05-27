import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/constants/screen_texts.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/auth/widgets/elevated_Button.dart';
import 'package:furnix_store/views/screens/on_boarding/widgets/texts.dart';
import 'package:furnix_store/views/widgets/custom_app_bar.dart';
import 'package:ionicons/ionicons.dart';

class SendVerificationPage extends StatelessWidget {
  final String email = 'dilshadazim910@gmail.com';
  const SendVerificationPage({
    super.key,
    // required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Send Verification'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: getWidth(context) * 0.1,
          // ),
          SizedBox(
            height: getHeight(context) * 0.4,
            width: getWidth(context),
            child: Image.asset(
              'assets/images/auth/OTP_page_original_image.png',
              fit: BoxFit.cover,
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: EdgeInsets.only(
                left: getWidth(context) * 0.1, right: getWidth(context) * 0.1),
            child: Text(
              'Make sure the entered email address is valid and ready to recieve notifications',
              style: TextStyle(
                  fontSize: getWidth(context) * 0.04,
                  fontWeight: FontWeight.w500,
                  color: FColors.onBoardingSubTitleColor),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: FColors.primaryColor)),
              padding: const EdgeInsets.only(left: 20, top: 25, bottom: 25),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: getWidth(context) * 0.1,
                    backgroundColor: FColors.primaryColor.withOpacity(0.2),
                    child: Icon(
                      CupertinoIcons.mail_solid,
                      color: FColors.primaryColor,
                      size: getWidth(context) * 0.07,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Via E-mail address :',
                        style: TextStyle(
                            color:
                                FColors.onBoardingTitleColor.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: getWidth(context) * 0.04),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                            color: FColors.onBoardingSubTitleColor
                                .withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                            fontSize: getWidth(context) * 0.035),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: elevatedButton(
              text: 'Send OTP',
              context: context,
              onTap: () {
                // Send verification link to the email
                authBloc.add(SendEmailVerificationRequested(email: email));
              },
            ),
          ),
        ],
      ),
    );
  }
}
