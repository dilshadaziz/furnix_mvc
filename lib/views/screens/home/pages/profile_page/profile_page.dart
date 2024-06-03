import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/address/address.bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/bloc/user/user.bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/auth/pages/login_screen.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/custom_profile_appbar.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/profile_items.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../models/user_model.dart';
import 'widgets/profile_and_text.dart';

class ProfilePage extends StatelessWidget {
  UserModel user;
  ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    print(user.toMap());
    final authBloc = context.read<AuthBloc>();
    final addressBloc = context.read<AddressBloc>();
    final userBloc = context.read<UserBloc>();

    return Scaffold(
      appBar: customProfileAppBar(context),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, userState) {
          if(userState is UserLoaded){
            user = userState.user;
            debugPrint('userLoaded ${user.location}');
          }
        },
        builder: (context,state) => BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthUnauthenticated) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              scrollBehavior: ScrollConfiguration.of(context)
                  .copyWith(physics: const BouncingScrollPhysics()),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(children: [
                    profilePicAndText(userBloc: userBloc, user: user),
                    profileItems(authBloc, addressBloc, context,user)
                  ]),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
