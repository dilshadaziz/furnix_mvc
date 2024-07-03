import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';

class SearchBarField extends StatefulWidget {
  const     SearchBarField({super.key});

  @override
  State<SearchBarField> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(),
      selectionHeightStyle: BoxHeightStyle.tight,
      decoration: InputDecoration(border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        
        
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: FColors.primaryColor,width: 1.5)
      ),
      hintText: 'Search...',
      prefixIcon: const Icon(Icons.search_rounded),
      contentPadding: const EdgeInsets.only(left: 20,right: 20)
      ),
    );
  }
}
