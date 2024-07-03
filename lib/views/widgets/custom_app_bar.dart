import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  required String title,
  AuthBloc? authBloc,
}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(getHeight(context) * 0.06),
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: IconButton(
                  onPressed: () {
                    if (title == 'Send Verification') {
                      authBloc!.add(AuthNavigateToSignUpRequested());
                    }
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: FColors.primaryColor,
                  )),
              centerTitle: true,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
          ],
        );
      }));
}
