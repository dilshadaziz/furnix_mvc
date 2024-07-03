import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/order/order_bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:lottie/lottie.dart';

Widget addToCartButton({
  required VoidCallback onTap,
  required String text,
  required double buttonWidth,
  double? buttonHeight,
}) {
  return BlocBuilder<OrderBloc, OrderState>(
    builder: (context, state) {
      return ElevatedButton(
      onPressed: isLoadingState(state) ? null : onTap,
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
          fixedSize: MaterialStatePropertyAll(buttonHeight != null ? Size(buttonWidth,buttonHeight) : null),
          backgroundColor: MaterialStatePropertyAll(
            FColors.primaryColor,
          ),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
      child: isLoadingState(state)
                ? Lottie.asset('assets/lottie_animation/loading.json',
                    width: getWidth(context) * 0.1) : Text(
        text,
        style:
            TextStyle(color: FColors.secondaryColor, fontWeight: FontWeight.bold),
      ),
    );
    },
  );
}

bool isLoadingState(OrderState state){
  return true;
}