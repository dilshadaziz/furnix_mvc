// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:furnix_store/features/auth/data/data_sources/remote_data_source/remote_data_source.dart';
// import 'package:furnix_store/features/auth/domain/entities/user/user_entity.dart';
// import 'package:furnix_store/models/user_model.dart';
// import 'package:furnix_store/utils/constants/firebase_consts.dart';
// import 'package:furnix_store/utils/constants/toasts.dart';

// class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
//   final FirebaseFirestore firebaseFirestore;
//   final FirebaseAuth firebaseAuth;

//   FirebaseRemoteDataSourceImpl({required this.firebaseFirestore, required this.firebaseAuth});


//   @override
//   Future<void> createUser(UserEntity user) async{
//     final userCollection = firebaseFirestore.collection(FirebaseConsts.users);
//     final uid = await getCurrentUid();
//     print('inside rmote data source $uid');
//     userCollection.doc(uid).get().then((userDoc) {
//       final newUser = UserModel(
//         email: user.email,
//         fullName: user.fullName,
//         location: user.location,
//         profileUrl: user.profileUrl,
//         uid:  uid,
//         password: user.password
//       ).toJson();

//       if(!userDoc.exists){
//          userCollection.doc(uid).set(newUser);
//       }
//       else{
//         userCollection.doc(uid).update(newUser);
//       }
//     }).catchError((error) {
//       toast("Some error occured");
//     });
//   }

//   @override
//   Future<String> getCurrentUid() async {
//     return firebaseAuth.currentUser.uid;
//   } 

//   @override
//   Stream<List<UserEntity>> getSingletUser(String uid) {
//     final userCollection = firebaseFirestore.collection(FirebaseConsts.users).where("uid",isEqualTo: uid).limit(1);
//     return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList());
//   }

//   @override
//   Stream<List<UserEntity>> getUsers(UserEntity user) {
//     final userCollection = firebaseFirestore.collection(FirebaseConsts.users);
//     return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList());
//   }

//   @override
//   Future<bool> isSignedIn() async => firebaseAuth.currentUser?.uid != null;

//   @override
//   Future<void> signInWithEmailAndPassword(UserEntity user) async{
//     try {
//       if(user.email.isNotEmpty || user.password!.isNotEmpty) {
//         await firebaseAuth.signInWithEmailAndPassword(email: user.email,password: user.password!);
//       }
//       else{
//         print('Fields can not be empty');
//       }
//     } on FirebaseAuthException catch (e) {
//       if(e.code == "user-not-found") {
//         toast('User not found');
//       }
//       else if(e.code == "wrong-password"){
//         toast("Invalid phoneNumber or password");
//       }
//     }
//   }

//   @override
//   Future<void> signOut() async{
//     await firebaseAuth.signOut();
//   }

//   @override
//   Future<void> signUpWithEmailAndPassword(UserEntity user) async {
//     try {
//       firebaseAuth.createUserWithEmailAndPassword(email: user.email!, password: user.password!).then((value) async{
//         print('outside of not null : ${value.user?.uid}');
//         if(value.user?.uid != null) {
//           print(value.user?.uid);
//           await createUser(user);
//         }
//       });
//       return;
//     } on FirebaseAuthException catch (e) {
//       if(e.code == "email-already-in-use"){
//         toast('Email already exist');
//       }else{
//         toast("something went wrong");
//       }
//     }
//   }

//   @override
//   Future<void> updateUser(UserEntity user) async {
//     final userCollection = firebaseFirestore.collection(FirebaseConsts.users);
//     Map<String, dynamic> userInformation = Map();


//     if(user.fullName != '' && user.fullName != null) userInformation['fullName'] = user.fullName;
//     if(user.profileUrl != '' && user.profileUrl != null) userInformation['profileUrl'] = user.profileUrl;
//     if(user.location != '' && user.location != null) userInformation['location'] = user.location;
//     userCollection.doc(user.uid).update(userInformation);
//   }

// }