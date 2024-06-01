import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnix_store/bloc/address/address.bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/services/user/firebase_user.service.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/add_delivery_address_button.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/list_addressess.dart';
import 'package:furnix_store/views/widgets/custom_app_bar.dart';

class MyAddressPage extends StatelessWidget {
  MyAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedAddressIndex = 0;
    final addressBloc = context.read<AddressBloc>();
    final authBloc = context.read<AuthBloc>();
    
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Delivery Address',
        authBloc: authBloc,
      ),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state is AddressChanged) {
            selectedAddressIndex = state.index;
          }

          return Column(
            children: [
              Visibility(visible: addresses.isNotEmpty,child: listAddressess(addressBloc, selectedAddressIndex, addresses)),
              SizedBox(
                height: getHeight(context) * 0.03,
              ),
              addNewAddressButton(context),
            ],
          );
        },
      ),
    );
  }

  

// Sample addresses data
  List<Map<String, String>> addresses = [
    {
      'name': 'Home',
      'address':
          'Kurungottu ho,Nochad po, Naduvannur via,Kozhikode, Kerala - 673614',
    },
    {
      'name': 'Office',
      'address':
          'Kurungottu ho,Nochad po, Naduvannur via,Kozhikode, Kerala - 673614',
    },
    // Add more addresses here if needed
  ];
}
