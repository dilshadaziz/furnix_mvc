import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/services/auth/firebase_auth.service.dart';
import 'package:furnix_store/services/user/firebase_user.service.dart';

class AuthRepository {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirebaseUserService _userService = FirebaseUserService();

  Future<String?> login(String email, String password) async {
    print('authrepository login');
    try {
      final String? uid = await _authService.login(email, password);
      return uid;
    } catch (e) {
      debugPrint('error in repo ${e.toString()}');
      return null;
    }
  }

  Future<String> signup({
    required UserModel user,
  }) async {
      // Call the signup method from FirebaseAuthService
      final result = await _authService.signup(user.email, user.password);

      if (result == 'user created') {
        // Get the current user ID
        String userId = FirebaseAuth.instance.currentUser!.uid;

        // Save additional user details to the Firebase database
        await _userService.saveUserDetails(user: user, userId: userId);
      }
      else{
        print(result);
      }
      
      return result;
  }
  Future<UserModel> signInWithGoogle() async{
    return await _authService.signInWithGoogle();
  }
  Future<void> sendEmailVerificationLink()async{
    await _authService.sendEmailVerification();
  }
  Future<bool> checkVerifiedOrNot()=> _authService.checkVerifiedOrNot();

  Future<void> logout() async {
    return await _authService.logout();
  }
  void getCurrentUser(){
    _authService.getCurrentUser();
  }
}
