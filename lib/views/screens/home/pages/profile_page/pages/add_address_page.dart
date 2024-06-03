import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/address/address.bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/services/auth/firebase_auth.service.dart';
import 'package:furnix_store/services/user/firebase_user.service.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/constants/toasts.dart';
import 'package:furnix_store/views/screens/auth/widgets/elevated_Button.dart';
import 'package:furnix_store/views/screens/auth/widgets/text_form_field.dart';
import 'package:furnix_store/views/widgets/custom_app_bar.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressBloc = context.read<AddressBloc>();
    final nameController = TextEditingController();
    final addressController = TextEditingController();
    final mobileNumberController = TextEditingController();
    final pincodeController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final userId = FirebaseAuthService().getCurrentUser();

    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Add Address',
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AddressAdded) {
            // Address added successfully, navigate back or show success message
            print('address added');
            toast('New address added');
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormContainerWidget(
                      icon: CupertinoIcons.person,
                      hintText: 'Full name',
                      controller: nameController,
                      inputType: TextInputType.name,
                      isPassword: false),
                  const SizedBox(height: 20),
                  FormContainerWidget(
                      icon: CupertinoIcons.phone,
                      hintText: 'Mobile Number',
                      controller: mobileNumberController,
                      inputType: TextInputType.phone,
                      isPassword: false),
                  const SizedBox(height: 20),
                  FormContainerWidget(
                      icon: Icons.location_on_outlined,
                      hintText: 'Location',
                      fetchLocation: true,
                      controller: addressController,
                      inputType: TextInputType.streetAddress,
                      isPassword: false),
                  const SizedBox(height: 20),
                  FormContainerWidget(
                      icon: CupertinoIcons.map_pin_ellipse,
                      hintText: 'Pincode',
                      controller: pincodeController,
                      inputType: TextInputType.number,
                      isPassword: false),
                  const SizedBox(height: 20),
                  elevatedButton(
                      text: 'Add Address',
                      context: context,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          addressBloc.add(AddAddressRequested(
                            userId: userId,
                            name: nameController.text,
                            mobileNumber: mobileNumberController.text,
                            address: addressController.text,
                            pincode: pincodeController.text,
                          ));
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
