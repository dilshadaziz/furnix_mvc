
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/address/address.bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/models/address_model.dart';
import 'package:furnix_store/utils/constants/toasts.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/add_delivery_address_button.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/list_addressess.dart';
import 'package:furnix_store/views/widgets/custom_app_bar.dart';

class MyAddressPage extends StatefulWidget {
  final String userId;
  MyAddressPage({super.key, required this.userId});

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  @override
  Widget build(BuildContext context) {
    int selectedAddressIndex = 0;
    final addressBloc = context.read<AddressBloc>();
    final authBloc = context.read<AuthBloc>();
    List<AddressModel> addresses = [];

    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Delivery Address',
        authBloc: authBloc,
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state is AddressLoaded) {
            addresses = state.addresses;
          }
          if (state is AddressAdded) {
            toast('Address added');
            addressBloc.add(FetchAddressRequested(userId: widget.userId));
            Navigator.of(context).pop();
          }
          if (state is AddressRemovedSuccessfully) {
            toast('Address successfully removed');
          }
          if (state is AddressInitial) {
            debugPrint('inital page');
            addressBloc.add(FetchAddressRequested(userId: widget.userId));
          }
          if (state is AddressChanged) {
            selectedAddressIndex = state.index;
            addressBloc.add(FetchAddressRequested(userId: widget.userId));
          }
        },
        builder: (context, state) {
          debugPrint('current $state');
          

          

          return Column(
            children: [
              Visibility(
                  visible: addresses.isNotEmpty,
                  child: listAddressess(addressBloc, selectedAddressIndex,
                      addresses, widget.userId)),
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
}
