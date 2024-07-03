
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/auth/widgets/elevated_Button.dart';
import 'package:furnix_store/views/screens/auth/widgets/register_succeed_popup.dart';
import 'package:furnix_store/views/screens/home/main_screen.dart';
import 'package:furnix_store/views/widgets/custom_app_bar.dart';

class SendVerificationPage extends StatelessWidget {
  final UserModel user;
   const SendVerificationPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    String cautionText = 'Make sure the entered email address is valid and ready to recieve notifications';
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthEmailVerificationSuccess) {
        accountCreatedPopup(context);
      }
      if(state is AuthEmailVerificationSended){
        // show snackbar message
      }
      if (state is AuthEmailVerificationFailed) {
        // Show snackBar to verify the email through from the gmail app
        debugPrint(state.message);
      }
      if(state is AuthAuthenticated){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainScreenBody(user: state.user,),), (route) => false);
        
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: customAppBar(context: context, title: 'Send Verification',authBloc:authBloc),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getHeight(context) * 0.4,
                  width: getWidth(context),
                  child: Image.asset(
                    'assets/images/auth/OTP_page_original_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getWidth(context) * 0.1,
                      right: getWidth(context) * 0.1),
                  child: Text(
                    cautionText,
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
                    padding:
                        const EdgeInsets.only(left: 20, top: 25, bottom: 25),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: getWidth(context) * 0.1,
                          backgroundColor:
                              FColors.primaryColor.withOpacity(0.2),
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
                                  color: FColors.onBoardingTitleColor
                                      .withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: getWidth(context) * 0.04),
                            ),
                            Text(
                              user.email,
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
                      if (state is AuthEmailVerificationSended) {
                        authBloc.add(VerifyEmailRequested(email: state.email));
                      } else {
                        print('send ');
                        authBloc
                            .add(SendEmailVerificationRequested(email: user.email));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
