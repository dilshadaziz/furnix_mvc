import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _auth.currentUser?.uid;
    } catch (e) {
      if (e == 'wrong-password') {
        debugPrint('Email or password is incorrect');
        return null;
      } else if (e == 'user-not-found') {
        debugPrint('User doesn\'t exist');
        return null;
      } else {
        debugPrint('Something wrong occured during login $e');
        return null;
      }
    }
  }

  Future<String> signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification();
      return 'user created';
    } catch (e) {
      if (e.toString() ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        return 'Email already exists';
      } else {
        return e.toString();
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> sendEmailVerification() async {
    print('sendingg...');
    await _auth.currentUser!.sendEmailVerification();
    print('otp sendedd');
  }
}
