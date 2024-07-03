import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';

Widget locationDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Text(
        'Location',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
      Row(
        children: [
          const Icon(Icons.location_on_outlined,color: FColors.primaryColor,size: 17,),
          Text(
            'Kakkanchery,Malappuram,Kerala',
            style: TextStyle(
              color: Colors.black87.withOpacity(0.8),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
      SizedBox(height: 10,)
    ],
  );
}
