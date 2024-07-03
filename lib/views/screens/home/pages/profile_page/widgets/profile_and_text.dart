// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/user/user.bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';

class ProfilePicAndText extends StatelessWidget {
  ProfilePicAndText({
    super.key,
    required this.userBloc,
    required this.user,
  });

  final UserBloc userBloc;
  UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context,state){
         if (state is EditProfileSuccess) {
          // userBloc.add(FetchUser());
        }
        if(state is UserLoaded){
         debugPrint('hey ${state.user.location}');
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onTap: () => userBloc.add(GetImageRequested()),
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: backgroundImage(state: state, user: user),
                    radius: getWidth(context) * 0.2,
                    backgroundColor: FColors.primaryBgColor,
                  ),
                  const Positioned(
                          right: 10,
                          bottom: 10,
                          child: CircleAvatar(
                            backgroundColor: FColors.secondaryColor,
                            child: Icon(Icons.add_a_photo_outlined),
                          ),
                        )
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state is UserLoaded ? state.user.fullName : user.fullName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  state is UserLoaded ? state.user.location :user.location,
                  style: TextStyle(
                    color: FColors.onBoardingSubTitleColor.withOpacity(0.4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getHeight(context) * 0.07,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  NetworkImage? backgroundImage(
      {required UserState state, required UserModel user}) {
    return state is UserLoaded
        ? NetworkImage('${state.user.profileUrl}') :
        state is UserLoading
            ? null
        : user.profileUrl != null
            ? NetworkImage(user.profileUrl!)
            : null;
  }
}