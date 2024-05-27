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
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get();
      return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
    }
    throw Exception('No user logged in');
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
              password: user.password)
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
}
