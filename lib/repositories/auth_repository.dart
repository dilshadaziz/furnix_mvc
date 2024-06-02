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

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.providerData.any((provider) => provider.providerId == 'google.com')) {
      // Existing Google user, retrieve user details
      final existingUser = await _userService.getUser(userId:currentUser.uid);
      if (existingUser != null) {
        print('User already signed in with Google. Returning existing user data.');
        return existingUser; // Return existing user data
      }
    }


    final result =  await _authService.signInWithGoogle();
    String userId = FirebaseAuth.instance.currentUser!.uid;

    await _userService.saveUserDetails(user: result, userId: userId);

    return result;
  }

  Future<void> signInWithFacebook() async{
    await _authService.signInWithFacebook();
  }

  Future<void> sendEmailVerificationLink()async{
    await _authService.sendEmailVerification();
  }
  Future<bool> checkVerifiedOrNot()=> _authService.checkVerifiedOrNot();
  Future<String> forgotPassword({required String email}) async{
    final String result = await _authService.forgotPassword(email: email);
    return result;
  }

  Future<void> logout() async {
    return await _authService.logout();
  }
  void getCurrentUser(){
    _authService.getCurrentUser();
  }
   User? checkUserAlreadyLoggedIn() {
    return _authService.checkUserAlreadyLoggedIn();
  }
}
