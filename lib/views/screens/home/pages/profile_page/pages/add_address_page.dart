import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/address/address.bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/views/widgets/custom_app_bar.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddressBloc addressBloc = context.read<AddressBloc>();

    String fullName = '';
    String mobileNumber = '';
    String address = '';
    String pincode = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AddressAdded) {
            // Address added successfully, navigate back or show success message
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                onChanged: (value) {
                  fullName = value;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  mobileNumber = value;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                maxLines: 3,
                onChanged: (value) {
                  address = value;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Pincode'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  pincode = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Dispatch AddAddressRequested event with the entered details
                  addressBloc.add(AddAddressRequested(
                    fullName: fullName,
                    mobileNumber: mobileNumber,
                    address: address,
                    pincode: pincode,
                  ));
                },
                child: Text('Add Address'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: FColors.primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
