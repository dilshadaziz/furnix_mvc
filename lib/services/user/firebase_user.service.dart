import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/utils/constants/firebase_consts.dart';
import 'package:furnix_store/utils/constants/toasts.dart';

class FirebaseUserService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel> getUser() async {
    final firebase_auth.User? firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      // Assuming user details are stored in Firestore
      final userDoc = await firebaseFirestore.collection('users').doc(firebaseUser.uid).get();
      return UserModel.fromMap(userDoc.data() as Map<String,dynamic>);
    }
    throw Exception('No user logged in');
  }

  Future<bool> getUserWithEmail({required String email}) async {
    final userValid = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email).limit(1).get();
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
              )
          .toMap();

      if (!userDoc.exists) {
        userCollection.doc(userId).set(newUser);
      } else {
        userCollection.doc(userId).update(newUser);
      }
    }).catchError((error) {
      toast("Some error occured");
    });
  }


  Future<void> addAddress(String userId, Map<String,dynamic> newAddress) async {
    final userCollection = firebaseFirestore.collection(FirebaseConsts.users);
    final userRef = userCollection.doc(userId);
  final addresses = await userCollection.doc(userId).get().then((value) =>
    value.data()!['addresses'] as List<dynamic>);
    addresses.add(newAddress);
    await userRef.update({'addresses' : addresses});
    print(addresses);
    // print(userRef.get().then((value) => value.data()));
    // user.add(newAddress);
  // Retrieve the user document from Firestore
  // DocumentSnapshot userSnapshot = await userRef.get();

  // Get the existing list of addresses or initialize an empty list
  // final addresses = await userSnapshot.data()!.toString() ?? [];
  // List<Map<String, dynamic>> existingAddresses = jsonDecode();

  // Add the new address to the existing list
  // existingAddresses.add(newAddress);

  // Update the 'addresses' field in the user document
  // await userRef.update({
  //   'addresses': existingAddresses,
  // });
}
}
