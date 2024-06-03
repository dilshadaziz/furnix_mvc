import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnix_store/bloc/address/address.bloc.dart';
import 'package:furnix_store/models/address_model.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';

ListView listAddressess(AddressBloc addressBloc, int selectedAddressIndex,
    List<AddressModel> addresses, String userId) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: addresses.length,
    itemBuilder: (context, index) {
      return individualAddress(
        addressBloc,
        index,
        selectedAddressIndex,
        addresses,
        context,
        userId,
      );
    },
  );
}

Dismissible individualAddress(
    AddressBloc addressBloc,
    int index,
    int selectedAddressIndex,
    List<AddressModel> addresses,
    BuildContext context,
    String userId) {
  return Dismissible(
    key: Key(addresses[index].toString()),
    onUpdate: (update) {
      update.progress;
    },
    background: Container(
      alignment: Alignment.centerLeft,
      color: Colors.blue.shade200,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(Icons.edit_calendar_outlined),
      ),
    ),
    secondaryBackground: Container(
      alignment: Alignment.centerRight,
      color: Colors.red,
      child: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(Icons.delete_forever_outlined, color: Colors.white)),
    ),
    // confirmDismiss: (direction) async{
    // return showCupertinoDialog(context: context, builder: (context){
    //   return CupertinoAlertDialog(content: Text('do you want to update?'),);
    // });
    // },
    onDismissed: (direction) {
      if (direction == DismissDirection.startToEnd) {
        
      } else {
        addressBloc.add(RemoveAddressRequested(index: index));
        addresses.removeAt(index);
        addressBloc.add(FetchAddressRequested(userId: userId));
      }
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            addressBloc.add(ChangeSelectedAddressRequested(index: index));
          },
          child: ListTile(
            selected: index == selectedAddressIndex,
            selectedTileColor: FColors.primaryBgColor,
            selectedColor: Colors.black87,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/address_outlined_icon.svg'),
              ],
            ),
            title: Text(
              addresses[index].name,
              style: TextStyle(
                  fontSize: getWidth(context) * 0.037,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              addresses[index].location,
              style: TextStyle(
                  color: FColors.onBoardingSubTitleColor.withOpacity(0.6),
                  fontWeight: FontWeight.w500),
            ),
            trailing: Radio(
              // Use index as the value for the radio button
              value: index,
              groupValue: selectedAddressIndex,

              onChanged: (value) {
                addressBloc
                    .add(ChangeSelectedAddressRequested(index: value as int));
              },
              activeColor: FColors.primaryColor,
            ),
          ),
        ),
        Divider(
          indent: getWidth(context) * 0.03,
          endIndent: getWidth(context) * 0.03,
        ),
      ],
    ),
  );
}
