import 'package:flutter/material.dart';
import 'package:furnix_store/models/user_model.dart';

class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Home'),),
    );
  }
}