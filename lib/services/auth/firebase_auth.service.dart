import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/services/user/firebase_user.service.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        email: email,
        password: password,
      );
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

  Future<UserModel>  signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // Handle case where user cancels sign-in process
        throw Exception('Google sign-in process cancelled by user');
      }

      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential user = await _auth.signInWithCredential(credential);

      final userModel = UserModel(
          uid: user.user!.uid,
          fullName: user.user!.displayName!,
          email: user.user!.email!,
          profileUrl: user.user!.photoURL,
          location: '',
          password: '',
          addresses: [],
          // mobileNumber: ''
          );
      return userModel;
    } catch (e) {
      // Handle any other exceptions that might occur during the sign-in process
      print('Error signing in with Google: $e');
      rethrow; // Re-throw the caught exception to propagate it up the call stack
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final facebookLoginResult = FacebookAuth.instance;
      final rest = await facebookLoginResult.login();
      print(rest);

      // if (facebookLoginResult.status == LoginStatus.success) {
      //   final OAuthCredential facebookAuthCredential =
      //       FacebookAuthProvider.credential(
      //           facebookLoginResult.accessToken!.tokenString);

      //           final userData = await FacebookAuth.instance.getUserData();

      //   final userCredential =
      //       _auth.signInWithCredential(facebookAuthCredential);
      //   print('facebook user $userCredential');
      // }
    } catch (e) {
      // Handle any other exceptions that might occur during the sign-in process
      print('Error signing in with Facebook: $e');
      rethrow; // Re-throw the caught exception to propagate it up the call stack
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }

  Future<void> sendEmailVerification() async {
    // await _auth.currentUser!.reload();
    print('sendingg...');
    await _auth.currentUser!.sendEmailVerification();
    print('otp sendedd');
  }

  Future<String> forgotPassword({required String email}) async {
    try {
      final bool isValidUser =
          await FirebaseUserService().getUserWithEmail(email: email);

      if (isValidUser) {
        await _auth.sendPasswordResetEmail(email: email);
        return 'reset password link has been sended to you email. please check your inbox';
      }
      else{
        return 'User doesn\'t exist';
      }
    } catch (e) {
      print("$e");
      return e.toString();
    }
  }

  Future<bool> checkVerifiedOrNot() async {
    await _auth.currentUser!.reload();
    print('in auth ${_auth.currentUser}');
    return _auth.currentUser!.emailVerified;
  }

  User getCurrentUser() {
    print(_auth.currentUser!);
    return _auth.currentUser!;
  }
}
