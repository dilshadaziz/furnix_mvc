import 'package:flutter/material.dart';

Row continueWithDivider() {
    return const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Divider()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text('or Continue with')),
                  Expanded(child: Divider()),
                ],
              );
  }