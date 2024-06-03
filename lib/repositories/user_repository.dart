import 'package:flutter/material.dart';
import 'package:furnix_store/models/address_model.dart';
import 'package:furnix_store/services/user/firebase_user.service.dart';

import '../models/user_model.dart';

class UserRepository {
  final FirebaseUserService _userService = FirebaseUserService();

  Future<UserModel> fetchUser({String? userId}) async {
    return await _userService.getUser(userId: userId);
  }

  Future<void> addAddress(
      String userId, Map<String, dynamic> newAddress) async {
        debugPrint('add address fn in repo');
    await _userService.addAddress(userId, newAddress);
  }

  Future<List<AddressModel>?> fetchAddress(String userId) async{
    return await _userService.fetchAddress(userId);
  }
  Future<void> addProfileImage({required String profileImageUrl,required String userId}) async{
    await _userService.addProfileImage(profileImageUrl, userId);
  }

  Future<void> removeAddress(int index,String userId) async{
    await _userService.removeAddress(index:index,userId: userId);
  }

  Future<void> editProfile({required UserModel user}) async{
    await _userService.editProfile(user:user);
  }
}
