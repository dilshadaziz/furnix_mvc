import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/content_divider.dart';
import 'package:furnix_store/views/widgets/expanded_elevated_button.dart';

BottomSheet logoutBottomSheet() {
    return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: getWidth(context) * 0.06,
                          fontWeight: FontWeight.bold,
                          color: FColors.primaryColor),
                    ),
                    ContentDivider(
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87.withOpacity(0.74)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        expandedElevatedButton(
                            text: 'Cancel',
                            context: context,
                            cancelButton: true,
                            onTap: () {
                              Navigator.of(context).pop();
                            }),
                        SizedBox(
                          width: getWidth(context) * 0.03,
                        ),
                        expandedElevatedButton(
                            text: 'Yes,Logout',
                            context: context,
                            cancelButton: false,
                            onTap: () {
                              Navigator.of(context)
                                  .pop(); // Close the bottom sheet
                              context
                                  .read<AuthBloc>()
                                  .add(LogoutRequested()); // Trigger logouts
                            })
                      ],
                    ),
                  ],
                ),
              );
            });
  }