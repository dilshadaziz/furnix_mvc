import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:furnix_store/models/address_model.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/utils/constants/firebase_consts.dart';
import 'package:furnix_store/utils/constants/toasts.dart';

class FirebaseUserService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel> getUser({String? userId}) async {
    final firebase_auth.User? firebaseUser = _auth.currentUser;
    final uid = userId ?? firebaseUser!.uid;
    if (firebaseUser != null) {
      // Assuming user details are stored in Firestore
      final userDoc =
          await firebaseFirestore.collection('users').doc(uid).get();
      return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
    }
    throw Exception('No user logged in');
  }

  Future<bool> getUserWithEmail({required String email}) async {
    final userValid = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    return userValid.docs.isNotEmpty;
  }

  Future<void> saveUserDetails(
      {required UserModel user, required String userId}) async {
    final userCollection = firebaseFirestore.collection(FirebaseConsts.users);
    print('Saving details to DB');
    await userCollection.doc(userId).get().then((userDoc) {
      final newUser = UserModel(
        email: user.email,
        fullName: user.fullName,
        location: user.location,
        profileUrl: user.profileUrl,
        uid: userId,
        password: user.password,
        addresses: [],
        // mobileNumber: ''
      ).toMap();

      if (!userDoc.exists) {
        userCollection.doc(userId).set(newUser);
      }
    }).catchError((error) {
      toast("Some error occured");
    });
  }

  Future<void> addAddress(
      String userId, Map<String, dynamic> newAddress) async {
    final userCollection = firebaseFirestore.collection(FirebaseConsts.users);

    // Retrieve the user document from Firestore
    final userRef = userCollection.doc(userId);

    // Get the existing list of addresses or initialize an empty list
    final addresses = await userCollection
        .doc(userId)
        .get()
        .then((value) => value.data()!['addresses'] as List<dynamic>);
    addresses.add(newAddress);
    // Update the 'addresses' field in the user document
    await userRef.update({'addresses': addresses});
    debugPrint("add added succesfully");
  }

  Future<List<AddressModel>?> fetchAddress(String userId) async {
    final userCollection = firebaseFirestore.collection(FirebaseConsts.users);

    // Retrieve the user document from Firestore
    // final userRef = userCollection.doc(userId);

    // Get the existing list of addresses or initialize an empty list
    final addresses = await userCollection
        .doc(userId)
        .get()
        .then((value) => value.data()!['addresses'] as List<dynamic>);
    if (addresses.isNotEmpty) {
      print('adding address model');
      // print(addresses[0]['address']);
      final List<AddressModel> addressList =
          addresses.map((e) => AddressModel.fromMap(e)).toList();

      return addressList;
    }

    return null;
  }

  Future<void> addProfileImage(String profileImageUrl, String userId) async {
    final userCollection = firebaseFirestore.collection(FirebaseConsts.users);
    final userRef = userCollection.doc(userId);
    try {
      await userRef.update({'profileUrl': profileImageUrl});
    } catch (_) {
      toast('Erro adding profile picture');
    }
  }

  Future<void> removeAddress({
    required int index,
    required String userId,
  }) async {
    final userCollection =
        FirebaseFirestore.instance.collection(FirebaseConsts.users);
    final userRef = userCollection.doc(userId);

    try {
      // Fetch the user document
      final documentSnapshot = await userRef.get();

      // Check if document exists and has addresses
      if (documentSnapshot.exists &&
          documentSnapshot.data()!.containsKey('addresses')) {
        final List<dynamic> addresses = documentSnapshot.data()!['addresses'];

        // Validate index
        if (index >= 0 && index < addresses.length) {
          // Remove address at specified index
          addresses.removeAt(index);

          // Update the user document with modified addresses
          await userRef.update({'addresses': addresses});
        } else {
          toast('Invalid index: $index. Address list size: ${addresses.length}');
        }
      } else {
        toast('User document does not exist or does not have an "addresses" field.');
      }
    } on FirebaseException catch (e) {
      // Handle Firebase-specific errors (e.g., network issues, permission errors)
      print('Firebase error: ${e.code} - ${e.message}');
    } catch (e) {
      // Handle other exceptions (e.g., index out of bounds, document not found)
      print('Error removing address: $e');
    }
  }

Future<void> editProfile({required UserModel user}) async {
  final userCollection = FirebaseFirestore.instance.collection(FirebaseConsts.users);
  final userRef = userCollection.doc(user.uid);

  try {
    await userRef.update({
      'location': user.location,
      'fullName': user.fullName,
    });
    // Success handling (optional)
    toast('Profile updated successfully!');
  } on FirebaseException catch (e) {
    // Handle specific Firebase exceptions
    if (e.code == 'permission-denied') {
      toast('You don\'t have permission to update this profile.');
    } else {
      // Handle other Firebase exceptions generically
      toast('An error occurred while updating the profile: ${e.message}');
    }
  } catch (e) {
    // Catch any other unexpected exceptions
    toast('An unexpected error occurred: $e');
  }
}

}
