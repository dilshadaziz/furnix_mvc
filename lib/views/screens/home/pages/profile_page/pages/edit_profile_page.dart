// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/user/user.bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/auth/widgets/elevated_Button.dart';
import 'package:furnix_store/views/widgets/custom_app_bar.dart';
import 'package:furnix_store/views/widgets/edit_form_field_container.dart';

class EditProfilePage extends StatelessWidget {
  UserModel user;
  EditProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final locationController = TextEditingController();
    final userBloc = context.read<UserBloc>();
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if(state is UserLoaded){
          user = state.user;
        }
        if(state is EditProfileSuccess){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAppBar(
            context: context,
            title: 'Edit Profile',
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getHeight(context) * 0.02,
                  ),
                  GestureDetector(
                    onTap: () => userBloc.add(GetImageRequested()),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: backgroundImage(
                              state: state, user: user, context: context),
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
                  SizedBox(
                    height: getHeight(context) * 0.03,
                  ),
                  EditFormContainerWidget(
                    icon: Icons.person_2_outlined,
                    hintText: 'Full name',
                    controller: fullNameController,
                    inputType: TextInputType.name,
                    isPassword: false,
                    previousValue: user.fullName,
                  ),
                  SizedBox(
                    height: getHeight(context) * 0.03,
                  ),
                  EditFormContainerWidget(
                    icon: Icons.location_on_outlined,
                    hintText: 'Location',
                    controller: locationController,
                    inputType: TextInputType.streetAddress,
                    isPassword: false,
                    previousValue: user.location,
                    fetchLocation: true,
                  ),
                  elevatedButton(
                      text: 'Update Profile',
                      context: context,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          final updatedUser = UserModel(uid: user.uid, fullName: fullNameController.text, email: user.email, location: locationController.text, password: user.password, addresses: user.addresses);
                          userBloc.add(EditProfileRequested(
                            user: updatedUser,

                          ));
                        }
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  NetworkImage? backgroundImage(
      {required UserState state,
      required UserModel user,
      required BuildContext context}) {
    return state is UserLoaded
        ? NetworkImage('${state.user.profileUrl}')
        : state is UserLoading
            ? null
            :  state is EditProfileLoading ? NetworkImage('${user.profileUrl}') : user.profileUrl != null
                ? NetworkImage(user.profileUrl!)
                : null;
  }
}
