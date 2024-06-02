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
    await _userService.addAddress(userId, newAddress);
  }

  Future<List<AddressModel>?> fetchAddress(String userId) async{
    return await _userService.fetchAddress(userId);
  }
}
